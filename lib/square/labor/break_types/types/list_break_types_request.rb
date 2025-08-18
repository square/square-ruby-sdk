
module Square
  module Labor
    module BreakTypes
      module Types
        class ListBreakTypesRequest < Internal::Types::Model
          field :location_id, String, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false

        end
      end
    end
  end
end
