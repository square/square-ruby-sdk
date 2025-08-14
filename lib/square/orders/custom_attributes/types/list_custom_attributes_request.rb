
module Square
  module Orders
    module CustomAttributes
      class ListCustomAttributesRequest
        field :order_id, String, optional: false, nullable: false
        field :visibility_filter, Square::VisibilityFilter, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false
        field :limit, Integer, optional: true, nullable: false
        field :with_definitions, Internal::Types::Boolean, optional: true, nullable: false

      end
    end
  end
end
