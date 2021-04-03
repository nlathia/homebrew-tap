class KettleCli < Formula
  desc "🎯 kettle is a CLI tool for creating and deploying machine learning projects"
  homepage "https://www.operator-ai.com/"
  url "https://github.com/operatorai/kettle-cli/archive/refs/tags/v0.0.22.tar.gz"
  sha256 "11cfb546add3d2e158378a20c6b61b6864b04ef96f5f07ed1063ccee086215d1"
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
