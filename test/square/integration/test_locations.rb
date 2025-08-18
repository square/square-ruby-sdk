require_relative 'helpers'
require_relative 'integration_test_base'

class LocationsTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_should_list_locations
    response = @client.locations.list

    refute_nil response.locations
    assert response.locations.length > 0
  end
end
