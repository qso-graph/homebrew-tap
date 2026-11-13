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
      url "https://github.com/qso-graph/qso-graph-interop/releases/download/v0.1.0/qg-interop-0.1.0-macos-arm64.tar.gz"
      sha256 "46c30bd85b4599e5a0f364e1b6242467f8f8be7062872fd81c6c473958d516ca"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-interop/releases/download/v0.1.0/qg-interop-0.1.0-linux-x86_64.tar.gz"
      sha256 "c7038470511b94478aa4ab1c3353f05f3e9569838c037383b31cc4323352d14e"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-interop/releases/download/v0.1.0/qg-interop-0.1.0-linux-arm64.tar.gz"
      sha256 "bbd2b30363e4d9931c6db55ba55b914807556502c623143a41c718c177fbdcd3"
    end
  end

  def install
    bin.install "qg-interop"
  end

  test do
    assert_match "qg-interop #{version}", shell_output("#{bin}/qg-interop --version")
  end
end
