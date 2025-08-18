
module Square
  module Locations
    module Transactions
      module Types
        class ListTransactionsRequest < Internal::Types::Model
          field :location_id, -> { String }, optional: false, nullable: false
          field :begin_time, -> { String }, optional: true, nullable: false
          field :end_time, -> { String }, optional: true, nullable: false
          field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
