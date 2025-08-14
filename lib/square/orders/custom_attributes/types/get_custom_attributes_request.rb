
module Square
    module Orders
        module CustomAttributes
            class GetCustomAttributesRequest < Internal::Types::Model
                field :order_id, String, optional: false, nullable: false
                field :custom_attribute_key, String, optional: false, nullable: false
                field :version, Integer, optional: true, nullable: false
                field :with_definition, Square::Internal::Types::Boolean, optional: true, nullable: false
            end
        end
    end
end
