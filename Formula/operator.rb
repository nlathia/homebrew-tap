class Operator < Formula
  desc "🎯 operator is a CLI tool for creating and deploying cloud functions & docker containers for machine learning"
  homepage "https://github.com/operatorai"
  url "https://github.com/operatorai/operator/archive/v0.0.0-alpha5.tar.gz"
  sha256 "b6782ebcfca1d60267cb352192e935107ab47c641d863987b70c432f2046a353"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/operatorai/operator"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "get", "./..."
      system "go", "build", "-o", bin/"operator", "."
    end
  end

  test do
    assert_match "v0.0.1-alpha", shell_output("#{bin}/operator version 2>&1", 2)
  end
end
