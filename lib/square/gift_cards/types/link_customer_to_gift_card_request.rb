# frozen_string_literal: true

module Square
  module GiftCards
    module Types
      class LinkCustomerToGiftCardRequest < Internal::Types::Model
        field :gift_card_id, -> { String }, optional: false, nullable: false
        field :customer_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
