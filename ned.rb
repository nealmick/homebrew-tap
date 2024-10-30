class Ned < Formula
  desc "Modern text editor built with ImGui"
  homepage "https://github.com/nealmick/ned"
  url "https://github.com/nealmick/ned/releases/download/v1.1.0/ned-1.1.0.tar.gz"
  sha256 "3e8bf25ec67a76d3bc66b262d0fb82ddb83387a240bacbaa6dff51bf5807edd5"
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

