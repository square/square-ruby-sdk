
module Square
  module Customers
    module Groups
      module Types
        class UpdateCustomerGroupRequest < Internal::Types::Model
          field :group_id, -> { String }, optional: false, nullable: false
          field :group, -> { Square::Types::CustomerGroup }, optional: false, nullable: false

        end
      end
    end
  end
end
