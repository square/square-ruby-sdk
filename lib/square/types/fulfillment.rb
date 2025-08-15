# frozen_string_literal: true

module Square
  # Contains details about how to fulfill this order.
  # Orders can only be created with at most one fulfillment using the API.
  # However, orders returned by the Orders API might contain multiple fulfillments because sellers can create multiple fulfillments using Square products such as Square Online.
  class Fulfillment < Internal::Types::Model
    field :uid, String, optional: true, nullable: false
    field :type, Square::FulfillmentType, optional: true, nullable: false
    field :state, Square::FulfillmentState, optional: true, nullable: false
    field :line_item_application, Square::FulfillmentFulfillmentLineItemApplication, optional: true, nullable: false
    field :entries, Internal::Types::Array[Square::FulfillmentFulfillmentEntry], optional: true, nullable: false
    field :metadata, Internal::Types::Hash[String, String], optional: true, nullable: false
    field :pickup_details, Square::FulfillmentPickupDetails, optional: true, nullable: false
    field :shipment_details, Square::FulfillmentShipmentDetails, optional: true, nullable: false
    field :delivery_details, Square::FulfillmentDeliveryDetails, optional: true, nullable: false

  end
end
