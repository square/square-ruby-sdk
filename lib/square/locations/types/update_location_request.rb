
module Square
  module Locations
    module Types
      class UpdateLocationRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false
        field :location, -> { Square::Types::Location }, optional: true, nullable: false

      end
    end
  end
end
