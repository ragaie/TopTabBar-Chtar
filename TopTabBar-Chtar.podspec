Pod::Spec.new do |s|
  s.platform = :ios
  s.name             = 'TopTabBar-Chtar'
  s.version          = '0.0.6'
  s.summary          = 'It is scrolling top tab bar with indicator items for selection'
 
  s.description      = <<-DESC
Top tab bar can be used for all iOS platform, I can think about native iOS tab bar, but you can but it any where of your design not all native iOS tabor only part of button.
                       DESC
 
  s.homepage         = 'https://github.com/ragaie/TopTabBar-Chtar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ragaie Alfy' => 'eng.ragaie@gmail.com' }
  s.source           = { :git => 'https://github.com/ragaie/TopTabBar-Chtar.git', :tag => s.version.to_s }
 
  s.framework = "UIKit","Foundation"
  s.ios.deployment_target = '10.0'

  s.source_files = '*.swift'
  s.resources = '*.xib'
  s.resource_bundle = {'TopTabBar-Chtar' => ['TopTabBar.xib']}
  s.swift_versions = "5.0"
  
end
