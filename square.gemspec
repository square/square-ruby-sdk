Gem::Specification.new do |s|
  s.name = 'square.rb'
  s.version = '42.2.0.20250521'
  s.summary = 'square'
  s.description = ''
  s.authors = ['Square Developer Platform']
  s.email = ['developers@squareup.com']
  s.homepage = 'https://squareup.com/developers'
  s.licenses = ['Apache-2.0']
  s.add_dependency('apimatic_core_interfaces', '~> 0.2.1')
  s.add_dependency('apimatic_core', '~> 0.3.11')
  s.add_dependency('apimatic_faraday_client_adapter', '~> 0.1.4')
  s.add_development_dependency('minitest', '~> 5.24.0')
  s.add_development_dependency('minitest-proveit', '~> 1.0')
  s.required_ruby_version = ['>= 2.6']
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
