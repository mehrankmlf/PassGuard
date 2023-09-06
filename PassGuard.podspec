Pod::Spec.new do |spec|

  spec.name         = "PassGuard"
  spec.version      = "1.0.7"
  spec.summary      = "PassGuard is a password strength meter framework for iOS."

  spec.homepage     = "https://github.com/mehrankmlf/PassGuard"


  spec.license      = "MIT"

  spec.author             = { "Mehran Kamalifard" => "mehran.kmlf@icloud.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/mehran-kamalifard"

  spec.platform     = :ios, "13.0"

  spec.source       = { :git => "https://github.com/mehrankmlf/PassGuard.git", :tag => spec.version.to_s }

  spec.source_files  = "PassGuard/PassGuard/*.{h,m,swift}"
  
  spec.swift_version = "5.0"

end
