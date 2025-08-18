
module Square
  module Locations
    module Types
      class CreateLocationRequest < Internal::Types::Model
        field :location, -> { Square::Types::Location }, optional: true, nullable: false

      end
    end
  end
end
