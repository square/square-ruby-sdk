# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class DeletePaymentLinkResponse
  # @return [Array<square.rb::Error>] 
    attr_reader :errors
  # @return [String] The ID of the link that is deleted.
    attr_reader :id
  # @return [String] The ID of the order that is canceled. When a payment link is deleted, Square
#  updates the
#  the `state` (of the order that the checkout link created) to CANCELED.
    attr_reader :cancelled_order_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] 
    # @param id [String] The ID of the link that is deleted.
    # @param cancelled_order_id [String] The ID of the order that is canceled. When a payment link is deleted, Square
#  updates the
#  the `state` (of the order that the checkout link created) to CANCELED.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DeletePaymentLinkResponse]
    def initialize(errors: OMIT, id: OMIT, cancelled_order_id: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @id = id if id != OMIT
      @cancelled_order_id = cancelled_order_id if cancelled_order_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "id": id, "cancelled_order_id": cancelled_order_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeletePaymentLinkResponse
    #
    # @param json_object [String] 
    # @return [square.rb::DeletePaymentLinkResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      id = parsed_json["id"]
      cancelled_order_id = parsed_json["cancelled_order_id"]
      new(
        errors: errors,
        id: id,
        cancelled_order_id: cancelled_order_id,
        additional_properties: struct
      )
    end
# Serialize an instance of DeletePaymentLinkResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.cancelled_order_id&.is_a?(String) != false || raise("Passed value for field obj.cancelled_order_id is not the expected type, validation failed.")
    end
  end
end