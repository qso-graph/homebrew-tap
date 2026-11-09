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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.6/qg-trust-0.1.6-macos-arm64.tar.gz"
      sha256 "a0a6055458bcef1c301436ef0283f3be73a3ff51c11f9eaccebd2f3f571eb9c4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.6/qg-trust-0.1.6-linux-x86_64.tar.gz"
      sha256 "dda8f2e745303ebe9b60123b2f8e5eaf1c4dcb01dcff1686a4e21f9b8c1af121"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.6/qg-trust-0.1.6-linux-arm64.tar.gz"
      sha256 "3f0326c2ab462eb8dce2f0593f3157ec5b4304cab53d4362d863ec58ef34609d"
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
