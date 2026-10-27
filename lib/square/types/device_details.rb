# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Details about the device that took the payment.
    class DeviceDetails < Internal::Types::Model
      field :device_id, -> { String }, optional: true, nullable: true

      field :device_installation_id, -> { String }, optional: true, nullable: true

      field :device_name, -> { String }, optional: true, nullable: true
    end
  end
end
