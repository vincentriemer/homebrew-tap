class IosSimulator < Formula
  desc "CLI tools for interacting with the iOS Simulator"
  homepage "https://github.com/vincentriemer/ios-simulator-cli"
  version "0.1.0"

  on_arm do
    url "https://github.com/vincentriemer/ios-simulator-cli/releases/download/v0.1.0/ios-simulator-v0.1.0-macos-arm64.tar.gz"
    sha256 "797c5bc95ac90873d2b0fddf6d0ca6086179f1f9e7cf054c607a45ff8cfd1369"
  end

  on_intel do
    url "https://github.com/vincentriemer/ios-simulator-cli/releases/download/v0.1.0/ios-simulator-v0.1.0-macos-x86_64.tar.gz"
    sha256 "94689325519314359d2500cc94931c8215d92f361d35ea3a97668f1b7594af7e"
  end

  depends_on macos: :ventura

  def install
    binary = Dir["*/bin/ios-simulator", "bin/ios-simulator"].first
    raise "ios-simulator binary not found in release archive" unless binary

    bin.install binary => "ios-simulator"
  end

  test do
    assert_match "CLI tools for interacting with the iOS Simulator", shell_output("#{bin}/ios-simulator --help")
  end
end
