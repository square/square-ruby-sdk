# frozen_string_literal: true

require_relative "lib/square/version"
require_relative "custom.gemspec"

# NOTE: A handful of these fields are required as part of the Ruby specification.
#       You can change them here or overwrite them in the custom gemspec file.
Gem::Specification.new do |s|
  s.name = 'square.rb'
  s.version = Square::VERSION
  s.summary = "Ruby client library for the Seed API"
  s.description = "The Square Ruby library provides convenient access to the Square API from Ruby."
  s.required_ruby_version = ">= 3.3.0"
  s.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  s.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  s.bindir = "exe"
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # s.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  # Load custom gemspec configuration if it exists
  custom_gemspec_file = File.join(__dir__, "custom.gemspec.rb")
  add_custom_gemspec_data(s) if File.exist?(custom_gemspec_file)
end
