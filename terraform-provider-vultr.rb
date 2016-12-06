class TerraformProviderVultr < Formula
  desc "terraform-provider-vultr may allow you to manage servers in vultr."
  homepage "https://github.com/AnchorFree/terraform-provider-vultr"
  url "https://github.com/AnchorFree/terraform-provider-vultr.git", :tag => "v0.0.1"
  head "https://github.com/AnchorFree/terraform-provider-vultr.git"
  version "0.0.1"

  # I don't know how to specify that we depend on v1.7.3
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = "#{Dir.pwd}/build"
    ENV["GO15VENDOREXPERIMENT"] = "1"
    sha = `git rev-parse HEAD 2>/dev/null`
    t = DateTime.now.new_offset(0).strftime("%Y-%m-%d_%H:%M_GMT")
    system "mkdir -p build/src/github.com/AnchorFree"
    system "ln -s `pwd` build/src/github.com/AnchorFree/terraform-provider-vultr"
    system [
      "cd ./build/src/github.com/AnchorFree/terraform-provider-vultr &&",
      "/usr/local/Cellar/go/1.7.3/bin/go get &&",
      "/usr/local/Cellar/go/1.7.3/bin/go install",
      "-ldflags \"-X main.Version=#{version} -X main.GitCommit=#{sha[0,7]}",
      "-X main.GitBranch=master -X main.BuildTime=#{t}_Homebrew\""
    ].join(" ")
    bin.install "build/bin/terraform-provider-vultr"
  end

  test do
    shell "./terraform-provider-vultr --help"
  end
end
