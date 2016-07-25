Pod::Spec.new do |s|

  s.name         = "KZSmallVideoRecorder"
  s.version      = "1.0.4"
  s.summary      = "仿微信小视频的录制 Objective-C 版"

  s.homepage     = "https://github.com/houkangzhu/KZWeChatSmallVideo-OC"

  s.license      = "MIT"

  s.author             = { "houkangzhu" => "houkangzhu@hotmail.com" }

  s.platform     = :ios, "7.0"
  s.ios.deployment_target = '7.0'

  s.source       = { :git => "https://github.com/houkangzhu/KZWeChatSmallVideo-OC.git", :tag => "v#{s.version}" }


  s.source_files  = "KZSmallVideoRecorder/*.{h,m}"

  s.ios.frameworks = "UIKit", "Photos", "AVFoundation", "CoreGraphics"

  s.requires_arc = true

end
