Pod::Spec.new do |spec|
  spec.name             = 'ImgurSession'
  spec.version          = '1.3,1'
  spec.license          = {:type => 'MIT'}
  spec.homepage         = 'https://github.com/geoffmacd/ImgurSession'
  spec.summary          = 'Imgur API for Objective C'
  spec.source           =  {:git => 'https://github.com/geoffmacd/ImgurSession.git', :tag => '1.3.1'}
  spec.source_files     = 'ImgurSession/**/*.{h,m}'
  spec.author              = { "Geoff MacDonald" => "geoffmacd@gmail.com" }
  spec.framework        = 'Foundation'
  spec.dependency 'AFNetworking', '4.0.1'
  spec.ios.deployment_target = '12.0'
  spec.osx.deployment_target = "10.15"
  spec.requires_arc     = true

  spec.prefix_header_contents = <<-EOS
#ifdef __OBJC__
  #import <AFNetworking/AFNetworking.h>
#endif /* __OBJC__*/
EOS
end
