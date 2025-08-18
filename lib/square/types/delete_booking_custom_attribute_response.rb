# frozen_string_literal: true

module Square
  module Types
    # Represents a [DeleteBookingCustomAttribute](api-endpoint:BookingCustomAttributes-DeleteBookingCustomAttribute) response.
    # Either an empty object `{}` (for a successful deletion) or `errors` is present in the response.
    class DeleteBookingCustomAttributeResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
