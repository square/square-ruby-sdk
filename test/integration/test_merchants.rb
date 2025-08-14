require_relative './helpers'
require_relative './integration_test_base'

class MerchantsTest < IntegrationTestBase
  def setup
    setup_class
    # Get first merchant ID
    merchant_response = @client.merchants.list
    @merchant_id = merchant_response.data.first.id
  end

  def test_should_list_merchants
    response = @client.merchants.list

    refute_nil response.data
    assert response.data.length > 0
  end

  def test_should_retrieve_merchant
    response = @client.merchants.get(merchant_id: @merchant_id)

    refute_nil response.merchant
    assert_equal @merchant_id, response.merchant.id
  end
end
