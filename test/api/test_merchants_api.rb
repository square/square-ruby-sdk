

require_relative 'api_test_base'

class MerchantsApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.merchants
    @response_catcher = @controller.http_call_back
  end

  # Returns `Merchant` information for a given access token.
  #
  #If you don't know a `Merchant` ID, you can use this endpoint to retrieve the merchant ID for an access token.
  #You can specify your personal access token to get your own merchant information or specify an OAuth token
  #to get the information for the  merchant that granted you access.
  #
  #If you know the merchant ID, you can also use the [RetrieveMerchant](#endpoint-merchants-retrievemerchant)
  #endpoint to get the merchant information.
  def test_list_merchants()
    # Parameters for the API call
    cursor = nil

    # Perform the API call through the SDK function
    result = @controller.list_merchants(cursor: cursor)

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = 'application/json'

    assert(ComparisonHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

end
