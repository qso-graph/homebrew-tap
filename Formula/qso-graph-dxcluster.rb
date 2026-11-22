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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.5.0/qg-dxc-0.5.0-macos-arm64.tar.gz"
      sha256 "57e16880cb2c29fc1a492f3e49bcd6ab56722a1c3616227a33486c5a9f5c71ba"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.5.0/qg-dxc-0.5.0-linux-x86_64.tar.gz"
      sha256 "c0de2db439e028543664d4124548898da4edaf08711067e88e90008a481b07dd"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.5.0/qg-dxc-0.5.0-linux-arm64.tar.gz"
      sha256 "616a12a7d2504601e726e35a78a9d279fbf6f0c76712490568c5e5c0ef5fd6f8"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
