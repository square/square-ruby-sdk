# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [SearchEvents](api-endpoint:Events-SearchEvents) endpoint.
    # 
    # Note: if there are errors processing the request, the events field will not be
    # present.
    class SearchEventsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :events, Internal::Types::Array[Square::Types::Event], optional: true, nullable: false
      field :metadata, Internal::Types::Array[Square::Types::EventMetadata], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
