# frozen_string_literal: true

module Square
    module Types
        class DeviceMetadata < Square::Internal::Types::Model
            field :battery_percentage, String, optional: true, nullable: false
            field :charging_state, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :merchant_id, String, optional: true, nullable: false
            field :network_connection_type, String, optional: true, nullable: false
            field :payment_region, String, optional: true, nullable: false
            field :serial_number, String, optional: true, nullable: false
            field :os_version, String, optional: true, nullable: false
            field :app_version, String, optional: true, nullable: false
            field :wifi_network_name, String, optional: true, nullable: false
            field :wifi_network_strength, String, optional: true, nullable: false
            field :ip_address, String, optional: true, nullable: false
        end
    end
end
