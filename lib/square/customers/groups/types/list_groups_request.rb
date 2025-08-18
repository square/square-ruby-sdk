
module Square
  module Customers
    module Groups
      module Types
        class ListGroupsRequest < Internal::Types::Model
          field :cursor, String, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false

        end
      end
    end
  end
end
