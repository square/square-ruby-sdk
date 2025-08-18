# frozen_string_literal: true

module Square
  module Types
    # Represents a [DeleteBookingCustomAttributeDefinition](api-endpoint:BookingCustomAttributes-DeleteBookingCustomAttributeDefinition) response
    # containing error messages when errors occurred during the request. The successful response does not contain any payload.
    class DeleteBookingCustomAttributeDefinitionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
