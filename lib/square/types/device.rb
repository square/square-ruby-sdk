# frozen_string_literal: true

module Square
    module Types
        class Device < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :attributes, Square::DeviceAttributes, optional: false, nullable: false
            field :components, Square::Internal::Types::Array[Square::Component], optional: true, nullable: false
            field :status, Square::DeviceStatus, optional: true, nullable: false
        end
    end
end
