class Operator < Formula
  desc "🎯 operator is a CLI tool for creating and deploying cloud functions & docker containers for machine learning"
  homepage "https://github.com/operatorai"
  url "https://github.com/operatorai/operator/archive/v0.0.0-alpha6.tar.gz"
  sha256 "a77fdd7637d114926591895558a58a7fe5cd36f0c1ca9b9da280bd629b28ba24"
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
