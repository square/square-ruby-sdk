# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body for requests to the `RetrieveCustomerSegment` endpoint.
    # 
    # Either `errors` or `segment` is present in a given response (never both).
    class GetCustomerSegmentResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :segment, -> { Square::Types::CustomerSegment }, optional: true, nullable: false

    end
  end
end
