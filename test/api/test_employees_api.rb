

require_relative 'api_test_base'

class EmployeesApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.employees
    @response_catcher = @controller.http_call_back
  end

  # Gets a list of `Employee` objects for a business.
  def test_test_list_employees()
    # Parameters for the API call
    location_id = nil
    status = nil
    limit = nil
    cursor = nil

    # Perform the API call through the SDK function
    result = @controller.list_employees(location_id: location_id, status: status, limit: limit, cursor: cursor)

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = 'application/json'

    assert(ComparisonHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

end
