class Peek < Formula
  desc "macOS screen capture CLI + MCP server for Claude"
  homepage "https://github.com/richardsummerville/peek-mcp"
  url "https://github.com/richardsummerville/peek-mcp.git",
      tag:      "v0.4.3",
      revision: "d5f824654e3258066d15334358294446391d7a66"
  license "MIT"
  head "https://github.com/richardsummerville/peek-mcp.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build",
           "--disable-sandbox",
           "-c", "release",
           "--arch", Hardware::CPU.arch
    bin.install ".build/release/peek"
  end

  test do
    assert_match "0.4.2", shell_output("#{bin}/peek --version")
  end
end
