# frozen_string_literal: true

module Square
  module Devices
    module Types
      class GetDevicesRequest < Internal::Types::Model
        field :device_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
