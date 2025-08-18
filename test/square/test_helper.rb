# frozen_string_literal: true

require_relative "../../lib/square"

def test_token
  @test_token ||= ENV.fetch("SQUARE_TOKEN", nil) || ENV.fetch("TEST_SQUARE_TOKEN", nil) || ENV.fetch("SQUARE_SANDBOX_TOKEN", nil) || "test_token"
end

def client
  @client ||= Square::Client.new(
    token: test_token
  )
end

require "minitest/autorun"
require "minitest/rg"


