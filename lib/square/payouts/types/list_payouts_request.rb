# frozen_string_literal: true

module Square
  module Payouts
    module Types
      class ListPayoutsRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: true, nullable: true

        field :status, -> { Square::Types::PayoutStatus }, optional: true, nullable: true

        field :begin_time, -> { String }, optional: true, nullable: true

        field :end_time, -> { String }, optional: true, nullable: true

        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
