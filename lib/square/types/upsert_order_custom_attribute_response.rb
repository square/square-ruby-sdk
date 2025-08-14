# frozen_string_literal: true

module Square
    module Types
        # Represents a response from upserting order custom attribute definitions.
        class UpsertOrderCustomAttributeResponse < Square::Internal::Types::Model
            field :custom_attribute, Square::CustomAttribute, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
