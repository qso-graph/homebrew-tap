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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.1.1/qg-dxc-0.1.1-macos-arm64.tar.gz"
      sha256 "3fc8f5cf3bc02d640dec6873281b8b84064a8eb6f3f43490ca653961fc548b10"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.1.1/qg-dxc-0.1.1-linux-x86_64.tar.gz"
      sha256 "6d53a69be59d83c4a45de2ddd721c0748be9ee7925179521f86ac9603c49c45d"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.1.1/qg-dxc-0.1.1-linux-arm64.tar.gz"
      sha256 "85a07ea5e7b1e8c053defac3a6dc3d2f6d31414714fab6c70b2cbaa16ce2e30c"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
