Pod::Spec.new do |s|
 s.name         = "GHUITableViewHelper"
  s.version      = "1.0"
  s.summary      = "UITableViewHelper"

  s.description  = <<-DESC
                  UITableViewHelper
                   DESC

  s.homepage     = "https://cocoapods.org"

  s.license      = { :type => 'Copyright',
      :text => <<-LICENSE
      Copyright 2015 guahao. All rights reserved.
      LICENSE
 }
  s.author    = "tangshimi"
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/tangshimi/GHUITableViewHelper.git",:tag => "1.0" }
  s.source_files  = "GHUITabelViewHelper/GHUITabelViewHelper/GHUITableViewHelper/*.{h,m}"
  s.requires_arc = true

end
