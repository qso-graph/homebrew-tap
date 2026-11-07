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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.1/qg-trust-0.1.1-macos-arm64.tar.gz"
      sha256 "cad25b9bf9a1c16fc6deedb1624862b8bed79529201bc608f7bc3b3dc1641b2c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.1/qg-trust-0.1.1-linux-x86_64.tar.gz"
      sha256 "9f239514235fe017f6ea7c7fc9d6d0ef3e5226e18d66893a73039c5b08bd79d5"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.1/qg-trust-0.1.1-linux-arm64.tar.gz"
      sha256 "0a0edafef77e4a6a4fbaafe07d346ac944e734eb360a7d00420ffa09ec7e7d64"
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
