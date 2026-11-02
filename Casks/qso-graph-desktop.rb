# SPDX-License-Identifier: GPL-3.0-or-later
# QSO Graph Desktop, from its GitHub release: the signed, notarized Apple silicon .dmg.
# Written by qg-tap-bump (qso-graph-devel shell/qg_functions) when a Release is published.
cask "qso-graph-desktop" do
  version "0.6.0"
  sha256 "e1562abc5fb76dcaac4c6004cd33bca6dd321425bd8b15a14fc0bcb1ac61fcb9"

  url "https://github.com/qso-graph/qso-graph-desktop/releases/download/v#{version}/qso-graph-desktop-#{version}-mac-arm64.dmg"
  name "QSO Graph Desktop"
  desc "Amateur radio desktop: callsigns, locations, POTA, SOTA and ADIF"
  homepage "https://github.com/qso-graph/qso-graph-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No auto_updates: Homebrew updates this copy (qso-graph-desktop#157). The
  # application recognises a Homebrew install and never replaces itself, so
  # brew upgrade is what moves it, and Homebrew's record is always right.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "QSO Graph Desktop.app"

  # Only with `brew uninstall --zap`: this removes your callsigns, Locations and settings.
  zap trash: [
    "~/Library/Application Support/QSO Graph Desktop",
    "~/Library/Logs/QSO Graph Desktop",
    "~/Library/Preferences/org.qso-graph.desktop.plist",
    "~/Library/Saved Application State/org.qso-graph.desktop.savedState",
  ]
end
