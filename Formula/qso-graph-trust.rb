# SPDX-License-Identifier: GPL-3.0-or-later
# QG Trust's qg-trust, from its GitHub release: the signed, notarized macOS program, or Linux's.
# Rewritten whole when a Release is published, so a change made here does not last.
class QsoGraphTrust < Formula
  desc "Sign and upload logs to LoTW, with the key in the OS credential store"
  homepage "https://github.com/qso-graph/qso-graph-trust"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.0/qg-trust-0.1.0-macos-arm64.tar.gz"
    sha256 "33f2942d2fa5346003b1b936f501890c53b810156d46b83f6fc71482aa5ab7fb"
  end
  on_linux do
    on_intel do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.0/qg-trust-0.1.0-linux-x86_64.tar.gz"
      sha256 "d175c66b22c20871614b77d64ccdb05db13a3c05f271b4d4645e075e2e322190"
    end
    on_arm do
      url "https://github.com/qso-graph/qso-graph-trust/releases/download/v0.1.0/qg-trust-0.1.0-linux-arm64.tar.gz"
      sha256 "6147c4079122be82d7241c36aa5837ec445055f22f65830755ea69f33abe6949"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "qg-trust"
    generate_completions_from_executable(bin/"qg-trust", "--completions")
  end

  test do
    assert_match "qg-trust #{version}", shell_output("#{bin}/qg-trust --version")
  end
end
