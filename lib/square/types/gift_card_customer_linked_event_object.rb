# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An object that contains the gift card and customer ID associated with a
    # `gift_card.customer_linked` event.
    class GiftCardCustomerLinkedEventObject < Internal::Types::Model
      field :gift_card, -> { Square::Types::GiftCard }, optional: true, nullable: false

      field :linked_customer_id, -> { String }, optional: true, nullable: true
    end
  end
end
