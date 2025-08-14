
module Square
    module Cards
        class ListCardsRequest
            field :cursor, String, optional: true, nullable: false
            field :customer_id, String, optional: true, nullable: false
            field :include_disabled, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :reference_id, String, optional: true, nullable: false
            field :sort_order, Square::SortOrder, optional: true, nullable: false
        end
    end
end
