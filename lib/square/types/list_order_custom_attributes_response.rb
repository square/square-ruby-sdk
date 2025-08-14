# frozen_string_literal: true

module Square
    module Types
        # Represents a response from listing order custom attributes.
        class ListOrderCustomAttributesResponse < Square::Internal::Types::Model
            field :custom_attributes, Square::Internal::Types::Array[Square::CustomAttribute], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
