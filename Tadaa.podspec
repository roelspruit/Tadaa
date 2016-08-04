Pod::Spec.new do |s|
  s.name = 'Tadaa'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'A helper class to quickly overlay a design on a viewcontroller'
  s.homepage = 'https://github.com/roelspruit/Tadaa'
  s.authors = { 'Roel Spruit' => 'roel@roelspruit.com' }
  s.source = { :git => 'https://github.com/roelspruit/Tadaa.git', :tag => s.version }

  s.ios.deployment_target = '9.1'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end