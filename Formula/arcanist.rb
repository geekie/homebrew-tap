class Arcanist < Formula
  desc "Command-line interface for Phabricator"
  homepage "https://secure.phabricator.com/book/phabricator/article/arcanist/"
  url "https://github.com/phacility/arcanist.git",
    :revision => "8f7ddcdf995fe33fb2810aa7739b16f9b92cb44e"
  version "2021-03-1"

  def install
    libexec.install Dir["*"]
    
    prefix.install Dir["*"]

    bin.install_symlink libexec/"bin/arc" => "arc"
  end

  test do
    system "#{bin}/arc", "help"
  end
end
