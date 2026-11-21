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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.2.0/qg-dxc-0.2.0-macos-arm64.tar.gz"
      sha256 "56291b129559e972a84f43d0d0f9b482468e9a81880f20d9d60e425a98ff76e0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.2.0/qg-dxc-0.2.0-linux-x86_64.tar.gz"
      sha256 "6722fbe688527b8f3758a58491606a4fadffdeb0863ba4eb244e5ad3f6997bc7"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.2.0/qg-dxc-0.2.0-linux-arm64.tar.gz"
      sha256 "d00fffb6ec096739a979f6068fadb7a46038a228242f9202c6d83b627c5cdf4a"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
