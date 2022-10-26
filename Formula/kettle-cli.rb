class KettleCli < Formula
  desc "🎯 kettle is a CLI tool for creating and deploying serverless services"
  homepage "https://www.operator-ai.com/"
  url "https://github.com/nlathia/kettle-cli/archive/refs/tags/v0.0.24.tar.gz"
  sha256 "a6fec6c86c6640a945198e6195a9111c794d4c78af845cb09ea8875216d52af9"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/nlathia/kettle-cli"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "get", "./..."
      system "go", "build", "-o", bin/"kettle", "."
    end
  end

  test do
    assert_match "v0.0.3", shell_output("#{bin}/kettle version 2>&1", 2)
  end
end
