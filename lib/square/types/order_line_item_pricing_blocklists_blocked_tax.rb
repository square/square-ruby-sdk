# frozen_string_literal: true

module Square
  # A tax to block from applying to a line item. The tax must be
  # identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
  class OrderLineItemPricingBlocklistsBlockedTax < Internal::Types::Model
    field :uid, String, optional: true, nullable: false
    field :tax_uid, String, optional: true, nullable: false
    field :tax_catalog_object_id, String, optional: true, nullable: false

  end
end
