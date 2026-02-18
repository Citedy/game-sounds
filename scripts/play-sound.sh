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

# Read config
if [[ ! -f "$CONFIG_FILE" ]]; then
  exit 0
fi

# Parse config with built-in tools (no jq dependency)
VOLUME=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE'))['volume'])" 2>/dev/null || echo "0.5")
ACTIVE_PACK=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE'))['active_pack'])" 2>/dev/null || echo "warcraft")
EVENT_ENABLED=$(python3 -c "import json; c=json.load(open('$CONFIG_FILE')); print(c['enabled_events'].get('$CATEGORY', True))" 2>/dev/null || echo "True")

if [[ "$EVENT_ENABLED" == "False" ]]; then
  exit 0
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
