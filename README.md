# QSO Graph Homebrew tap

QSO Graph's apps for macOS, installed with [Homebrew](https://brew.sh). It carries Stable releases only.

## What's in this tap

| App | What it is |
|---|---|
| **QSO Graph Desktop** | Amateur radio desktop: callsigns and their logins, Locations, Parks On the Air, band conditions, sun and moon, and ADIF Lookup. Apple silicon, macOS 13 or later. |
| **QSO Graph Trust** | `qg-trust`: sign and upload your logs to ARRL's Logbook of The World, with your key in your computer's credential store. Works where `tqsl` does, from your logger or the command line. macOS on Apple silicon, and Linux. |

## Install

QSO Graph Desktop:

```bash
brew install qso-graph/tap/qso-graph-desktop
```

QSO Graph Trust:

```bash
brew install qso-graph/tap/qso-graph-trust
```

Each one installs the same signed, notarized download as its GitHub Releases page, checked against its
SHA-256. QSO Graph Desktop updates itself. To have Homebrew move it to a new Stable release, name it:

```bash
brew upgrade qso-graph-desktop
```

A plain `brew upgrade` skips it, because Homebrew leaves apps that update themselves alone unless you
add `--greedy`. QSO Graph Trust moves to a new Stable release with every `brew upgrade`.

## See what's here

From Terminal:

```bash
brew tap-info qso-graph/tap
brew info --cask qso-graph/tap/qso-graph-desktop
brew info qso-graph/tap/qso-graph-trust
```

## Remove

QSO Graph Desktop:

```bash
brew uninstall qso-graph-desktop
```

`brew uninstall --zap qso-graph-desktop` also deletes your callsigns, Locations and settings. Your
passwords stay in your Keychain until you remove them there.

QSO Graph Trust:

```bash
brew uninstall qso-graph-trust
```

Your certificates, keys and Locations stay where `qg-trust` keeps them.

## How it's kept up to date

When a Release is published, QSO Graph's release tools (`qg-tap-bump`) open a pull request here
with the new version and its SHA-256. This repository's CI installs it on a Mac, checks that it is
signed by QSO Graph and, for QSO Graph Desktop, notarized by Apple, runs it, and uninstalls it, and the
pull request merges only when that passes.

GPL-3.0-or-later.
