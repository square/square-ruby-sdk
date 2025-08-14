# frozen_string_literal: true

module Square
    module Types
        class DeviceComponentDetailsWiFiDetails < Square::Internal::Types::Model
            field :active, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :ssid, String, optional: true, nullable: false
            field :ip_address_v_4, String, optional: true, nullable: false
            field :secure_connection, String, optional: true, nullable: false
            field :signal_strength, Square::DeviceComponentDetailsMeasurement, optional: true, nullable: false
        end
    end
end
