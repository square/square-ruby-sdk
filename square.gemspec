Gem::Specification.new do |s|
  s.name = 'square.rb'
  s.version = '36.1.0.20240320'
  s.summary = 'square'
  s.description = ''
  s.authors = ['Square Developer Platform']
  s.email = ['developers@squareup.com']
  s.homepage = ''
  s.licenses = ['Apache-2.0']
  s.add_dependency('apimatic_core_interfaces', '~> 0.2.0')
  s.add_dependency('apimatic_core', '~> 0.3.0')
  s.add_dependency('apimatic_faraday_client_adapter', '~> 0.1.0')
  s.add_development_dependency('minitest', '~> 5.14', '>= 5.14.1')
  s.add_development_dependency('minitest-proveit', '~> 1.0')
  s.required_ruby_version = ['>= 2.6']
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
