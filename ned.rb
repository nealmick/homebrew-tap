class Ned < Formula
  desc "Modern text editor built with ImGui"
  homepage "https://github.com/nealmick/ned"
  url "https://github.com/nealmick/ned/releases/download/v1.0.0/ned-1.0.0.tar.gz"
  sha256 "479df6f0d580cacf7c0994a93904ecd65dfdba1a55503320ed6398855fdee594"
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

