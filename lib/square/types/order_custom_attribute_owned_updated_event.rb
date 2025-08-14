# frozen_string_literal: true

module Square
  module Types
    # Published when an order [custom attribute](entity:CustomAttribute) associated with a [custom attribute definition](entity:CustomAttributeDefinition) that is owned by the subscribing app is updated.
    class OrderCustomAttributeOwnedUpdatedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::CustomAttributeEventData, optional: true, nullable: false

    end
  end
end
