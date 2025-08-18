require_relative 'helpers'
require_relative 'integration_test_base'

class LegacyTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_should_list_locations
    response = @legacy_client.locations_api.list_locations

    refute_nil response.result.locations
    assert response.result.locations.length > 0
  end
end
