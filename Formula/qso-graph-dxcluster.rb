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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.6.0/qg-dxc-0.6.0-macos-arm64.tar.gz"
      sha256 "8036381da239cb21f066aeb0d6d41bca2d85fc91d072d1b77885864e99fd341c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.6.0/qg-dxc-0.6.0-linux-x86_64.tar.gz"
      sha256 "685b52c491b1b089f83546c5ff2dc076605ab7f5de9ea835db6546da38aac2a0"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.6.0/qg-dxc-0.6.0-linux-arm64.tar.gz"
      sha256 "b9642c31ef1835e48664b5d1bb16801f56d1147e762be23417b8f4e9615e9ba9"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
