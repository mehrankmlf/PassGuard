Pod::Spec.new do |spec|

  spec.name         = "PassGuard"
  spec.version      = "1.0.0"
  spec.summary      = "PassGuard is a password strength meter for iOS."
  spec.description  = "PassGuard is a password strength meter for iOS."

  spec.homepage     = "https://github.com/mehrankmlf/PassGuard"

  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "“Mehran Kamalifard" => "mehran.kmlf@icloud.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/mehran-kamalifard/"

  spec.platform     = :ios, "13.0"

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "13.0"
  spec.watchos.deployment_target = "13.0"
  spec.tvos.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/mehrankmlf/PassGuard.git", :tag => spec.version.to_s }


  spec.source_files  = "PassGuard/PassGuard/*.{h,m,swift}"
  spec.swift_version = "5.0"
  
end
