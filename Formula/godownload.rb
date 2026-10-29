class Godownload < Formula
  desc "Resumable, checksum-verified download manager with HuggingFace model support"
  homepage "https://github.com/saromanov/godownload"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/saromanov/godownload/releases/download/v#{version}/godownload-darwin-amd64"
      sha256 "830c0c9f7795bc9238c8e219a4de1a5f2b24659c285371f32b3ff973a2a23e2c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/saromanov/godownload/releases/download/v#{version}/godownload-darwin-arm64"
      sha256 "3a6bcf93d30f0a75447abac78783a5ee215693ac700624aa97bc4a331bf5fb01"
    end
  end

  def install
    bin.install "godownload-darwin-#{Hardware::CPU.type}" => "godownload"
  end

  test do
    system "#{bin}/godownload", "--hf-api-url", "http://localhost:1", "https://example.com/x", "--quiet", "-x"
  end
end
