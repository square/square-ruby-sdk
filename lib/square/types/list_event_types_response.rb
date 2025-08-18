# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [ListEventTypes](api-endpoint:Events-ListEventTypes) endpoint.
    # 
    # Note: if there are errors processing the request, the event types field will not be
    # present.
    class ListEventTypesResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :event_types, Internal::Types::Array[String], optional: true, nullable: false
      field :metadata, Internal::Types::Array[Square::Types::EventTypeMetadata], optional: true, nullable: false

    end
  end
end
