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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.3/qg-trust-0.2.3-macos-arm64.tar.gz"
      sha256 "260afec591341aed3307c6be90d6901fa3e9219406c5909b5ba61bc00bf24f2f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.3/qg-trust-0.2.3-linux-x86_64.tar.gz"
      sha256 "e865a0ecfdf8eef684ac6641a17091b1db951ec932f85c28bd3c554c6a662c3e"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.2.3/qg-trust-0.2.3-linux-arm64.tar.gz"
      sha256 "a13da604951c1314d4c9fc6d748a723ab02ab1f4c1fb4cf36c5f3852ab323c7f"
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
