# frozen_string_literal: true

module Square
  module Types
    # A discount to block from applying to a line item. The discount must be
    # identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
    class OrderLineItemPricingBlocklistsBlockedDiscount < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :discount_uid, -> { String }, optional: true, nullable: false
      field :discount_catalog_object_id, -> { String }, optional: true, nullable: false
    end
  end
end
