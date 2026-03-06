# @citedy/game-sounds

![Game Sounds Banner](docs/pics/game-sounds-banner.webp)

Game sound effects for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — 552 iconic sounds from 63 classic games!

**"Work work!"** when you submit a prompt. **"Job's done!"** when the task completes. **"I'm Batman"** on session start. Hedwig's Theme when task completes. Shame bell on error.

## Install

### Option A: Inside Claude Code (easiest)

1. Type `/plugin` in Claude Code
2. Enter `citedy/claude-plugins` as marketplace source (or `https://github.com/Citedy/claude-plugins.git` if SSH fails)
3. Select **game-sounds** and install
4. Restart Claude Code

### Option B: Terminal CLI

```bash
claude plugin marketplace add citedy/claude-plugins
# If SSH error, use HTTPS instead:
# claude plugin marketplace add https://github.com/Citedy/claude-plugins.git
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

## Sound Packs (63 packs, 552 sounds)

| Pack | Sounds | Highlights |
|------|--------|------------|
| **warcraft** (default) | 22 | "Work work!", "Job's done!", "Zug zug", "Stop poking me!" |
| **starcraft** | 21 | "Affirmative", "Battlecruiser operational", "Negative" |
| **command-conquer** | 23 | "Construction complete", "Hell March", "Mission accomplished" |
| **tmnt** | 15 | "Cowabunga!", turtle power theme, area clear |
| **donkey-kong** | 14 | DKC opening theme, DK Rap, stage clear |
| **mega-man** | 13 | Stage select, Dr. Wily theme, stage clear |
| **castlevania** | 13 | Vampire Killer, castle gate intro, stage clear |
| **bomberman** | 13 | Level start, explosive beginnings, area intro |
| **top-gun** | 12 | Danger Zone, Top Gun anthem, title screen |
| **popeye** | 12 | Stage themes, spinach power, stage clear |
| **ducktales** | 12 | Moon theme, DuckTales theme, stage select |
| **diablo** | 12 | "Stay awhile and listen", "Fresh meat!", legendary drop |
| **zelda** | 11 | Secret found jingle, "Hey listen!", chest open, item get |
| **unreal-tournament** | 11 | "Headshot!", "M-M-M-Monster Kill!", "Godlike!" |
| **dracula** | 11 | Title screen, castle themes, ending |
| **mario** | 10 | "Let's-a go!", "Yahoo!", "Mamma mia", game over |
| **kirby** | 10 | Green Greens, Dream Land, victory dance |
| **dnd-dragonstrike** | 10 | DragonStrike theme, mission themes, staff roll |
| **chip-n-dale** | 10 | Rescue Rangers theme, zone clear, boss battle |
| **tetris** | 9 | Theme A, title screen, 4-line clear |
| **prince-of-persia** | 9 | Introducing the Prince, Sands of Time, farewell |
| **indiana-jones** | 9 | Raiders March, Holy Grail, stage clear |
| **asterix** | 9 | Title screen, invincibility, bonus round |
| **aladdin** | 9 | A Whole New World, Genie entrance, Jafar evil |
| **talespin** | 8 | Sea Duck theme, title theme, pirate's cave |
| **star-wars** | 8 | Imperial March, Star Wars theme, Throne Room |
| **simpsons** | 8 | Boss themes, bonus stage, Springfield |
| **robocop** | 8 | RoboCop theme, level intro, opening |
| **rambo** | 8 | Title screen, mission theme, boss battle |
| **mortal-kombat** | 8 | "Finish Him!", "Get Over Here!", "Fatality", "Toasty!" |
| **mission-impossible** | 8 | Main theme, "Your mission...", theme sting |
| **lion-king** | 8 | Hakuna Matata, King tag, finale |
| **jungle-book** | 8 | Bare Necessities, intro tune, bonus level |
| **beauty-and-the-beast** | 8 | Prologue, title screen, ending |
| **streets-of-rage** | 7 | Go Straight, player select, level complete |
| **silent-hill** | 7 | Air raid siren, radio static, monster growl |
| **quake** | 7 | "Impressive!", "Excellent!", quad damage |
| **metroid** | 7 | Brinstar, escape sequence, Samus fanfare |
| **looney-tunes** | 7 | "That's all folks!", "What's up doc?", meep meep |
| **lemmings** | 7 | Level themes, Galop Infernal, ending |
| **final-fantasy** | 7 | Opening theme, airship, item received |
| **earthworm-jim** | 7 | New Junk City, "Groovy!", ending |
| **doom** | 7 | E1M1, chainsaw, Doomguy death scream |
| **die-hard** | 7 | Nakatomi tower, title screen, game over |
| **counter-strike** | 7 | "Terrorists Win", "Bomb planted", "Go go go" |
| **batman** | 7 | "I'm Batman", Na na na Batman!, Joker laugh |
| **street-fighter** | 6 | "Hadouken!", "Shoryuken!", "Perfect", "KO" |
| **scooby-doo** | 6 | "Scooby-Dooby-Doo!", "Ruh-roh", "Zoinks!" |
| **gta** | 6 | "Wasted", "Mission Passed", "Busted" |
| **star-trek** | 5 | "Make it so", communicator chirp, red alert |
| **sonic** | 5 | Ring collect, spin dash, extra life |
| **pac-man** | 5 | Waka waka, game start, ghost eat, death |
| **metal-gear-solid** | 5 | Alert sound, "Snake? SNAAAKE!", codec call |
| **matrix** | 5 | "I know kung fu", "There is no spoon", bullet time |
| **lord-of-the-rings** | 5 | "You shall not pass!", Horn of Gondor, Shire |
| **harry-potter** | 5 | Hedwig's theme, "Always", Voldemort laugh |
| **game-of-thrones** | 5 | Main theme, "You know nothing", shame bell |
| **duck-hunt** | 5 | Dog laugh, title BGM, game start |
| **double-dragon** | 5 | Main title, victory, game over |
| **darkwing-duck** | 5 | NES title, stage clear, boss music |
| **contra** | 5 | Title theme, 1UP, death, explosion |
| **cobra-command** | 5 | Mission completed, staff roll, briefing |
| **battletoads** | 5 | Title, level complete, pause beat, game over |

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

Sound files sourced from [PeonPing](https://github.com/PeonPing/peon-ping), [Myinstants](https://www.myinstants.com), [Internet Archive NES-Music](https://archive.org/download/NES-Music/), and [red-alert-2-voice-for-compile](https://github.com/Blankwonder/red-alert-2-voice-for-compile). Game trademarks belong to their respective owners (Blizzard, EA/Westwood, Nintendo, Capcom, DC Comics, Nickelodeon, Warner Bros, Paramount, HBO, Konami, Sega, Hanna-Barbera, Square Enix, Rare, Team17, Disney).

---

Made with ⚔️ by [Citedy](https://www.citedy.com) — AI platform for SEO content automation.
