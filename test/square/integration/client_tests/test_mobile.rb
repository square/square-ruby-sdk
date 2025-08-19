# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Mobile::Client do
  describe "#authorization_code" do
    it "should create mobile authorization code" do
      skip "Skipping for now."
      _request = { location_id: client.locations.list.locations.first.id }

      puts "request #{_request.to_h}" if verbose?

      response = client.mobile.authorization_code(request: _request.to_h)
      refute_nil response.authorization_code
      refute_nil response.expires_at

      puts "response #{response.to_h}" if verbose?
    end
  end
end