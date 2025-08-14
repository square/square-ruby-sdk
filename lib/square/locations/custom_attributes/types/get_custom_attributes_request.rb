
module Square
    module Locations
        module CustomAttributes
            class GetCustomAttributesRequest < Internal::Types::Model
                field :location_id, String, optional: false, nullable: false
                field :key, String, optional: false, nullable: false
                field :with_definition, Square::Internal::Types::Boolean, optional: true, nullable: false
                field :version, Integer, optional: true, nullable: false
            end
        end
    end
end
