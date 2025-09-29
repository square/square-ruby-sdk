# frozen_string_literal: true

require_relative "lib/square/version"
require_relative "custom.gemspec"

Gem::Specification.new do |s|
  s.name = 'square.rb'
  s.version = Square::VERSION
  s.summary = 'square'
  s.description = ''
  s.authors = ['Square Developer Platform']
  s.email = ['developers@squareup.com']
  s.homepage = 'https://squareup.com/developers'
  s.licenses = ['MIT']
  s.add_dependency('apimatic_core_interfaces', '~> 0.2.1')
  s.add_dependency('apimatic_core', '~> 0.3.11')
  s.add_dependency('apimatic_faraday_client_adapter', '~> 0.1.4')
  s.add_development_dependency('minitest', '~> 5.20')
  s.add_development_dependency('minitest-proveit', '~> 1.0')
  s.required_ruby_version = ">= 3.3.0"
  s.files = Dir[
    '{bin,lib,man,test,spec}/**/*',
    'README*',
    'LICENSE*'
  ]
  s.require_paths = ['lib']

  # Load custom gemspec configuration if it exists
  custom_gemspec_file = File.join(__dir__, "custom.gemspec.rb")
  add_custom_gemspec_data(s) if File.exist?(custom_gemspec_file)
end
