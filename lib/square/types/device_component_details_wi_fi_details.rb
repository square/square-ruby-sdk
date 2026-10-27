# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceComponentDetailsWiFiDetails < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :ssid, -> { String }, optional: true, nullable: true

      field :ip_address_v_4, -> { String }, optional: true, nullable: true, api_name: "ip_address_v4"

      field :secure_connection, -> { String }, optional: true, nullable: true

      field :signal_strength, -> { Square::Types::DeviceComponentDetailsMeasurement }, optional: true, nullable: false

      field :mac_address, -> { String }, optional: true, nullable: true
    end
  end
end
