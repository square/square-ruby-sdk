# frozen_string_literal: true

module Square
  module GiftCards
    module Types
      class GetGiftCardsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
