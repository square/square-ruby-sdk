# frozen_string_literal: true

require "test_helper"

describe Square::Merchants::Client do
  before do
    skip "Skipping for now."
    # Get first merchant ID
    merchant_response = client.merchants.list
    @merchant_id = merchant_response.data.first.id
  end

  describe "#list" do
    it "should list merchants" do
      skip "Skipping for now."

      response = client.merchants.list
      refute_nil response
      assert_equal response.class, Square::Types::ListMerchantsResponse
      refute_nil response.merchant
      assert response.merchant.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve merchant" do
      skip "Skipping for now."
      _request = Square::Merchants::Types::GetMerchantRequest.new(
        merchant_id: @merchant_id
      )

      response = client.merchants.get(request: _request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::GetMerchantResponse
      refute_nil response.merchant
      assert_equal @merchant_id, response.merchant.id

      puts "response #{response.to_h}" if verbose?
    end
  end
end