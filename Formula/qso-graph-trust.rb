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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.3/qg-trust-0.1.3-macos-arm64.tar.gz"
      sha256 "030074d9c063e24482fe6e65099b66d4c00da8eb4e69a6bd01bdd6504a8ee07b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.3/qg-trust-0.1.3-linux-x86_64.tar.gz"
      sha256 "5d44c4e0ccd0405c2b36ffde25f2ff7c4e1a5078a261a5a1445dad4d128bbfda"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.3/qg-trust-0.1.3-linux-arm64.tar.gz"
      sha256 "90d5f997b41e57da7c93c08047d28414e389f1acd45873c0828cdddd25ab1829"
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
