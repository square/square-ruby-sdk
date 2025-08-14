# frozen_string_literal: true

module Square
    module Types
        class GetDeviceResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :device, Square::Device, optional: true, nullable: false
        end
    end
end
