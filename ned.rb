require "formula"
class Ned < Formula
  desc "Modern text editor built with ImGui"
  homepage "https://github.com/nealmick/ned"
  url "https://github.com/nealmick/ned/releases/download/v1.2.1/ned-1.2.1.tar.gz"
  sha256 "e11cd9a195639828f5200156a5ca959f57bf052df0d8cdccafd097dc3ec74419"
  license "MIT"
  depends_on "cmake" => :build
  depends_on "glfw"
  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/text_editor" => "ned"
    prefix.install "fonts"
    prefix.install "icons"
  end
  test do
    system "#{bin}/ned", "--version"
  end
end
