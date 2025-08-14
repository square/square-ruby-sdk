# frozen_string_literal: true

module Square
    module Types
        # Represents a [ListBookingCustomAttributes](api-endpoint:BookingCustomAttributes-ListBookingCustomAttributes) response.
        # Either `custom_attributes`, an empty object, or `errors` is present in the response. If additional
        # results are available, the `cursor` field is also present along with `custom_attributes`.
        class ListBookingCustomAttributesResponse < Internal::Types::Model
            field :custom_attributes, Internal::Types::Array[Square::CustomAttribute], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
