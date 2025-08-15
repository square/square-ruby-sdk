# frozen_string_literal: true

module Square
  # Details about the device that took the payment.
  class DeviceDetails < Internal::Types::Model
    field :device_id, String, optional: true, nullable: false
    field :device_installation_id, String, optional: true, nullable: false
    field :device_name, String, optional: true, nullable: false

  end
end
