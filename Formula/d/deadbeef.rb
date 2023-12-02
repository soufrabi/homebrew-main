class Deadbeef < Formula
  desc "Music Player"
  homepage "https://github.com/DeaDBeeF-Player/deadbeef"
  url "https://downloads.sourceforge.net/project/deadbeef/travis/linux/1.9.6/deadbeef-static_1.9.6-1_x86_64.tar.bz2?ts=gAAAAABlag7AF6DfqEDpokxq8j5Sz64iB955pKzqnH-n1GPSgLIpUbxRBIeuyiHL1G_k3_pWjXYjFspolF1HmYi4y7dnK7fcCQ%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fdeadbeef%2Ffiles%2Ftravis%2Flinux%2F1.9.6%2Fdeadbeef-static_1.9.6-1_x86_64.tar.bz2%2Fdownload"
  version "1.9.6"
  sha256 "aa17741053f63a7fceace003bf269bd4c4c9e55e42ee14286d9fbf34fbc8e014"
  license "GPL-2.0-only"

  def install
    prefix.install Dir["*"]
    mkdir_p bin
    bin.install_symlink "#{prefix}/deadbeef" => "deadbeef-binary"

    (bin/"deadbeef").write <<~EOS
      #!/bin/sh

      $HOMEBREW_PREFIX/bin/deadbeef-binary "$@"
    EOS
  end

  test do
    assert_match "DeaDBeeF", shell_output("#{bin}/deadbeef --version 2>/dev/null")
  end
end
