# QSO Graph Homebrew tap

QSO Graph's apps for macOS, installed with [Homebrew](https://brew.sh). It carries Stable releases only.

## What's in this tap

| App | What it is |
|---|---|
| **QSO Graph Desktop** | Amateur radio desktop: callsigns, Locations, POTA, SOTA and ADIF. Apple silicon, macOS 13 or later. |

## Install

QSO Graph Desktop:

```bash
brew install qso-graph/tap/qso-graph-desktop
```

Each one installs the same signed, notarized download as its GitHub Releases page, checked against its
SHA-256. QSO Graph Desktop updates itself, and `brew upgrade` brings each new Stable release too.

## See what's here

From Terminal:

```bash
brew tap-info qso-graph/tap
brew info --cask qso-graph/tap/qso-graph-desktop
```

## Remove

QSO Graph Desktop:

```bash
brew uninstall qso-graph-desktop
```

`brew uninstall --zap qso-graph-desktop` also deletes your callsigns, Locations and settings. Your
passwords stay in your Keychain until you remove them there.

## How it's kept up to date

When a release is made Stable, QSO Graph's release tools (`qg-release-promote`) open a pull request here
with the new version and its SHA-256. This repository's CI installs it on a Mac, checks that Apple
notarized it, and uninstalls it, and the pull request merges only when that passes.

GPL-3.0-or-later.
