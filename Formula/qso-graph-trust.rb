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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.8/qg-trust-0.1.8-macos-arm64.tar.gz"
      sha256 "e2e2eab84af5dec21578b7a98376c803d09d6af076b13be006e7fc53a33d1989"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.8/qg-trust-0.1.8-linux-x86_64.tar.gz"
      sha256 "6abf8244ac0d53b39909a61bc22f581415309f0867feb37d8d2db8db54e115d5"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.8/qg-trust-0.1.8-linux-arm64.tar.gz"
      sha256 "ed1d8f5006fae94d959c9bd9367deb6112ac70fab71bfebf0ffa08ba13e528d8"
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
