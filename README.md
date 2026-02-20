# @citedy/game-sounds

Game sound effects for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — 91 iconic voice lines from 6 classic games!

**"Work work!"** when you submit a prompt. **"Job's done!"** when the task completes. **"Construction complete"** from your C&C childhood.

## Install

### Option A: Inside Claude Code (easiest)

1. Type `/plugin` in Claude Code
2. Enter `citedy/claude-plugins` as marketplace source
3. Select **game-sounds** and install
4. Restart Claude Code

### Option B: Terminal CLI

```bash
claude plugin marketplace add citedy/claude-plugins
claude plugin install game-sounds@citedy
```

Then restart Claude Code.

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

## Sound Packs (17 packs, 167 sounds)

| Pack | Sounds | Highlights |
|------|--------|------------|
| **warcraft** (default) | 22 | "Work work!", "Job's done!", "Zug zug", "Stop poking me!" |
| **starcraft** | 21 | "Affirmative", "Battlecruiser operational", "Negative" |
| **command-conquer** | 15 | "Construction complete", "Unit ready", "Mission accomplished" |
| **diablo** | 12 | "Stay awhile and listen", "Fresh meat!", legendary drop |
| **unreal-tournament** | 11 | "Headshot!", "M-M-M-Monster Kill!", "Godlike!", "Holy Shit!" |
| **zelda** | 11 | Secret found jingle, "Hey listen!", chest open, item get |
| **mario** | 10 | "Let's-a go!", "Yahoo!", "Mamma mia", game over |
| **mortal-kombat** | 8 | "Finish Him!", "Get Over Here!", "Fatality", "Toasty!" |
| **doom** | 8 | Shotgun, BFG, chainsaw, E1M1 riff, Doomguy death scream |
| **counter-strike** | 7 | "Terrorists Win", "Bomb planted", "Go go go", "Enemy spotted" |
| **gta** | 7 | "Wasted", "Mission Passed", "Busted", police radio |
| **quake** | 7 | "Impressive!", "Excellent!", quad damage, rocket launcher |
| **silent-hill** | 7 | Air raid siren, radio static, monster growl, fog horn |
| **street-fighter** | 6 | "Hadouken!", "Shoryuken!", "Perfect", "KO" |
| **metal-gear-solid** | 5 | Alert sound (❗), "Snake? SNAAAKE!", codec call |
| **sonic** | 5 | Ring collect, spin dash, extra life, game over |
| **pac-man** | 5 | Waka waka, game start, ghost eat, death |

## Switch Packs

**From terminal:**

```bash
game-sounds switch starcraft    # direct switch
game-sounds switch              # interactive picker
game-sounds list                # show all packs
game-sounds volume 0.3          # set volume (0.0-1.0)
game-sounds test task-complete  # play a test sound
game-sounds status              # current config
```

The `game-sounds` CLI is available globally when installed via npm (`npm i -g`).

For marketplace installs, add to PATH:

```bash
export PATH="$HOME/.claude/plugins/cache/citedy/game-sounds/1.1.2/scripts:$PATH"
```

**From Claude Code:** use `/game-sounds pack starcraft`

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
