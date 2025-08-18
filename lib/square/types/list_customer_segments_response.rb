# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body for requests to the `ListCustomerSegments` endpoint.
    # 
    # Either `errors` or `segments` is present in a given response (never both).
    class ListCustomerSegmentsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :segments, Internal::Types::Array[Square::Types::CustomerSegment], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
