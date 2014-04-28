#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "LDCountDownCircle"
  s.version          = "0.1.0"
  s.summary          = "Circle animation to show a count down"
  s.license          = 'MIT'
  s.author           = { "Damien Legrand" => "legrand.damien.06@gmail.com" }
  s.source           = { :git => "https://github.com/snoozeman/LDCountDownCircle.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/damien_legrand'

  s.platform     = :ios, '6.1'
  s.requires_arc = true

  s.source_files = 'Classes/ios’
end
