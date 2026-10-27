# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a [customer](entity:Customer) is linked to a [gift card](entity:GiftCard).
    class GiftCardCustomerLinkedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::GiftCardCustomerLinkedEventData }, optional: true, nullable: false
    end
  end
end
