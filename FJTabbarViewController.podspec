Pod::Spec.new do |s|
  s.name         = "FJTabbarViewController"
  s.version      = "1.0.2"
  s.summary      = "FJTabbarViewController:一句话生成FJTabbarViewController"
  s.homepage     = "https://github.com/fangjinfeng/FJTabbarViewController"
 s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'fangjinfeng' => '116418179@qq.com' }
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => "https://github.com/fangjinfeng/FJTabbarViewController.git", :tag => "1.0.2" }
  s.source_files  = "FJTabbarViewController", "*.{h,m}"
  s.requires_arc = true
  s.framework  = 'UIKit'
end
