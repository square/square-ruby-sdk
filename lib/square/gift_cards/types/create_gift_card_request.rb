# frozen_string_literal: true

module Square
  module GiftCards
    module Types
      class CreateGiftCardRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :location_id, -> { String }, optional: false, nullable: false
        field :gift_card, -> { Square::Types::GiftCard }, optional: false, nullable: false
      end
    end
  end
end
