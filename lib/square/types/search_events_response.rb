# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [SearchEvents](api-endpoint:Events-SearchEvents) endpoint.
        # 
        # Note: if there are errors processing the request, the events field will not be
        # present.
        class SearchEventsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :events, Square::Internal::Types::Array[Square::Event], optional: true, nullable: false
            field :metadata, Square::Internal::Types::Array[Square::EventMetadata], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
