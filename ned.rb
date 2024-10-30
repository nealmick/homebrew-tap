class Ned < Formula
  desc "Modern text editor built with ImGui"
  homepage "https://github.com/nealmick/ned"
  url "https://github.com/nealmick/ned/releases/download/v1.1.0/ned-1.1.0.tar.gz"
  sha256 "157225f91a70c0a182d36d95f9e9489146f37641513ce3e814fb607a14877de1"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "glfw"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/text_editor" => "ned"
    
    # Install additional resources
    prefix.install "fonts"
    prefix.install "icons"
  end

  test do
    system "#{bin}/ned", "--version"
  end
end

