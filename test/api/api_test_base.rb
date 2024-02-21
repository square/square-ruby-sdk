require 'json'
require 'minitest/autorun'
require 'minitest/hell'
require 'minitest/pride'
require 'minitest/proveit'
require 'square'
require_relative '../http_response_catcher'

class ApiTestBase < Minitest::Test
  parallelize_me!
  include Square
  include CoreLibrary

  # Create configuration and set any test parameters
  def create_configuration
    Configuration.new(
      access_token: ENV.fetch('SQUARE_SANDBOX_TOKEN', 'AccessToken'),
      environment: 'sandbox', http_callback: HttpResponseCatcher.new
    )
  end

  # Initializes the base test controller
  def setup_class
    _config = create_configuration
    @client = Client.new(config: _config)
  end
end
