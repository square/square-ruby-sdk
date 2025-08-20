# frozen_string_literal: true

require "test_helper"

describe Square::Devices::Codes::Client do
  before do
    skip "Skipping for now."
    _create_request = Square::Devices::Codes::Types::CreateDeviceCodeRequest.new(
      idempotency_key: SecureRandom.uuid,
      device_code: Square::Devices::Types::DeviceCode.new(
        product_type: "TERMINAL_API"
      )
    )
    create_response = client.devices.codes.create(**_create_request.to_h)
    @device_code_id = create_response.device_code.id
  end

  describe "#list" do
    it "should list device codes" do
      skip "Skipping for now."

      response = client.devices.codes.list
      refute_nil response
      assert_equal response.class, Square::Types::ListDeviceCodesResponse
      refute_nil response.device_codes
      assert response.device_codes.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#create" do
    it "should create device code" do
      skip "Skipping for now."
      _request = Square::Devices::Codes::Types::CreateDeviceCodeRequest.new(
        idempotency_key: SecureRandom.uuid,
        device_code: Square::Devices::Types::DeviceCode.new(
          product_type: "TERMINAL_API"
        )
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.devices.codes.create(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::CreateDeviceCodeResponse
      refute_nil response.device_code
      assert_equal "TERMINAL_API", response.device_code.product_type

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should get device code" do
      skip "Skipping for now."
      _request = Square::Devices::Codes::Types::GetDeviceCodeRequest.new(
        id: @device_code_id
      )

      response = client.devices.codes.get(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::GetDeviceCodeResponse
      refute_nil response.device_code
      assert_equal @device_code_id, response.device_code.id
      assert_equal "TERMINAL_API", response.device_code.product_type

      puts "response #{response.to_h}" if verbose?
    end
  end
end