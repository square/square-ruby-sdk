# frozen_string_literal: true

module Square
    module Types
        # Represents an individual delete response in a [BulkDeleteLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkDeleteLocationCustomAttributes)
        # request.
        class BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse < Square::Internal::Types::Model
            field :location_id, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
