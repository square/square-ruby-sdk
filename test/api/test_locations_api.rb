require_relative 'api_test_base'

class LocationsApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    @response_catcher = HttpResponseCatcher.new
    @controller = LocationsApi.new CONFIG, http_call_back: @response_catcher
  end

  # Provides information of all locations of a business.
  #
  #Many Square API endpoints require a `location_id` parameter.
  #The `id` field of the [`Location`]($m/Location) objects returned by this
  #endpoint correspond to that `location_id` parameter.
  def test_list_locations()

    # Perform the API call through the SDK function
    result = @controller.list_locations()

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)
  end

end
