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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.7/qg-trust-0.1.7-macos-arm64.tar.gz"
      sha256 "5775cb8d7f7d103312156997d3ffede13907ab3ee28e18ddbd766863018a503c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.7/qg-trust-0.1.7-linux-x86_64.tar.gz"
      sha256 "67bc30f3f8f521f4192da331bbc42da1aa9d7d8f8fd308cf872f98b0a81b61e2"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.7/qg-trust-0.1.7-linux-arm64.tar.gz"
      sha256 "4bdee566a688355c7ea57b823050e71190ac91d9840dc692602bdd8c077bd43a"
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
