# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A tax to block from applying to a line item. The tax must be
    # identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
    class OrderLineItemPricingBlocklistsBlockedTax < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :tax_uid, -> { String }, optional: true, nullable: true

      field :tax_catalog_object_id, -> { String }, optional: true, nullable: true
    end
  end
end
