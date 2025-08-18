
module Square
  module Locations
    module CustomAttributes
      module Types
        class DeleteCustomAttributesRequest < Internal::Types::Model
          field :location_id, -> { String }, optional: false, nullable: false
          field :key, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
