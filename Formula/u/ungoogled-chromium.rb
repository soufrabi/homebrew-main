class UngoogledChromium < Formula
  desc "Ungoogled version of chromium"
  homepage "https://github.com/ungoogled-software/ungoogled-chromium"
  url "https://github.com/ungoogled-software/ungoogled-chromium-portablelinux/releases/download/119.0.6045.123-1/ungoogled-chromium_119.0.6045.123-1.1_linux.tar.xz"
  version "119.0.0"
  sha256 "ed18d44322aab81dbe5ed568ccfea429b8972fa1bbfcb10bb65fbee5b107ccc2"
  license "BSD-2-Clause"

  def install
    prefix.install Dir["*"]
    mkdir_p bin
    bin.install_symlink "#{prefix}/chrome"
    bin.install_symlink "#{prefix}/chromedriver"
  end

  test do
    assert_match "Chromium", shell_output("#{bin}/chrome --version 2>/dev/null")
  end
end
