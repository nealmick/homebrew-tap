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
   
   # Install additional resources
   prefix.install "fonts"
   prefix.install "icons"
   
   # Create .app bundle with icon
   app = prefix/"Applications/Ned.app"
   app.mkpath
   (app/"Contents/MacOS").mkpath
   (app/"Contents/Resources").mkpath
   
   ln_s bin/"ned", app/"Contents/MacOS/ned"
   (app/"Contents/Resources").install "ned.icns"
   (app/"Contents/Info.plist").write <<~EOS
     <?xml version="1.0" encoding="UTF-8"?>
     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     <plist version="1.0">
     <dict>
       <key>CFBundleExecutable</key>
       <string>ned</string>
       <key>CFBundleIconFile</key>
       <string>ned</string>
       <key>CFBundleIdentifier</key>
       <string>com.nealmick.ned</string>
       <key>CFBundleName</key>
       <string>Ned</string>
       <key>CFBundlePackageType</key>
       <string>APPL</string>
       <key>CFBundleShortVersionString</key>
       <string>#{version}</string>
     </dict>
     </plist>
   EOS

   # Link to system Applications folder
   Applications.install_symlink app
 end
 
 test do
   system "#{bin}/ned", "--version"
 end
end
