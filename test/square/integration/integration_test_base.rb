require 'json'
require 'minitest/autorun'
require 'minitest/hell'
require 'minitest/pride'
require 'minitest/proveit'
require_relative 'test_helper'

class IntegrationTestBase < Minitest::Test
  parallelize_me!
  include Square

  # Initializes the base test controller
  def setup_class
    @client = create_client
  end
end
