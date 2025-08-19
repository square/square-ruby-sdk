# frozen_string_literal: true

require_relative "../../lib/square"

def test_token
  @test_token ||= ENV.fetch("SQUARE_TOKEN", nil) || ENV.fetch("TEST_SQUARE_TOKEN", nil) || ENV.fetch("SQUARE_SANDBOX_TOKEN", nil) || "test_token"
end

def client
  @client ||= Square::Client.new(
    token: test_token,
    base_url: Square::Environment::SANDBOX
  )
end

def verbose_mode?
  @verbose_mode ||= ENV.fetch("VERBOSE", "false") == "true"
end

def minitest_verbose?
  return false unless defined?(Minitest)
  
  # Check TESTOPTS environment variable for --verbose flag
  ENV['TESTOPTS']&.include?('--verbose') || ARGV.include?('--verbose')
end

def verbose?
  verbose_mode? || minitest_verbose?
end

require "minitest/autorun"
require "minitest/rg"


