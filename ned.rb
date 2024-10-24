class Ned < Formula
  desc "Modern text editor built with ImGui"
  homepage "https://github.com/nealmick/ned"
  url "https://github.com/nealmick/ned/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "19c0ac7291264e5583f0058b13d36495d95b6c3443e24e8c7dd44c01881bdaeb"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "glfw"
  depends_on "opengl"

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
