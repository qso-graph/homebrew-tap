# SPDX-License-Identifier: GPL-3.0-or-later
# QSO Graph Desktop, from its GitHub release: the signed, notarized Apple silicon .dmg.
# Rewritten whole when a Release is published, so a change made here does not last.
cask "qso-graph-desktop" do
  version "0.7.0"
  sha256 "16d6c9bb7ccc9d9f7b46812e3b1ffaf6337f03f30090d4a86e179f04997e128d"

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
