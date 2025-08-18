
module Square
  module Devices
    module Codes
      module Types
        class CreateDeviceCodeRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :device_code, -> { Square::Types::DeviceCode }, optional: false, nullable: false

        end
      end
    end
  end
end
