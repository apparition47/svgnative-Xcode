#
# Be sure to run `pod lib lint TestLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'svgnative'
  s.version          = '0.1.0-beta'
  s.summary          = 'SVG Native viewer is a library that parses and renders SVG Native documents.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SVG Native is an upcoming specification of the SVG WG based on SVG OpenType.
SVG Native will be a strict subset of SVG 1.1 and SVG 2.0.
                       DESC

  s.homepage         = 'https://github.com/adobe/svg-native-viewer'
  s.license          = { :type => 'Apache V2' }
  s.author           = { 'adobe' => 'https://adobe.com' }
  s.source           = { :git => 'https://github.com/SDWebImage/svg-native-viewer.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = ['svgnative/include/**/*.{h,hpp}',
                    'svgnative/src/**/*.{h,c,cc,cpp,hpp}',
                    'third_party/boost_variant_property_tree/**/*.{h,c,cc,cpp,hpp}',
                    'third_party/cpp-base64/base64.{h,cpp}']
  s.public_header_files = 'svgnative/include/**/*.{h,hpp}'
  s.exclude_files = ['svgnative/src/xml/ExpatXMLParser.cpp',
                     'svgnative/src/xml/RapidXMLParser.cpp',
                     'svgnative/src/ports/cairo',
                     'svgnative/src/ports/d2d',
                     'svgnative/src/ports/gdiplus',
                     'svgnative/src/ports/skia',
                     'svgnative/src/ports/string',
                     'svgnative/include/svgnative/ports/cairo',
                     'svgnative/include/svgnative/ports/d2d',
                     'svgnative/include/svgnative/ports/gdiplus',
                     'svgnative/include/svgnative/ports/skia',
                     'svgnative/include/svgnative/ports/string']

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) USE_CG=1 BOOST_VARIANT_DETAIL_NO_SUBSTITUTE=1',
    'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_TARGET_SRCROOT}/svgnative/include ${PODS_TARGET_SRCROOT}/svgnative/src ${PODS_TARGET_SRCROOT}/third_party/boost_variant_property_tree ${PODS_TARGET_SRCROOT}/third_party/cpp-base64'
  }
  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/svgnative/third_party/boost_variant_property_tree' # Hack because public header include <boost/variant.hpp>
  }
  s.preserve_paths = ['svgnative', 'third_party']
  s.libraries = 'c++', 'xml2'
end
