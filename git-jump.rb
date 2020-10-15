require "language/node"

class GitJump < Formula
  desc "Git branches helper: interactive UI and fuzzy-serach for Git branches"
  homepage "https://github.com/mykolaharmash/git-jump"
  url "https://registry.npmjs.org/git-jump/-/git-jump-0.3.0.tgz"
  sha256 "66198d030b6ffb2c651bc9bc958c0a1948a1e71da5579cf0d6e96977f376c23d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    # Add flag that git-jump was install using Homebrew.
    # This is used to show user command for updating
    # the package when new version is available.
    touch "#{libexec}/lib/node_modules/git-jump/homebrew"

    bin.install_symlink "#{libexec}/bin/git-jump"
    man1.install "git-jump.1"
  end

  test do
    shell_output("git init")

    assert_match "master", pipe_output("git jump --list")
  end
end
