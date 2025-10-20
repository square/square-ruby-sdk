# frozen_string_literal: true

# Custom Gemfile configuration file
# This file is automatically loaded by the main Gemfile. You can add custom gems,
# groups, or other Gemfile configurations here. If you do make changes to this file,
# you will need to add it to the .fernignore file to prevent your changes from being
# overwritten by the generator.

# Example usage:
# gem 'custom-gem', '~> 1.0'
# 
# group :development do
#   gem 'debug-gem', '~> 2.0'
# end

# Add your custom gem dependencies here

group :test, :development do
  gem 'mutex_m'
  gem 'base64'
end
