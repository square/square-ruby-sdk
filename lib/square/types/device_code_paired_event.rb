# frozen_string_literal: true

module Square
  # Published when a Square Terminal has been paired with a
  # Terminal API client and the device_id of the paired Square Terminal is
  # available.
  class DeviceCodePairedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :location_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::DeviceCodePairedEventData, optional: true, nullable: false

  end
end
