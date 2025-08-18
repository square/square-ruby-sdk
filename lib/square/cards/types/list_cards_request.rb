
module Square
  module Cards
    module Types
      class ListCardsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :customer_id, -> { String }, optional: true, nullable: false
        field :include_disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :reference_id, -> { String }, optional: true, nullable: false
        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false

      end
    end
  end
end
