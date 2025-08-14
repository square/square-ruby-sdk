# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that the [RetrieveLocation](api-endpoint:Locations-RetrieveLocation)
        # endpoint returns in a response.
        class GetLocationResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :location, Square::Location, optional: true, nullable: false
        end
    end
end
