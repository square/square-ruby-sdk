require_relative './helpers'
require_relative './integration_test_base'

class DevicesTest < IntegrationTestBase
  def setup
    setup_class
    create_response = @client.devices.codes.create(
      idempotency_key: new_test_uuid,
      device_code: Square::Types::DeviceCode.new(
        product_type: "TERMINAL_API"
      )
    )
    @device_code_id = create_response.device_code.id
  end

  def test_should_list_device_codes
    response = @client.devices.codes.list
    refute_nil response
    refute_nil response.data
    assert response.data.length > 0
  end

  def test_should_create_device_code
    response = @client.devices.codes.create(
      idempotency_key: new_test_uuid,
      device_code: Square::Types::DeviceCode.new(
        product_type: "TERMINAL_API"
      )
    )

    refute_nil response.device_code
    assert_equal "TERMINAL_API", response.device_code.product_type
  end

  def test_should_get_device_code
    response = @client.devices.codes.get(id: @device_code_id)

    refute_nil response.device_code
    assert_equal @device_code_id, response.device_code.id
    assert_equal "TERMINAL_API", response.device_code.product_type
  end
end
