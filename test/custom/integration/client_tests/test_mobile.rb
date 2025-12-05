# frozen_string_literal: true

require "custom/test_helper"

describe Square::Mobile::Client do
  describe "#authorization_code" do
    it "should create mobile authorization code" do
      _request = Square::Mobile::Types::CreateMobileAuthorizationCodeRequest.new(
        location_id: client.locations.list.locations.first.id
      )

      response = client.mobile.authorization_code(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::CreateMobileAuthorizationCodeResponse
      refute_nil response.authorization_code
      refute_nil response.expires_at

      puts "response #{response.to_h}" if verbose?
    end
  end
end