# frozen_string_literal: true

module Square
    module Types
        # Represents a response from listing order custom attributes.
        class ListOrderCustomAttributesResponse < Internal::Types::Model
            field :custom_attributes, Internal::Types::Array[Square::CustomAttribute], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
