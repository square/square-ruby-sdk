# frozen_string_literal: true

module Square
  # Published when a [customer](entity:Customer) is unlinked from a [gift card](entity:GiftCard).
  class GiftCardCustomerUnlinkedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::GiftCardCustomerUnlinkedEventData, optional: true, nullable: false

  end
end
