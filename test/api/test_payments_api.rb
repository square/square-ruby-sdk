

require_relative 'api_test_base'

class PaymentsApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.payments
    @response_catcher = @controller.http_call_back
  end

  # Retrieves a list of payments taken by the account making the request.
  #
  #Max results per page: 100
  def test_test_list_payments()
    # Parameters for the API call
    begin_time = nil
    end_time = nil
    sort_order = nil
    cursor = nil
    location_id = nil
    total = nil
    last_4 = nil
    card_brand = nil

    # Perform the API call through the SDK function
    result = @controller.list_payments(begin_time: begin_time, end_time: end_time, sort_order: sort_order, cursor: cursor, location_id: location_id, total: total, last_4: last_4, card_brand: card_brand)

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = 'application/json'

    assert(ComparisonHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

end
