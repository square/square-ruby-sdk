# frozen_string_literal: true

module Square
    module Types
        class ListDevicesResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :devices, Square::Internal::Types::Array[Square::Device], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
