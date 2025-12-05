# frozen_string_literal: true

require "custom/test_helper"

describe Square::Merchants::Client do
  before do
    # Get first merchant ID
    merchant_response = client.merchants.list
    first_merchant = nil
    merchant_response.each do |merchant|
      first_merchant = merchant
      break
    end
    @merchant_id = first_merchant.id
  end

  describe "#list" do
    it "should list merchants" do

      response = client.merchants.list
      refute_nil response
      assert_equal Square::Internal::CursorItemIterator, response.class

      # Iterate using the iterator pattern
      merchants = []
      response.each do |merchant|
        merchants << merchant
      end
      refute_nil merchants
      assert merchants.length > 0

      puts "response merchants_count=#{merchants.length}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve merchant" do
      _request = Square::Merchants::Types::GetMerchantsRequest.new(
        merchant_id: @merchant_id
      )

      response = client.merchants.get(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::GetMerchantResponse
      refute_nil response.merchant
      assert_equal @merchant_id, response.merchant.id

      puts "response #{response.to_h}" if verbose?
    end
  end
end