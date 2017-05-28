Pod::Spec.new do |s|

  s.license      = "MIT"
  s.author       = { "qqc" => "20599378@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc  = true

  s.name         = "UIViewController-Qqc"
  s.version      = "1.0.14"
  s.summary      = "UIViewController-Qqc"
  s.homepage     = "https://github.com/xukiki/UIViewController-Qqc"
  s.source       = { :git => "https://github.com/xukiki/UIViewController-Qqc.git", :tag => "#{s.version}" }
  
  s.source_files  = ["UIViewController-Qqc/*.{h,m}"]

end
