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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.2/qg-trust-0.2.2-macos-arm64.tar.gz"
      sha256 "9943093d3d7436ceb9ed78a6a0ded99e9d4694666019776b5bdc72a60b4a45a4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.2/qg-trust-0.2.2-linux-x86_64.tar.gz"
      sha256 "5924dd054dc1e591a0ffcf9ce49a62dfbeeb2f59a32f5a35882e20f8af3d4187"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.2/qg-trust-0.2.2-linux-arm64.tar.gz"
      sha256 "e96ed2e2b489b8d9c97e4617f2eee5bc9eff1c846796a125280b70ae188d6a6a"
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
