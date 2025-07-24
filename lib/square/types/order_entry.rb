# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A lightweight description of an [order](entity:Order) that is returned when
#  `returned_entries` is `true` on a
#  [SearchOrdersRequest](api-endpoint:Orders-SearchOrders).
  class OrderEntry
  # @return [String] The ID of the order.
    attr_reader :order_id
  # @return [Integer] The version number, which is incremented each time an update is committed to the
#  order.
#  Orders that were not created through the API do not include a version number and
#  therefore cannot be updated.
#  [Read more about working with
#  ns.](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders)
    attr_reader :version
  # @return [String] The location ID the order belongs to.
    attr_reader :location_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_id [String] The ID of the order.
    # @param version [Integer] The version number, which is incremented each time an update is committed to the
#  order.
#  Orders that were not created through the API do not include a version number and
#  therefore cannot be updated.
#  [Read more about working with
#  ns.](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders)
    # @param location_id [String] The location ID the order belongs to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderEntry]
    def initialize(order_id: OMIT, version: OMIT, location_id: OMIT, additional_properties: nil)
      @order_id = order_id if order_id != OMIT
      @version = version if version != OMIT
      @location_id = location_id if location_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_id": order_id, "version": version, "location_id": location_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderEntry
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderEntry]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      order_id = parsed_json["order_id"]
      version = parsed_json["version"]
      location_id = parsed_json["location_id"]
      new(
        order_id: order_id,
        version: version,
        location_id: location_id,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderEntry to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end