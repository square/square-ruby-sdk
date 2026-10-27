# frozen_string_literal: true

module Square
  module Payouts
    module Types
      class ListEntriesPayoutsRequest < Internal::Types::Model
        field :payout_id, -> { String }, optional: false, nullable: false

        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
