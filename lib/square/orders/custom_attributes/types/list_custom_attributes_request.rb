
module Square
    module Orders
        module CustomAttributes
            class ListCustomAttributesRequest < Internal::Types::Model
                field :order_id, String, optional: false, nullable: false
                field :visibility_filter, Square::VisibilityFilter, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
                field :limit, Integer, optional: true, nullable: false
                field :with_definitions, Square::Internal::Types::Boolean, optional: true, nullable: false
            end
        end
    end
end
