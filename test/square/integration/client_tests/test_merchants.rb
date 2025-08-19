# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Merchants::Client do
  before do
    # Get first merchant ID
    merchant_response = client.merchants.list
    @merchant_id = merchant_response.data.first.id
  end

  describe "#list" do
    it "should list merchants" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request}" if verbose?

      response = client.merchants.list
      refute_nil response.data
      assert response.data.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve merchant" do
      skip "Skipping for now."
      _request = { merchant_id: @merchant_id }

      puts "request #{_request}" if verbose?

      response = client.merchants.get(merchant_id: @merchant_id)
      refute_nil response.merchant
      assert_equal @merchant_id, response.merchant.id

      puts "response #{response.to_h}" if verbose?
    end
  end
end