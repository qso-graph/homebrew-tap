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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.0/qg-trust-0.2.0-macos-arm64.tar.gz"
      sha256 "559eb4db364992436e4cd8d1d04fe4eb94baa968092a80abd86ecb7146418a5b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.0/qg-trust-0.2.0-linux-x86_64.tar.gz"
      sha256 "662fee49051d8a05cc41fae068e7eaab5955088cf61a857226a67a4dd2bd1bd1"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.0/qg-trust-0.2.0-linux-arm64.tar.gz"
      sha256 "0d878ba034b684aa78535099e6f7766eb675690933e5ecc933a8aa96be028773"
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
