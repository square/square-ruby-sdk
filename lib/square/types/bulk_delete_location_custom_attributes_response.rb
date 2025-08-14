# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkDeleteLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkDeleteLocationCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual delete request.
        class BulkDeleteLocationCustomAttributesResponse < Square::Internal::Types::Model
            field :values, Square::Internal::Types::Hash[String, Square::BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse], optional: false, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
