class Arcanist < Formula
  desc "Command-line interface for Phabricator"
  homepage "https://secure.phabricator.com/book/phabricator/article/arcanist/"
  url "https://github.com/phacility/arcanist.git",
    :revision => "cbc785ddce71be073f536c1faea8c231e495d5df"
  version "20170911"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git",
      :revision => "ceeaf5ebea1c57c554eff0a2f131a21072f2948d"
  end

  resource "geekie-extensions" do
    url "https://github.com/geekie/arc-extensions.git"
  end

  def install
    libexec.install Dir["*"]

    resource("libphutil").stage do
      (buildpath/"libphutil").install Dir["*"]
    end

    resource("geekie-extensions").stage do
      (buildpath/"geekie-extensions").install Dir["*"]
    end

    prefix.install Dir["*"]

    bin.install_symlink libexec/"bin/arc" => "arc"
  end

  test do
    system "#{bin}/arc", "help"
  end
end
