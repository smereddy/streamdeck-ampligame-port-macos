# StreamDeck to AmpliGame Plugin Port for macOS

> **Migrate your Elgato Stream Deck plugins and icons to Fifine AmpliGame D6 on macOS**

[![macOS](https://img.shields.io/badge/macOS-compatible-brightgreen)](https://www.apple.com/macos/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Inspired by [TheBeardofKnowledge/StreamDeck](https://github.com/TheBeardofKnowledge/StreamDeck) (Windows version)

---

## The Problem

Bought a Fifine AmpliGame D6 (or similar StreamDock device) and staring at an empty button grid? Already have years of Stream Deck plugins and icon packs you don't want to lose?

## The Solution

One script. One command. All your plugins and icons copied over.

```bash
./sync_streamdeck_to_ampligame.sh
```

---

## Quick Start

```bash
# Clone
git clone https://github.com/smereddy/streamdeck-ampligame-port-macos.git
cd streamdeck-ampligame-port-macos

# Run
./sync_streamdeck_to_ampligame.sh
```

The script will:
1. Show you exactly what it will copy
2. Ask for confirmation (type `YES`)
3. Sync plugins and icon packs via rsync
4. Clear the StreamDock cache

Restart AmpliGame software → Done.

---

## What Gets Copied

| Source (Stream Deck) | Destination (AmpliGame) |
|---------------------|------------------------|
| `~/Library/Application Support/com.elgato.StreamDeck/Plugins` | `~/Library/Application Support/HotSpot/StreamDock/plugins` |
| `~/Library/Application Support/com.elgato.StreamDeck/IconPacks` | `~/Library/Application Support/HotSpot/StreamDock/icons` |

---

## Requirements

- **macOS** (tested on Sonoma/Ventura)
- **Elgato Stream Deck** software installed
- **Fifine AmpliGame / HotSpot StreamDock** software installed
- `rsync` (included with macOS)

---

## Safety Features

- **One-way sync only** — Stream Deck files are never modified
- **Pre-flight checks** — Verifies all folders exist before copying
- **Explicit confirmation** — Nothing happens without typing `YES`
- **Incremental copy** — Uses rsync, so re-running is fast and safe

---

## What This Does NOT Do

- ❌ Copy button layouts or profiles
- ❌ Modify your Stream Deck installation
- ❌ Work on Windows (see [Windows version](https://github.com/TheBeardofKnowledge/StreamDeck))

---

## Supported Devices

Tested with:
- Fifine AmpliGame D6

Should work with any device using the HotSpot/StreamDock software on macOS.

---

## Related Projects

| Project | Description |
|---------|-------------|
| [Windows Version](https://github.com/TheBeardofKnowledge/StreamDeck) | Original batch scripts for Windows (Fifine, Ajazz, Ulanzi) |
| [StreamDeck Bitwarden](https://github.com/smereddy/streamdeck-bitwarden-macos) | One-tap password/TOTP entry from any deck |

---

## Learn More

📖 **Medium Article**: *Coming soon* — Deep dive into how this works and why

---

## Contributing

Found a bug? Have a device that needs different paths? PRs welcome.

## License

MIT — use it, fork it, improve it.

---

**Keywords**: Stream Deck, AmpliGame, Fifine D6, StreamDock, HotSpot, macOS, plugin migration, icon packs, Elgato alternative, macro pad
