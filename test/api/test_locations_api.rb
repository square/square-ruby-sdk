require_relative 'api_test_base'

class LocationsApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.locations
    @response_catcher = @controller.http_call_back
  end

  # Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
  #including those with an inactive status. Locations are listed alphabetically by `name`.
  def test_list_locations

    # Perform the API call through the SDK function
    result = @controller.list_locations()

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)
  end

end