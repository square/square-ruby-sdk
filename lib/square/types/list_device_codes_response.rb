# frozen_string_literal: true

module Square
    module Types
        class ListDeviceCodesResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :device_codes, Square::Internal::Types::Array[Square::DeviceCode], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
