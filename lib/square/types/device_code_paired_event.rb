# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a Square Terminal has been paired with a
    # Terminal API client and the device_id of the paired Square Terminal is
    # available.
    class DeviceCodePairedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::DeviceCodePairedEventData }, optional: true, nullable: false
    end
  end
end
