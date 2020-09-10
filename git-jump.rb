require "language/node"

class GitJump < Formula
  desc "Git branches helper: interactive UI and fuzzy-serach for Git branches"
  homepage "https://github.com/mykolaharmash/git-jump"
  url "https://registry.npmjs.org/git-jump/-/git-jump-0.1.11.tgz"
  sha256 "a194a4caf408de3fafdbb76d6fcb69954e3118842aed275045a430618f3b0962"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    # Add flag that git-jump was install using Homebrew.
    # This is used to show user command for updating
    # the package when new version is available.
    FileUtils.touch "#{libexec}/lib/node_modules/git-jump/homebrew"

    bin.install_symlink "#{libexec}/bin/git-jump"
    man1.install "git-jump.1"
  end

  test do
    shell_output("git init")

    assert_match "master", pipe_output("git jump --list")
  end
end
