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

- `/game-sounds` — Show current config (active pack, volume, enabled events)
- `/game-sounds volume <0.0-1.0>` — Set volume level
- `/game-sounds pack <name>` — Switch active sound pack (e.g., warcraft, starcraft)
- `/game-sounds list` — List available sound packs and their sounds
- `/game-sounds toggle <event>` — Enable/disable a specific event category
- `/game-sounds test [category]` — Play a test sound from the given category (default: session-start)

## Implementation

Read and modify the config file at `$CLAUDE_PLUGIN_ROOT/config.json`.

For **volume**: Update the `volume` field (float 0.0 to 1.0).
For **pack**: Update `active_pack` field. Verify the pack directory exists in `$CLAUDE_PLUGIN_ROOT/sounds/`.
For **toggle**: Flip the boolean in `enabled_events.<event>`.
For **test**: Run `bash $CLAUDE_PLUGIN_ROOT/scripts/play-sound.sh <category>`.
For **list**: Scan `$CLAUDE_PLUGIN_ROOT/sounds/` directories and list packs with file counts.

Use the Bash tool to read/write config.json and the Read tool to display current settings.

### Example responses

**Status**: "🎮 Game Sounds: Warcraft pack, volume 0.5, all events enabled"
**Volume change**: "🔊 Volume set to 0.3"
**Pack switch**: "⚔️ Switched to starcraft pack"
