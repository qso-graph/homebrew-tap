# SPDX-License-Identifier: GPL-3.0-or-later
# QSO Graph Desktop, from its GitHub release: the signed, notarized Apple silicon .dmg.
# Written by qg-tap-bump (qso-graph-devel shell/qg_functions) when a release is made Stable.
cask "qso-graph-desktop" do
  version "0.5.2"
  sha256 "cd24c52017abce23e9d4b1e769abaf08059b29fa74d32c9f3db42859a0e08d3c"

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
