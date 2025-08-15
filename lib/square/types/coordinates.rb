# frozen_string_literal: true

module Square
  # Latitude and longitude coordinates.
  class Coordinates < Internal::Types::Model
    field :latitude, Integer, optional: true, nullable: false
    field :longitude, Integer, optional: true, nullable: false

  end
end
