# frozen_string_literal: true

module Square
  module GiftCards
    module Activities
      module Types
        class ListActivitiesRequest < Internal::Types::Model
          field :gift_card_id, -> { String }, optional: true, nullable: true

          field :type, -> { String }, optional: true, nullable: true

          field :location_id, -> { String }, optional: true, nullable: true

          field :begin_time, -> { String }, optional: true, nullable: true

          field :end_time, -> { String }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true

          field :sort_order, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
