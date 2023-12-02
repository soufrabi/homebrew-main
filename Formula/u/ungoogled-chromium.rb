class UngoogledChromium < Formula
  desc "Ungoogled version of chromium"
  homepage "https://github.com/ungoogled-software/ungoogled-chromium"
  url "https://github.com/ungoogled-software/ungoogled-chromium-portablelinux/releases/download/119.0.6045.123-1/ungoogled-chromium_119.0.6045.123-1.1_linux.tar.xz"
  version "119.0.0"
  sha256 "ed18d44322aab81dbe5ed568ccfea429b8972fa1bbfcb10bb65fbee5b107ccc2"
  license "BSD-2-Clause"

  on_linux do
      depends_on "libX11"
      depends_on "libXcomposite"
      depends_on "libXdamage"
      depends_on "libXext"
      depends_on "libXfixes"
      depends_on "libXrandr"
      depends_on "libasound"
      depends_on "libatk"
      depends_on "libatk-bridge"
      depends_on "libatspi"
      depends_on "libcairo"
      depends_on "libcups"
      depends_on "libdbus"
      depends_on "libdrm"
      depends_on "libexpat"
      depends_on "libgbm"
      depends_on "libgio"
      depends_on "libglib"
      depends_on "libgobject"
      depends_on "libnspr"
      depends_on "libnss3"
      depends_on "libnssutil3"
      depends_on "libpango"
      depends_on "libsmime3"
      depends_on "libxcb"
      depends_on "libxkbcommon"
  end

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
