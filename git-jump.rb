require "language/node"

class GitJump < Formula
  desc "Git branches helper: interactive UI and fuzzy-serach for Git branches"
  homepage "https://github.com/mykolaharmash/git-jump"
  url "https://registry.npmjs.org/git-jump/-/git-jump-0.1.9.tgz"
  sha256 "01b279d6efe4a67a432efb271741b65897912739bbef4a19a766bb7f7fab616d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    system "touch", "homebrew"
    
    bin.install_symlink "#{libexec}/bin/git-jump"
    man1.install "git-jump.1"
  end

  test do
    shell_output("git init")

    assert_match "master", pipe_output("git jump --list")
  end
end
