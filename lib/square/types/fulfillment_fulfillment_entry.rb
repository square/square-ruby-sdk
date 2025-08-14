# frozen_string_literal: true

module Square
  module Types
    # Links an order line item to a fulfillment. Each entry must reference
    # a valid `uid` for an order line item in the `line_item_uid` field, as well as a `quantity` to
    # fulfill.
    class FulfillmentFulfillmentEntry < Internal::Types::Model
      field :uid, String, optional: true, nullable: false
      field :line_item_uid, String, optional: false, nullable: false
      field :quantity, String, optional: false, nullable: false
      field :metadata, Internal::Types::Hash[String, String], optional: true, nullable: false

    end
  end
end
