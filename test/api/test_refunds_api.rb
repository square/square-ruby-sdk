

require_relative 'api_test_base'

class RefundsApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.refunds
    @response_catcher = @controller.http_call_back
  end

  # Retrieves a list of refunds for the account making the request.
  #
  #Max results per page: 100
  def test_test_list_payment_refunds()
    # Parameters for the API call
    begin_time = nil
    end_time = nil
    sort_order = nil
    cursor = nil
    location_id = nil
    status = nil
    source_type = nil

    # Perform the API call through the SDK function
    result = @controller.list_payment_refunds(begin_time: begin_time, end_time: end_time, sort_order: sort_order, cursor: cursor, location_id: location_id, status: status, source_type: source_type)

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = 'application/json'

    assert(ComparisonHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

end
