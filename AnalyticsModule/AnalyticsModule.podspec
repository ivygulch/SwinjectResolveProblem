Pod::Spec.new do |s|
  s.name             = 'AnalyticsModule'
  s.version          = '0.0.1'
  s.summary          = 'A module for a unifying dispatching app events to different analytics services.'

  s.description      = 'A module for a unifying dispatching app events to different analytics services.'

  s.homepage         = 'https://example.com'
  s.author           = { 'temp' => 'temp@example.com' }
  s.source           = { :path => '.' }

  s.ios.deployment_target = '10.0'

  s.static_framework = true
  s.source_files = 'AnalyticsModule/Sources/**/*'
  s.dependency 'Swinject'

end
