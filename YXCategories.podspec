
Pod::Spec.new do |s|
  s.name         = "YXCategories"
  s.version      = "1.5.6"
  s.summary      = "自己使用的分类"
  s.homepage     = "https://github.com/shlyren/YXCategories"
  s.license      = "MIT"
  s.author       = { "shlyren" => "shlyren@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shlyren/YXCategories.git", :tag => "#{s.version}" }

  s.requires_arc =  true
  s.public_header_files = 'YXCategories/YXCategories.h'
  s.source_files = "YXCategories/YXCategories.h"
  s.resource     = 'YXCategories/MBProgressHUD/MBProgressHUD.bundle'

  s.subspec 'Foundation' do |ss|
  ss.source_files = 'YXCategories/Foundation/*.{h,m}'
  end

  s.subspec 'UIKit' do |ss|
  ss.source_files = 'YXCategories/UIKit/*.{h,m}'
  end
  
  s.subspec 'MBProgressHUD' do |ss|
  ss.source_files = 'YXCategories/MBProgressHUD/*.{h,m}'
  end
end
