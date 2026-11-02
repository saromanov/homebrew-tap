class Openfd < Formula
  desc "lsof that answers instantly: fast, streaming file-descriptor scanner for Linux"
  homepage "https://github.com/saromanov/openfd"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/saromanov/openfd/releases/download/v#{version}/openfd-x86_64-linux"
      sha256 "78b785a3b83bedc29256aa3c9965a04947b8b0b3f27d75a2713ced3cdc0bfd5e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/saromanov/openfd/releases/download/v#{version}/openfd-aarch64-linux"
      sha256 "f5d0f9bfaebd1d306e084acc3c2b917730cc9fb493be238362257dfec1d85734"
    end
  end

  def install
    binary = Hardware::CPU.intel? ? "openfd-x86_64-linux" : "openfd-aarch64-linux"
    bin.install binary => "openfd"
  end
end
