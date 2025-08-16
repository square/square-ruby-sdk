# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `gift_card.customer_unlinked` event.
    class GiftCardCustomerUnlinkedEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::GiftCardCustomerUnlinkedEventObject, optional: true, nullable: false

    end
  end
end
