# frozen_string_literal: true
require_relative "order_state"
require "ostruct"
require "json"

module square.rb
  class OrderCreated
  # @return [String] The order's unique ID.
    attr_reader :order_id
  # @return [Integer] The version number, which is incremented each time an update is committed to the
#  order.
#  Orders that were not created through the API do not include a version number and
#  therefore cannot be updated.
#  [Read more about working with
#  ns.](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders)
    attr_reader :version
  # @return [String] The ID of the seller location that this order is associated with.
    attr_reader :location_id
  # @return [square.rb::OrderState] The state of the order.
#  See [OrderState](#type-orderstate) for possible values
    attr_reader :state
  # @return [String] The timestamp for when the order was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_id [String] The order's unique ID.
    # @param version [Integer] The version number, which is incremented each time an update is committed to the
#  order.
#  Orders that were not created through the API do not include a version number and
#  therefore cannot be updated.
#  [Read more about working with
#  ns.](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders)
    # @param location_id [String] The ID of the seller location that this order is associated with.
    # @param state [square.rb::OrderState] The state of the order.
#  See [OrderState](#type-orderstate) for possible values
    # @param created_at [String] The timestamp for when the order was created, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderCreated]
    def initialize(order_id: OMIT, version: OMIT, location_id: OMIT, state: OMIT, created_at: OMIT, additional_properties: nil)
      @order_id = order_id if order_id != OMIT
      @version = version if version != OMIT
      @location_id = location_id if location_id != OMIT
      @state = state if state != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_id": order_id, "version": version, "location_id": location_id, "state": state, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderCreated
    #
    # @param json_object [String] 
    # @return [square.rb::OrderCreated]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      order_id = parsed_json["order_id"]
      version = parsed_json["version"]
      location_id = parsed_json["location_id"]
      state = parsed_json["state"]
      created_at = parsed_json["created_at"]
      new(
        order_id: order_id,
        version: version,
        location_id: location_id,
        state: state,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderCreated to a JSON object
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
      obj.state&.is_a?(square.rb::OrderState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
    end
  end
end