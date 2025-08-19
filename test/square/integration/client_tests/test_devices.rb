# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Devices::Codes::Client do
  before do
    create_response = client.devices.codes.create(
      idempotency_key: SecureRandom.uuid,
      device_code: Square::Devices::Types::DeviceCode.new(
        product_type: "TERMINAL_API"
      )
    )
    @device_code_id = create_response.device_code.id
  end

  describe "#list" do
    it "should list device codes" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request.to_h}" if verbose?

      response = client.devices.codes.list
      refute_nil response
      refute_nil response.data
      assert response.data.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#create" do
    it "should create device code" do
      skip "Skipping for now."
      _request = {
        idempotency_key: SecureRandom.uuid,
        device_code: Square::Devices::Types::DeviceCode.new(
          product_type: "TERMINAL_API"
        )
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.devices.codes.create(request: _request.to_h)
      refute_nil response.device_code
      assert_equal "TERMINAL_API", response.device_code.product_type

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should get device code" do
      skip "Skipping for now."
      _request = { id: @device_code_id }

      puts "request #{_request.to_h}" if verbose?

      response = client.devices.codes.get(id: @device_code_id)
      refute_nil response.device_code
      assert_equal @device_code_id, response.device_code.id
      assert_equal "TERMINAL_API", response.device_code.product_type

      puts "response #{response.to_h}" if verbose?
    end
  end
end