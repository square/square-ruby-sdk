# frozen_string_literal: true

module Square
  module Locations
    module Transactions
      module Types
        class ListTransactionsRequest < Internal::Types::Model
          field :location_id, -> { String }, optional: false, nullable: false

          field :begin_time, -> { String }, optional: true, nullable: true

          field :end_time, -> { String }, optional: true, nullable: true

          field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
