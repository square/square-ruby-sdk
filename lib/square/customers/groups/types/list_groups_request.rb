# frozen_string_literal: true

module Square
  module Customers
    module Groups
      module Types
        class ListGroupsRequest < Internal::Types::Model
          field :cursor, -> { String }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
