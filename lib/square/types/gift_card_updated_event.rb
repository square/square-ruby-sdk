# frozen_string_literal: true

module Square
  # Published when a [gift card](entity:GiftCard) is updated. This includes
  # changes to the state, balance, and customer association.
  class GiftCardUpdatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::GiftCardUpdatedEventData, optional: true, nullable: false

  end
end
