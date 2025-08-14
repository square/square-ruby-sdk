
module Square
    module Merchants
        module CustomAttributes
            class GetCustomAttributesRequest < Internal::Types::Model
                field :merchant_id, String, optional: false, nullable: false
                field :key, String, optional: false, nullable: false
                field :with_definition, Square::Internal::Types::Boolean, optional: true, nullable: false
                field :version, Integer, optional: true, nullable: false
            end
        end
    end
end
