Pod::Spec.new do |s|
  s.name             = 'NFRxSwiftExt'
  s.version          = '0.7.0'
  s.summary          = 'A short description of NFRxSwiftExt.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/NFRxSwiftExt'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '🦊Tomoya Hirano' => 'noppelabs@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/NFRxSwiftExt.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'
  s.ios.deployment_target = '10.0'
  s.source_files = 'NFRxSwiftExt/Classes/**/*'

  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'RxOptional'
  s.dependency 'RxSwiftExt'
end
