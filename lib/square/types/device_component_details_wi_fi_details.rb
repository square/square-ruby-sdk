# frozen_string_literal: true

module Square
  class DeviceComponentDetailsWiFiDetails < Internal::Types::Model
    field :active, Internal::Types::Boolean, optional: true, nullable: false
    field :ssid, String, optional: true, nullable: false
    field :ip_address_v_4, String, optional: true, nullable: false
    field :secure_connection, String, optional: true, nullable: false
    field :signal_strength, Square::DeviceComponentDetailsMeasurement, optional: true, nullable: false

  end
end
