# SPDX-License-Identifier: GPL-3.0-or-later
# QG Trust's qg-trust, from its GitHub release: the signed, notarized macOS program, or Linux's.
# Rewritten whole when a Release is published, so a change made here does not last.
class QsoGraphTrust < Formula
  desc "Sign and upload logs to LoTW, with the key in the OS credential store"
  homepage "https://github.com/qso-graph/qso-graph-trust"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Homebrew takes a url only inside on_arm or on_intel, never directly in on_macos (brew style).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.1/qg-trust-0.2.1-macos-arm64.tar.gz"
      sha256 "3f98629c0f836bb8225c356d866423da2b4613e4fa9fe52db0f2c0a655beb543"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.1/qg-trust-0.2.1-linux-x86_64.tar.gz"
      sha256 "96d673f9d78682ec5731dccda299397d5d9dc2dcdc15d9fa3d18f967e7fd077e"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.1/qg-trust-0.2.1-linux-arm64.tar.gz"
      sha256 "cb8c6ffbc72bc7ce59fbcfd7383ae3ee96aae43038f1ac6175fc87fdd6490b1c"
    end
  end

  def install
    bin.install "qg-trust"
    generate_completions_from_executable(bin/"qg-trust", "--completions")
  end

  test do
    assert_match "qg-trust #{version}", shell_output("#{bin}/qg-trust --version")
  end
end
