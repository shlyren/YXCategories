
Pod::Spec.new do |s|
  s.name         = "YXCategories"
  s.version      = "1.1.1"
  s.summary      = "A category only use own"
  s.homepage     = "https://github.com/shlyren/YXCategories"
  s.license      = "MIT"
  s.author       = { "shlyren" => "shlyren@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shlyren/YXCategories.git", :tag => "#{s.version}" }
  s.source_files = "YXCategories/**/*.{h,m}"
  s.requires_arc =  true
end
