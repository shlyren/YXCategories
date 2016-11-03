
Pod::Spec.new do |s|
  s.name         = "YXCategories"
  s.version      = "0.0.1"
  s.summary      = "A practical category."
  s.homepage     = "https://github.com/shlyren/YXCategories.git"
  s.license      = "MIT"
  s.author       = { "shlyren" => "shlyren@163.com" }
  s.platform     = :ios, "7.0"
  s.source = { :git => "https://github.com/shlyren/YXCategories.git", :tag => "#{s.version}" }
  s.source_files  = "YXCategories", "YXCategories/*.{h,m}"
  s.frameworks  = "UIKit", "Foundation"
end
