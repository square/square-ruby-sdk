# frozen_string_literal: true

module Square
  module Locations
    module Types
      class GetLocationsRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
