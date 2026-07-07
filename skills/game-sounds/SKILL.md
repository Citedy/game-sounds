---
name: game-sounds
description: Manage game sound effects — change volume, switch sound packs, list available sounds
user_invocable: true
---

# /game-sounds — Game Sound Manager

Manage your game sound effects for Claude Code.

## Usage

When the user invokes `/game-sounds`, parse their arguments and execute the appropriate action:

### Commands

- `/game-sounds` — Show current config (active pack, volume, rotation, enabled events)
- `/game-sounds volume <level>` — Set volume level (`1.0` = the sound file's original loudness; values above `1.0` amplify *louder* than the source, e.g. `2.0` ≈ 2× gain — useful to match louder apps like Slack)
- `/game-sounds pack <name>` — Switch active sound pack (clears rotation)
- `/game-sounds list` — List available sound packs and their sounds
- `/game-sounds rotation add <pack>` — Add a pack to the session rotation list
- `/game-sounds rotation remove <pack>` — Remove a pack from the rotation list
- `/game-sounds rotation` — Show the current rotation list
- `/game-sounds rotation clear` — Clear rotation (reverts to single active_pack)
- `/game-sounds toggle <event>` — Enable/disable a specific event category
- `/game-sounds test [category]` — Play a test sound from the given category (default: session-start)

## Implementation

Read and modify the config file at `$CLAUDE_PLUGIN_ROOT/config.json`.

For **volume**: Update the `volume` field (float ≥ 0.0). Do NOT clamp or reject values above `1.0`. `1.0` means the sound file's original loudness; higher values amplify beyond it (macOS `afplay -v` and Linux PipeWire `pw-play --volume` both accept gain > 1.0). Set exactly what the user asks for. Note: at very high gain (roughly `3.0`+) already-loud clips may start to clip/distort — mention this only if it seems relevant; never refuse the value.
For **pack**: Update `active_pack` field and set `pack_rotation` to `[]`. Verify the pack directory exists in `$CLAUDE_PLUGIN_ROOT/sounds/`.
For **rotation add**: Append pack name to the `pack_rotation` array (if not already present). Verify the pack exists.
For **rotation remove**: Remove pack name from the `pack_rotation` array.
For **rotation clear**: Set `pack_rotation` to `[]`.
For **rotation** (no subcommand): Display the current `pack_rotation` list.
For **toggle**: Flip the boolean in `enabled_events.<event>`.
For **test**: Run `bash $CLAUDE_PLUGIN_ROOT/scripts/play-sound.sh <category>`.
For **list**: Scan `$CLAUDE_PLUGIN_ROOT/sounds/` directories and list packs with file counts.

When `pack_rotation` is non-empty, each new Claude Code session randomly picks one pack from the list for the entire session. Use the Bash tool to read/write config.json and the Read tool to display current settings.

### Example responses

**Status**: "🎮 Game Sounds: Warcraft pack, volume 0.5, rotation: [mario, zelda, starcraft]"
**Volume change**: "🔊 Volume set to 0.3" (or "🔊 Volume set to 2.0 (amplified above source level)")
**Pack switch**: "⚔️ Switched to starcraft pack (rotation cleared)"
**Rotation add**: "🎲 Added mario to rotation (now: mario, zelda)"
**Rotation remove**: "🎲 Removed mario from rotation (now: zelda)"
