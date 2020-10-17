class Operator < Formula
  desc "🎯 operator is a CLI tool for creating and deploying cloud functions & docker containers for machine learning"
  homepage "https://github.com/operatorai"
  url "https://github.com/operatorai/operator/archive/v0.0.0-alpha2.tar.gz"
  sha256 "12cc9df34a56bf8066d9e17ac79f6c60d31da050d1f9d9f801e14a1b8869e8f7"
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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test operator`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_match "v0.0.1-alpha", shell_output("#{bin}/operator version 2>&1", 2)
  end
end