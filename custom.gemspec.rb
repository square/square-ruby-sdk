# frozen_string_literal: true

# Custom gemspec configuration file
# This file is automatically loaded by the main gemspec file. The 'spec' variable is available
# in this context from the main gemspec file. You can modify this file to add custom metadata,
# dependencies, or other gemspec configurations. If you do make changes to this file, you will
# need to add it to the .fernignore file to prevent your changes from being overwritten.

def add_custom_gemspec_data(spec)
  spec.authors = ['Square Developer Platform']
  spec.email = ['developers@squareup.com']
  spec.homepage = 'https://squareup.com/developers'
  spec.licenses = ['MIT']
  spec.add_dependency('apimatic_core_interfaces', '~> 0.2.1')
  spec.add_dependency('apimatic_core', '~> 0.3.11')
  spec.add_dependency('apimatic_faraday_client_adapter', '~> 0.1.4')
  spec.add_development_dependency('minitest', '~> 5.20')
  spec.add_development_dependency('minitest-proveit', '~> 1.0')
end
