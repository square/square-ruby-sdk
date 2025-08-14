# frozen_string_literal: true

module Square
    module Types
        # Latitude and longitude coordinates.
        class Coordinates < Square::Internal::Types::Model
            field :latitude, Integer, optional: true, nullable: false
            field :longitude, Integer, optional: true, nullable: false
        end
    end
end
