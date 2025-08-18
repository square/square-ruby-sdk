
module Square
  module Locations
    module CustomAttributes
      module Types
        class GetCustomAttributesRequest < Internal::Types::Model
          field :location_id, String, optional: false, nullable: false
          field :key, String, optional: false, nullable: false
          field :with_definition, Internal::Types::Boolean, optional: true, nullable: false
          field :version, Integer, optional: true, nullable: false

        end
      end
    end
  end
end
