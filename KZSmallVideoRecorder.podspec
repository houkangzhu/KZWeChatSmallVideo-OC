Pod::Spec.new do |s|

  s.name         = "KZSmallVideoRecorder"
  s.version      = "1.0.0"
  s.summary      = "仿微信小视频的录制 Objective-C 版"

  s.homepage     = "https://github.com/houkangzhu/KZWeChatSmallVideo-OC"

  s.license      = "MIT"

  s.author             = { "604952096@qq.com" => "houkangzhu@hotmail.com" }
  # Or just: s.author    = "604952096@qq.com"
  # s.authors            = { "604952096@qq.com" => "houkangzhu@hotmail.com" }
  # s.social_media_url   = "http://twitter.com/604952096@qq.com"

  s.platform     = :ios, "7.0"
  s.ios.deployment_target = '7.0'

  s.source       = { :git => "https://github.com/houkangzhu/KZWeChatSmallVideo-OC.git", :tag => "1.0.0" }


  s.source_files  = "KZSmallVideoRecorder/*.{h,m}"

  s.ios.frameworks = "UIKit", "Photos", "AVFoundation", "CoreGraphics"

  s.requires_arc = true

end
