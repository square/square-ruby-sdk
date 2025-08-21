# frozen_string_literal: true

module Square
  module GiftCards
    module Types
      class ListGiftCardsRequest < Internal::Types::Model
        field :type, -> { String }, optional: true, nullable: false
        field :state, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :customer_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
