# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceMetadata < Internal::Types::Model
      field :battery_percentage, -> { String }, optional: true, nullable: true

      field :charging_state, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: true

      field :merchant_id, -> { String }, optional: true, nullable: true

      field :network_connection_type, -> { String }, optional: true, nullable: true

      field :payment_region, -> { String }, optional: true, nullable: true

      field :serial_number, -> { String }, optional: true, nullable: true

      field :os_version, -> { String }, optional: true, nullable: true

      field :app_version, -> { String }, optional: true, nullable: true

      field :wifi_network_name, -> { String }, optional: true, nullable: true

      field :wifi_network_strength, -> { String }, optional: true, nullable: true

      field :ip_address, -> { String }, optional: true, nullable: true
    end
  end
end
