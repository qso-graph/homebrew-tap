# SPDX-License-Identifier: GPL-3.0-or-later
# QG DX Cluster's qg-dxc, from its GitHub release: the signed, notarized macOS program, or Linux's.
# Rewritten whole when a Release is published, so a change made here does not last.
class QsoGraphDxcluster < Formula
  desc "Watch DX cluster and Reverse Beacon Network spots in one live terminal list"
  homepage "https://github.com/qso-graph/qso-graph-dxcluster"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Homebrew takes a url only inside on_arm or on_intel, never directly in on_macos (brew style).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.1.2/qg-dxc-0.1.2-macos-arm64.tar.gz"
      sha256 "fb323ed7769b0271db97c025c6e4000d185baafb97fd6b8796f0967052bc61ed"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.1.2/qg-dxc-0.1.2-linux-x86_64.tar.gz"
      sha256 "49c87730935b6002f188e35fd7254e74b2da242c8854bd9ec96de4d326204ca0"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.1.2/qg-dxc-0.1.2-linux-arm64.tar.gz"
      sha256 "05ffe3f36efcf52b5d992f614d9e482b277cb2bd3e143c3b5a70d2c885566f60"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
