# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Latitude and longitude coordinates.
    class Coordinates < Internal::Types::Model
      field :latitude, -> { Float }, optional: true, nullable: true

      field :longitude, -> { Float }, optional: true, nullable: true
    end
  end
end
