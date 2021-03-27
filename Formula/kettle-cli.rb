class KettleCli < Formula
  desc "🎯 kettle is a CLI tool for creating and deploying machine learning projects"
  homepage "https://github.com/operatorai"
  url "https://github.com/operatorai/kettle-cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "a64344906ecd67e51786a44077411afc6b049b36c9f54d96d809c8b93b6bb6c8"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/operatorai/kettle-cli"
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
