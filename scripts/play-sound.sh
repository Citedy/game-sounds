#!/usr/bin/env bash
# play-sound.sh — Play a random game sound for a Claude Code event
# Usage: play-sound.sh <category>
# Categories: session-start, task-acknowledge, task-complete, error, permission

set -euo pipefail

CATEGORY="${1:-}"
if [[ -z "$CATEGORY" ]]; then
  exit 0
fi

# Resolve plugin root
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
CONFIG_FILE="$PLUGIN_ROOT/config.json"
HELPER="$PLUGIN_ROOT/scripts/config-helper.py"

# Read config
if [[ ! -f "$CONFIG_FILE" ]]; then
  exit 0
fi

cfg() { python3 "$HELPER" "$CONFIG_FILE" "$@" 2>/dev/null; }

VOLUME=$(cfg get volume 0.5 || echo "0.5")
ACTIVE_PACK=$(cfg get active_pack warcraft || echo "warcraft")
EVENT_ENABLED=$(cfg event-enabled "$CATEGORY" || echo "True")

if [[ "$EVENT_ENABLED" == "False" ]]; then
  exit 0
fi

# Session-based pack rotation
SESSION_FILE="/tmp/game-sounds-session-$PPID"

if [[ "$CATEGORY" == "session-start" ]]; then
  # On session start, pick a random pack from rotation (if configured)
  PICKED=$(cfg rotation-pick || echo "")
  [[ -n "$PICKED" ]] && ACTIVE_PACK="$PICKED"

  # Write chosen pack to session file so all events in this session use it
  echo "$ACTIVE_PACK" > "$SESSION_FILE"

  # Cleanup stale session files (older than 24h)
  find /tmp -maxdepth 1 -name "game-sounds-session-*" -mmin +1440 -delete 2>/dev/null || true
elif [[ -f "$SESSION_FILE" ]]; then
  # Non-session-start events: use the pack chosen at session start
  SESSION_PACK=$(cat "$SESSION_FILE" 2>/dev/null || echo "")
  [[ -n "$SESSION_PACK" ]] && ACTIVE_PACK="$SESSION_PACK"
fi

# Find sound files
SOUND_DIR="$PLUGIN_ROOT/sounds/$ACTIVE_PACK/$CATEGORY"
if [[ ! -d "$SOUND_DIR" ]]; then
  exit 0
fi

# Collect all mp3/wav/ogg files
SOUNDS=()
while IFS= read -r -d '' f; do
  SOUNDS+=("$f")
done < <(find "$SOUND_DIR" -type f \( -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" \) -print0 2>/dev/null)
if [[ ${#SOUNDS[@]} -eq 0 ]]; then
  exit 0
fi

# No-repeat: avoid playing the same sound twice in a row
LAST_PLAYED_FILE="/tmp/game-sounds-last-$CATEGORY"
LAST_PLAYED=""
if [[ -f "$LAST_PLAYED_FILE" ]]; then
  LAST_PLAYED=$(cat "$LAST_PLAYED_FILE" 2>/dev/null || true)
fi

# Pick a random sound, avoiding last played if possible
if [[ ${#SOUNDS[@]} -gt 1 ]]; then
  ATTEMPTS=0
  while true; do
    IDX=$((RANDOM % ${#SOUNDS[@]}))
    SOUND="${SOUNDS[$IDX]}"
    if [[ "$SOUND" != "$LAST_PLAYED" ]] || [[ $ATTEMPTS -ge 5 ]]; then
      break
    fi
    ATTEMPTS=$((ATTEMPTS + 1))
  done
else
  SOUND="${SOUNDS[0]}"
fi

# Save last played
echo "$SOUND" > "$LAST_PLAYED_FILE"

# Play sound (background, non-blocking)
if command -v afplay &>/dev/null; then
  # macOS
  afplay -v "$VOLUME" "$SOUND" &
elif command -v paplay &>/dev/null; then
  # Linux (PulseAudio) — paplay doesn't support volume flag easily, use pw-play
  paplay "$SOUND" &
elif command -v pw-play &>/dev/null; then
  # Linux (PipeWire)
  pw-play --volume "$VOLUME" "$SOUND" &
elif command -v ffplay &>/dev/null; then
  # Fallback: ffplay
  ffplay -nodisp -autoexit -volume "$(python3 -c "print(int($VOLUME * 100))")" "$SOUND" &>/dev/null &
fi

exit 0
