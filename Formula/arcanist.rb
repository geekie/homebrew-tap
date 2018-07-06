class Arcanist < Formula
  desc "Command-line interface for Phabricator"
  homepage "https://secure.phabricator.com/book/phabricator/article/arcanist/"
  url "https://github.com/phacility/arcanist.git",
    :revision => "cbc785ddce71be073f536c1faea8c231e495d5df"
  version "201825"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git",
      :revision => "b4ba68b9757518525ace92f87de82238041b1882"
  end

  def install
    libexec.install Dir["*"]

    resource("libphutil").stage do
      (buildpath/"libphutil").install Dir["*"]
    end

    prefix.install Dir["*"]

    bin.install_symlink libexec/"bin/arc" => "arc"
  end

  test do
    system "#{bin}/arc", "help"
  end
end
