# frozen_string_literal: true

module Square
  module Types
    # Represents a
    # [BulkDeleteBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkDeleteBookingCustomAttributes)
    # response,
    # which contains a map of responses that each corresponds to an individual delete request.
    class BulkDeleteBookingCustomAttributesResponse < Internal::Types::Model
      field :values, -> { Internal::Types::Hash[String, Square::Types::BookingCustomAttributeDeleteResponse] }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
