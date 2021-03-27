class Operator < Formula
  desc "🎯 operator is a CLI tool for creating and deploying cloud functions & docker containers for machine learning"
  homepage "https://github.com/operatorai"
  url "https://github.com/operatorai/kettle-cli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "5f62e0d17fa18d4f66881489109ebb230790491c2d46a7db2f49f0e47c14e842"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/operatorai/operator"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "get", "./..."
      system "go", "build", "-o", bin/"kettle", "."
    end
  end

  test do
    assert_match "v0.0.1-alpha", shell_output("#{bin}/kettle version 2>&1", 2)
  end
end
