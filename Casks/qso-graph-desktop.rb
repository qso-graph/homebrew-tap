# SPDX-License-Identifier: GPL-3.0-or-later
# QSO Graph Desktop, from its GitHub release: the signed, notarized Apple silicon .dmg.
# Written by qg-tap-bump (qso-graph-devel shell/qg_functions) when a release is made Stable.
cask "qso-graph-desktop" do
  version "0.3.1"
  sha256 "3ba2303993487435c27ef169566579613ef9f6640a9c5124f7b3735c02bf3765"

  url "https://github.com/qso-graph/qso-graph-desktop/releases/download/v#{version}/qso-graph-desktop-#{version}-mac-arm64.dmg"
  name "QSO Graph Desktop"
  desc "Amateur radio desktop: callsigns, locations, POTA, SOTA and ADIF"
  homepage "https://github.com/qso-graph/qso-graph-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The application updates itself; brew upgrade and its updater don't fight.
  auto_updates true
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
