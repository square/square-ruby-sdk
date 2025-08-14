# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of a request
        # to the [ListLocations](api-endpoint:Locations-ListLocations) endpoint.
        # 
        # Either `errors` or `locations` is present in a given response (never both).
        class ListLocationsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :locations, Square::Internal::Types::Array[Square::Location], optional: true, nullable: false
        end
    end
end
