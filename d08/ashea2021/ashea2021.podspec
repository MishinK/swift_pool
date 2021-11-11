#
# Be sure to run `pod lib lint ashea2021.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ashea2021'
  s.version          = '0.1.0'
  s.summary          = 'pod swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This pod was created for educational purposes during the passage of swift piscine day 08 in school 21.
                       DESC

  s.homepage         = 'https://github.com/MishinK/ashea2021'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MishinK' => 'ashea@student.21-school.ru' }
  s.source           = { :git => 'https://github.com/MishinK/ashea2021.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'
  s.swift_versions = '5.0'
  s.source_files = 'ashea2021/Classes/**/*'
  s.resource = 'ashea2021/Assets/*'
  
  # s.resource_bundles = {
  #   'ashea2021' => ['ashea2021/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
