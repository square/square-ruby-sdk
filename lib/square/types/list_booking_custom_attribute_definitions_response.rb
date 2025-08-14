# frozen_string_literal: true

module Square
    module Types
        # Represents a [ListBookingCustomAttributeDefinitions](api-endpoint:BookingCustomAttributes-ListBookingCustomAttributeDefinitions) response.
        # Either `custom_attribute_definitions`, an empty object, or `errors` is present in the response.
        # If additional results are available, the `cursor` field is also present along with `custom_attribute_definitions`.
        class ListBookingCustomAttributeDefinitionsResponse < Square::Internal::Types::Model
            field :custom_attribute_definitions, Square::Internal::Types::Array[Square::CustomAttributeDefinition], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
