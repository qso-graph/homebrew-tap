# SPDX-License-Identifier: GPL-3.0-or-later
# QG Trust's qg-trust, from its GitHub release: the signed, notarized macOS program, or Linux's.
# Rewritten whole when a Release is published, so a change made here does not last.
class QsoGraphTrust < Formula
  desc "Sign and upload logs to LoTW, with the key in the OS credential store"
  homepage "https://github.com/qso-graph/qso-graph-trust"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Homebrew takes a url only inside on_arm or on_intel, never directly in on_macos (brew style).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.4/qg-trust-0.1.4-macos-arm64.tar.gz"
      sha256 "272c6fb8ec59f7031a95d6a5014fdbe9c4c19ad7432070c239624a6278fee801"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.4/qg-trust-0.1.4-linux-x86_64.tar.gz"
      sha256 "55f75cdeb3b5d807094720726c95f492e9de578698371814121c757a01a1d523"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.4/qg-trust-0.1.4-linux-arm64.tar.gz"
      sha256 "d5d3afdd19a79b46d298f2d70fb7288d98e153a82d05a1cf6b4077d5de6218c2"
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
