# frozen_string_literal: true

module Square
  module Types
    # Published when a [gift card activity](entity:GiftCardActivity) is updated. 
    # Subscribe to this event to be notified about the following changes:
    # - An update to the `REDEEM` activity for a gift card redemption made from a Square product (such as Square Point of Sale). 
    # These redemptions are initially assigned a `PENDING` state, but then change to a `COMPLETED` or `CANCELED` state.
    # - An update to the `IMPORT` activity for an imported gift card when the balance is later adjusted by Square.
    class GiftCardActivityUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::GiftCardActivityUpdatedEventData }, optional: true, nullable: false

    end
  end
end
