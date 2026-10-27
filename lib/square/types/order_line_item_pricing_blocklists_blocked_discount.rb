# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A discount to block from applying to a line item. The discount must be
    # identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
    class OrderLineItemPricingBlocklistsBlockedDiscount < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :discount_uid, -> { String }, optional: true, nullable: true

      field :discount_catalog_object_id, -> { String }, optional: true, nullable: true
    end
  end
end
