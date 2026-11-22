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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.4.0/qg-dxc-0.4.0-macos-arm64.tar.gz"
      sha256 "2523517ffe6c29f35eef751fa0d612cd3b26b48bbf66303aa9fe226111e5ab40"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.4.0/qg-dxc-0.4.0-linux-x86_64.tar.gz"
      sha256 "c2f9af21626d811eb7055a93ce513630ad6f022ea1bcb358975be4fcb324ff92"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.4.0/qg-dxc-0.4.0-linux-arm64.tar.gz"
      sha256 "164b31470b42fb954efd7f792e9df82a650677fc61f8ea338ae549325d10ac72"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
