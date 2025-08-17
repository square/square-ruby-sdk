
module Square
  module Merchants
    module CustomAttributes
      module Types
        class ListCustomAttributesRequest < Internal::Types::Model
          field :merchant_id, String, optional: false, nullable: false
          field :visibility_filter, Square::Types::VisibilityFilter, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false
          field :with_definitions, Internal::Types::Boolean, optional: true, nullable: false

        end
      end
    end
  end
end
