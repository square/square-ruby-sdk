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
    token = ENV.fetch('SQUARE_SANDBOX_TOKEN', 'AccessToken')
    puts "Using token: #{token[0..5]}... in test #{self.class.name}##{self.name}"  # Log token prefix
    
    config = Configuration.new(
      bearer_auth_credentials: Square::BearerAuthCredentials.new(
        access_token: token
      ),
      environment: 'sandbox',
      http_callback: HttpResponseCatcher.new
    )
    puts "Configuration created with environment: #{config.environment}"
    config
  end

  # Initializes the base test controller
  def setup_class
    _config = create_configuration
    @client = Client.new(config: _config)
  end

  def after_request(response)
    if response.status_code != 200
      puts "Request failed for #{self.class.name}##{self.name}"
      puts "Status code: #{response.status_code}"
      puts "Errors: #{response.errors.inspect}" if response.errors
      puts "Headers: #{response.headers.inspect}" if response.headers
    end
  end
end