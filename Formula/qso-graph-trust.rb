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
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.9/qg-trust-0.1.9-macos-arm64.tar.gz"
      sha256 "5ca9ae0feee3f28b24405cd63828a242ba0461687666c33382be268c796a3c1b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.9/qg-trust-0.1.9-linux-x86_64.tar.gz"
      sha256 "d214b6fbb0c57db0c4586d6646d8da94ad21b7917007d987d9c2283a87896f7b"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.9/qg-trust-0.1.9-linux-arm64.tar.gz"
      sha256 "5efd69596d1010a4e201276cc6e2fbf6c73085b0328f2800f0b91a1ef3634d4b"
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
