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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.5/qg-trust-0.1.5-macos-arm64.tar.gz"
      sha256 "ee426e412aa03fd477df35888fbe549785d206232fa47cad0de03f91c9e48d29"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.5/qg-trust-0.1.5-linux-x86_64.tar.gz"
      sha256 "04b6a533d487fe0aeb0bbfc7de5381a2ac787bf2941abad8088d4740806b1b79"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.5/qg-trust-0.1.5-linux-arm64.tar.gz"
      sha256 "88796029a0790300c2e394500888e73968c8fd04ec04d04730305cbed8b754fe"
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
