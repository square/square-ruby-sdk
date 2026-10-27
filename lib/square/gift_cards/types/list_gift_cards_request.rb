# frozen_string_literal: true

module Square
  module GiftCards
    module Types
      class ListGiftCardsRequest < Internal::Types::Model
        field :type, -> { String }, optional: true, nullable: true

        field :state, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :customer_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
