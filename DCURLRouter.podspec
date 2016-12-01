
Pod::Spec.new do |s|

  s.name         = "DCURLRouter"
  s.version      = "0.81"
  s.summary      = "Use custom URL to change ViewController."

  s.description  = "Use custom URL to push and modal viewController. you can pop or dismiss several controller at the same time.you can modal a controller with a Navigation Controller…"

  s.homepage     = "https://github.com/DarielChen/DCURLRouter"

  s.license      = "MIT"

  s.author       = { "DarielChen" => "chendariel@gmail.com" }

  s.platform     = :ios
 
  s.source       = { :git => "https://github.com/DarielChen/DCURLRouter.git", :tag => "#{s.version}" }

  s.source_files  = "DCURLRouter/*{h,m}"
  s.exclude_files = "DCURLRouter/DCURLRouter.plist"

  s.framework  = "UIKit"
  s.requires_arc = true

end
