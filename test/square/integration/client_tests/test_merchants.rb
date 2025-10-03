# frozen_string_literal: true

require "test_helper"

describe Square::Merchants::Client do
  let :base_url do
    Square::Environment::SANDBOX
  end

  let :client do
    Square::Client.new(
      token: "api_token",
      base_url: base_url
    )
  end

  def sample_merchant
    Square::Types::Merchant.new(
      id: SecureRandom.uuid,
      business_name: SecureRandom.uuid,
      country: Square::Types::Country::ZZ,
      language_code: "en",
      currency: Square::Types::Currency::USD,
      status: Square::Types::MerchantStatus::ACTIVE,
      main_location_id: SecureRandom.uuid,
      created_at: SecureRandom.uuid,
    )
  end

  describe "#list" do
    let :merchants do
      10.times.map { sample_merchant }
    end

    it "should list merchants" do
      stub_request(:get, "#{base_url}/v2/merchants").
        to_return(status: 200, body: Square::Types::ListMerchantsResponse.new(merchant: merchants, errors: [], cursor: 10).to_h.to_json)

      response = client.merchants.list
      refute_nil response
      assert_equal Square::Types::ListMerchantsResponse, response.class
      refute_nil response.merchant
      assert response.merchant.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    let :merchant do
      sample_merchant
    end

    it "should retrieve merchant" do
      stub_request(:get, "#{base_url}/v2/merchants/#{merchant.id}").
        to_return(status: 200, body: Square::Types::GetMerchantResponse.new(merchant: merchant, errors: []).to_h.to_json)

      _request = Square::Merchants::Types::GetMerchantsRequest.new(
        merchant_id: merchant.id
      )

      response = client.merchants.get(**_request.to_h)
      refute_nil response
      assert_equal Square::Types::GetMerchantResponse, response.class
      refute_nil response.merchant
      assert_equal merchant.id, response.merchant.id

      puts "response #{response.to_h}" if verbose?
    end
  end
end