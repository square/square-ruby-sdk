
module Square
  module Merchants
    module CustomAttributeDefinitions
      module Types
        class ListCustomAttributeDefinitionsRequest < Internal::Types::Model
          field :visibility_filter, Square::Types::VisibilityFilter, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false

        end
      end
    end
  end
end
