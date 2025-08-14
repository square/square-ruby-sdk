# frozen_string_literal: true

module Square
    module Types
        # The response object returned by the [CreateLocation](api-endpoint:Locations-CreateLocation) endpoint.
        class CreateLocationResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :location, Square::Location, optional: true, nullable: false
        end
    end
end
