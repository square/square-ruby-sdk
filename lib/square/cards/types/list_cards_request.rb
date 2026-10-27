# frozen_string_literal: true

module Square
  module Cards
    module Types
      class ListCardsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true

        field :customer_id, -> { String }, optional: true, nullable: true

        field :include_disabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :reference_id, -> { String }, optional: true, nullable: true

        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true
      end
    end
  end
end
