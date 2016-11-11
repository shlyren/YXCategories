
Pod::Spec.new do |s|
  s.name         = "YXCategories"
  s.version      = "1.4.1"
  s.summary      = "A category only use own"
  s.homepage     = "https://github.com/shlyren/YXCategories"
  s.license      = "MIT"
  s.author       = { "shlyren" => "shlyren@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shlyren/YXCategories.git", :tag => "#{s.version}" }

  s.requires_arc =  true
  s.public_header_files = 'YXCategories/YXCategories.h'
  s.source_files = "YXCategories/YXCategories.h"

  s.subspec 'Foundation' do |ss|
  ss.source_files = 'YXCategories/Foundation/*.{h,m}'
  end

  s.subspec 'UIKit' do |ss|
  ss.source_files = 'YXCategories/UIKit/*.{h,m}'
  end
end
