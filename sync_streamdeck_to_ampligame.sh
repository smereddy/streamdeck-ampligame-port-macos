#!/usr/bin/env bash
set -euo pipefail

echo "==============================="
echo " StreamDeck -> AmpliGame Sync"
echo " macOS one way copy"
echo "==============================="

SRC_PLUGINS="$HOME/Library/Application Support/com.elgato.StreamDeck/Plugins"
SRC_ICONS="$HOME/Library/Application Support/com.elgato.StreamDeck/IconPacks"

DEST_BASE="$HOME/Library/Application Support/HotSpot/StreamDock"
DEST_PLUGINS="$DEST_BASE/plugins"
DEST_ICONS="$DEST_BASE/icons"
DEST_STORECACHE="$DEST_BASE/storecache/StoreCache.json"

echo
echo "Source:"
echo "  Plugins:   $SRC_PLUGINS"
echo "  IconPacks: $SRC_ICONS"
echo
echo "Destination base:"
echo "  $DEST_BASE"
echo "  Plugins dir: $DEST_PLUGINS"
echo "  Icons dir:   $DEST_ICONS"
echo "  Store cache: $DEST_STORECACHE"
echo

# Basic safety checks
if [ ! -d "$SRC_PLUGINS" ]; then
  echo "Error: Stream Deck plugins folder not found:"
  echo "  $SRC_PLUGINS"
  exit 1
fi

if [ ! -d "$SRC_ICONS" ]; then
  echo "Error: Stream Deck IconPacks folder not found:"
  echo "  $SRC_ICONS"
  exit 1
fi

if [ ! -d "$DEST_BASE" ]; then
  echo "Error: AmpliGame / HotSpot StreamDock folder not found:"
  echo "  $DEST_BASE"
  echo "Make sure the AmpliGame software has been run at least once."
  exit 1
fi

echo "Creating destination folders if needed..."
mkdir -p "$DEST_PLUGINS" "$DEST_ICONS"

echo
read -r -p "Continue and sync files now? Type YES to proceed: " CONFIRM
if [ "$CONFIRM" != "YES" ]; then
  echo "Aborted by user."
  exit 0
fi

echo
echo "Syncing plugins..."
rsync -av \
  "$SRC_PLUGINS"/ \
  "$DEST_PLUGINS"/

echo
echo "Syncing icon packs..."
rsync -av \
  "$SRC_ICONS"/ \
  "$DEST_ICONS"/

echo
echo "Clearing StreamDock store cache (if present)..."
if [ -f "$DEST_STORECACHE" ]; then
  rm -f "$DEST_STORECACHE"
  echo "Removed: $DEST_STORECACHE"
else
  echo "No store cache file found. Skipping."
fi

echo
echo "Done. Restart the AmpliGame / StreamDock software to see new plugins and icons."
