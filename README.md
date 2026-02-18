# @citedy/game-sounds

Game sound effects for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — 91 iconic voice lines from 6 classic games!

**"Work work!"** when you submit a prompt. **"Job's done!"** when the task completes. **"Construction complete"** from your C&C childhood.

## Install

```bash
claude plugin marketplace add Citedy/claude-plugins
claude plugin install game-sounds@citedy
```

<details>
<summary>Alternative install methods</summary>

```bash
# Git clone (no marketplace needed)
git clone https://github.com/Citedy/game-sounds.git ~/.claude/plugins/game-sounds

# npm
npm i -g @citedy/game-sounds
claude --plugin-dir $(npm root -g)/@citedy/game-sounds
```

</details>

## Sound Packs (6 packs, 91 sounds)

| Pack | Sounds | Highlights |
|------|--------|------------|
| **warcraft** (default) | 22 | "Work work!", "Job's done!", "Zug zug", "Stop poking me!" |
| **starcraft** | 21 | "Affirmative", "Battlecruiser operational", "Negative" |
| **command-conquer** | 15 | "Construction complete", "Unit ready", "Mission accomplished" |
| **diablo** | 12 | "Stay awhile and listen", "Fresh meat!", legendary drop |
| **zelda** | 11 | Secret found jingle, "Hey listen!", chest open, item get |
| **mario** | 10 | "Let's-a go!", "Yahoo!", "Mamma mia", game over |

Switch packs: `/game-sounds pack starcraft`

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

Sound files sourced from [PeonPing](https://github.com/PeonPing/peon-ping), [Myinstants](https://www.myinstants.com), and [red-alert-2-voice-for-compile](https://github.com/Blankwonder/red-alert-2-voice-for-compile). Game trademarks belong to their respective owners (Blizzard, EA/Westwood, Nintendo).

---

Made with ⚔️ by [Citedy](https://www.citedy.com) — AI platform for SEO content automation.
