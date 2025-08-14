
module Square
    module Orders
        module CustomAttributeDefinitions
            class ListCustomAttributeDefinitionsRequest
                field :visibility_filter, Square::VisibilityFilter, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
                field :limit, Integer, optional: true, nullable: false
            end
        end
    end
end
