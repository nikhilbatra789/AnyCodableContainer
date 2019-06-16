#
# Be sure to run `pod lib lint NBCodableContainer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBCodableContainer'
  s.version          = '1.0.0'
  s.summary          = 'NBCodableContainer contains is an extention to KeyedDecodingContainer & KeyedEncodingContainer enabling you to Decode and Encode Any Type.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  - Any type would be able to handle Double, Float, Int, UInt, String, Bool, Date.
  - Able to handle nil while decoding and Encoding Both
  - It also supports UnkeyedEncodingContainer.
  - Compatible with Swift 5 and Swift 4.2. 
			DESC

  s.homepage         = 'https://github.com/nikhilbatra789/NBCodableContainer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'GNU GPLv3', :file => 'LICENSE' }
  s.author           = { 'nikhilbatra789' => 'nikhilbatra789@gmail.com' }
  s.source           = { :git => 'https://github.com/nikhilbatra789/NBCodableContainer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nikhilbatra789'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NBCodableContainer/Classes/**/*'
  s.swift_version = '4.2'
end
