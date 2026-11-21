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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.3.0/qg-dxc-0.3.0-macos-arm64.tar.gz"
      sha256 "7c71127eff7653f5075f98d29cfb9b8016f031a39d3b3c2c03699f54bab8653e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.3.0/qg-dxc-0.3.0-linux-x86_64.tar.gz"
      sha256 "971f4bc0b4bebf36f7fcebbe6adea392310e2616714829021916eab46d213a19"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.3.0/qg-dxc-0.3.0-linux-arm64.tar.gz"
      sha256 "029a4114df4abdb18419fa60b01ab230506fbde730cad8985f8ab7c849c5939e"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
