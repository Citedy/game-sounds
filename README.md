# @citedy/game-sounds

Game sound effects for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — hear Warcraft Peon voice lines as you code!

**"Work work!"** when you submit a prompt. **"Job's done!"** when the task completes. **"Stop poking me!"** on errors.

## Install

```bash
claude plugin add github:Citedy/game-sounds
```

<details>
<summary>Alternative install methods</summary>

```bash
# npm
npm i -g @citedy/game-sounds
claude --plugin-dir $(npm root -g)/@citedy/game-sounds

# Git clone
git clone https://github.com/Citedy/game-sounds.git ~/.claude/plugins/game-sounds
```

</details>

## Sound Packs

### Warcraft (default)

| Event | Sound Category | Example Phrases |
|-------|---------------|-----------------|
| Session Start | `session-start` | "Ready to work", "Something need doing?" |
| Prompt Submit | `task-acknowledge` | "Work work", "Zug zug", "Okie dokie" |
| Task Complete | `task-complete` | "Job's done!", "Work complete" |
| Error | `error` | "Stop poking me!", "That was a mistake" |
| Notification | `permission` | "What?", "What now?" |

More packs coming soon: StarCraft, Diablo, Zelda, Mario...

## Commands

Use `/game-sounds` in Claude Code to manage settings:

```
/game-sounds              # Show current config
/game-sounds volume 0.3   # Set volume (0.0-1.0)
/game-sounds pack warcraft # Switch sound pack
/game-sounds list         # List available packs
/game-sounds toggle error # Enable/disable event category
/game-sounds test         # Play a test sound
```

## Config

Edit `config.json` to customize:

```json
{
  "volume": 0.5,
  "active_pack": "warcraft",
  "enabled_events": {
    "session-start": true,
    "task-acknowledge": true,
    "task-complete": true,
    "error": true,
    "permission": true
  }
}
```

## Platform Support

- **macOS**: `afplay` (built-in)
- **Linux**: `paplay` (PulseAudio), `pw-play` (PipeWire), or `ffplay` (FFmpeg)

## Adding Custom Sound Packs

Create a new directory under `sounds/` with the pack name:

```
sounds/
└── my-pack/
    ├── session-start/
    ├── task-complete/
    ├── task-acknowledge/
    ├── error/
    └── permission/
```

Add `.mp3`, `.wav`, or `.ogg` files to each category folder. Then switch:

```
/game-sounds pack my-pack
```

## Credits

Sound files sourced from [PeonPing](https://github.com/PeonPing/peon-ping). Warcraft is a trademark of Blizzard Entertainment.

---

Made with ⚔️ by [Citedy](https://www.citedy.com) — AI platform for SEO content automation.
