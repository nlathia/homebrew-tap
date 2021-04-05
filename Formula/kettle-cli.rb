class KettleCli < Formula
  desc "🎯 kettle is a CLI tool for creating and deploying machine learning projects"
  homepage "https://www.operator-ai.com/"
  url "https://github.com/operatorai/kettle-cli/archive/refs/tags/v0.0.23.tar.gz"
  sha256 "6cec7fbe85d6f080fc37687bb9ccfd750640cd376bb149fd04c7908bc73c2f4c"
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
