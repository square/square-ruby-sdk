require_relative './helpers'
require_relative './integration_test_base'

class MobileAuthorizationTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_should_create_mobile_authorization_code
    response = @client.mobile.authorization_code(
      location_id: get_default_location_id(@client)
    )

    refute_nil response.authorization_code
    refute_nil response.expires_at
  end
end
