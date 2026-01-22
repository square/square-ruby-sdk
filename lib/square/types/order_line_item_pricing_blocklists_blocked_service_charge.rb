# frozen_string_literal: true

module Square
  module Types
    # A service charge to block from applying to a line item. The service charge
    # must be identified by either `service_charge_uid` or
    # `service_charge_catalog_object_id`, but not both.
    class OrderLineItemPricingBlocklistsBlockedServiceCharge < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :service_charge_uid, -> { String }, optional: true, nullable: false
      field :service_charge_catalog_object_id, -> { String }, optional: true, nullable: false
    end
  end
end
