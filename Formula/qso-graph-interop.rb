# SPDX-License-Identifier: GPL-3.0-or-later
# QG Interop's qg-interop, from its GitHub release: the signed, notarized macOS program, or Linux's.
# Rewritten whole when a Release is published, so a change made here does not last.
class QsoGraphInterop < Formula
  desc "Listen to, decode and simulate WSJT-X, N1MM Logger+ and fldigi messages"
  homepage "https://github.com/qso-graph/qso-graph-interop"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Homebrew takes a url only inside on_arm or on_intel, never directly in on_macos (brew style).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/qso-graph/qso-graph-interop/releases/download/v0.2.0/qg-interop-0.2.0-macos-arm64.tar.gz"
      sha256 "4964a0ba5e85c21b5b9fc4ad01d478fbb4be33b5da550d6e4feeb604c2131bc6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-interop/releases/download/v0.2.0/qg-interop-0.2.0-linux-x86_64.tar.gz"
      sha256 "d35540b4fbaa32ecac8ea80a0edce7aef8d432946aba3e5ec87484e3c58cd8b2"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-interop/releases/download/v0.2.0/qg-interop-0.2.0-linux-arm64.tar.gz"
      sha256 "bcd5e8ac9fda4875bcdb29c15b768e8f6414141fcaf0843ecbba3a95ad36cb0d"
    end
  end

  def install
    bin.install "qg-interop"
  end

  test do
    assert_match "qg-interop #{version}", shell_output("#{bin}/qg-interop --version")
  end
end
