# frozen_string_literal: true

module Square
  module Types
    # A response that contains the unlinked `GiftCard` object. If the request resulted in errors,
    # the response contains a set of `Error` objects.
    class UnlinkCustomerFromGiftCardResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :gift_card, -> { Square::Types::GiftCard }, optional: true, nullable: false
    end
  end
end
