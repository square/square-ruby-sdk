# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a bulk upsert of order custom attributes.
        class BulkUpsertOrderCustomAttributesResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :values, Square::Internal::Types::Hash[String, Square::UpsertOrderCustomAttributeResponse], optional: false, nullable: false
        end
    end
end
