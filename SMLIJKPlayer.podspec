#
# Be sure to run `pod lib lint SMLIJKPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SMLIJKPlayer'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SMLIJKPlayer.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/songmenglong/SMLIJKPlayer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'songmenglong' => '983174628@qq.com' }
  s.source           = { :git => 'https://github.com/songmenglong/SMLIJKPlayer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SMLIJKPlayer/Classes/**/*'
  
  s.static_framework = true

  s.dependency 'ijkplayer'
#  s.requires_arc = true
  
  s.xcconfig  = {
#    'FRAMEWORK_SEARCH_PATHS'                => '$(inherited) ${PODS_ROOT}/**',
#    'LIBRARY_SEARCH_PATHS'                  => '$(inherited) ${PODS_ROOT}/ ${PODS_ROOT}/../',
#    'ENABLE_BITCODE'                        => 'NO',
#    'OTHER_LDFLAGS'                         => '$(inherited) -ObjC',
#    'STRINGS_FILE_OUTPUT_ENCODING'          => 'UTF-8',
#    'ONLY_ACTIVE_ARCH'                      => 'NO',
'ONLY_ACTIVE_ARCH' => 'YES',

#    'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF'  => 'NO',
#    'CLANG_WARN_STRICT_PROTOTYPES'          => 'NO',
  }
  
end
