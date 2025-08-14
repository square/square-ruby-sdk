# frozen_string_literal: true

module Square
    module Types
        # Represents a response from deleting one or more order custom attributes.
        class BulkDeleteOrderCustomAttributesResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :values, Square::Internal::Types::Hash[String, Square::DeleteOrderCustomAttributeResponse], optional: false, nullable: false
        end
    end
end
