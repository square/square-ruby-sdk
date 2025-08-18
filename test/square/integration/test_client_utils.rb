require_relative 'helpers'
require_relative 'integration_test_base'

class ClientUtilsTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_should_generate_a_new_uuid
    uuid = new_test_uuid
    assert_match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, uuid
  end

  def test_should_generate_a_new_square_temporary_id
    temp_id = new_test_square_temp_id
    assert_match /^#[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, temp_id
  end

  def test_should_create_a_new_money_object
    amount = 1000
    money = new_test_money(amount)
    expected_money = Square::Types::Money.new(amount: amount, currency: "USD")
    assert_equal expected_money, money
  end

  def test_should_get_the_default_location_id
    location_id = get_default_location_id(@client)
    refute_nil location_id
  end
end
