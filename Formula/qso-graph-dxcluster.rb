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
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.7.0/qg-dxc-0.7.0-macos-arm64.tar.gz"
      sha256 "0e45214ecdba1aaa586a03906e37217414e02b86d96bda7646da0a3935158a85"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.7.0/qg-dxc-0.7.0-linux-x86_64.tar.gz"
      sha256 "3f035bb35a18377e26cbfea48b696637913471f01e41c5efeed8e622d27f301c"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-dxcluster/releases/download/v0.7.0/qg-dxc-0.7.0-linux-arm64.tar.gz"
      sha256 "39d4ad71971eeadfae101213fb0bad45e335c33ea541b9dc4e0d97fc6820062e"
    end
  end

  def install
    bin.install "qg-dxc"
  end

  test do
    assert_match "qg-dxc #{version}", shell_output("#{bin}/qg-dxc --version")
  end
end
