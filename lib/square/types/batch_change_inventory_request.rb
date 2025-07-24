# frozen_string_literal: true
require_relative "inventory_change"
require "ostruct"
require "json"

module square.rb
  class BatchChangeInventoryRequest
  # @return [String] A client-supplied, universally unique identifier (UUID) for the
#  request.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  in the
#  [API Development 101](https://developer.squareup.com/docs/buildbasics) section
#  for more
#  information.
    attr_reader :idempotency_key
  # @return [Array<square.rb::InventoryChange>] The set of physical counts and inventory adjustments to be made.
#  Changes are applied based on the client-supplied timestamp and may be sent
#  out of order.
    attr_reader :changes
  # @return [Boolean] Indicates whether the current physical count should be ignored if
#  the quantity is unchanged since the last physical count. Default: `true`.
    attr_reader :ignore_unchanged_counts
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A client-supplied, universally unique identifier (UUID) for the
#  request.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  in the
#  [API Development 101](https://developer.squareup.com/docs/buildbasics) section
#  for more
#  information.
    # @param changes [Array<square.rb::InventoryChange>] The set of physical counts and inventory adjustments to be made.
#  Changes are applied based on the client-supplied timestamp and may be sent
#  out of order.
    # @param ignore_unchanged_counts [Boolean] Indicates whether the current physical count should be ignored if
#  the quantity is unchanged since the last physical count. Default: `true`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BatchChangeInventoryRequest]
    def initialize(idempotency_key:, changes: OMIT, ignore_unchanged_counts: OMIT, additional_properties: nil)
      @idempotency_key = idempotency_key
      @changes = changes if changes != OMIT
      @ignore_unchanged_counts = ignore_unchanged_counts if ignore_unchanged_counts != OMIT
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key, "changes": changes, "ignore_unchanged_counts": ignore_unchanged_counts }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchChangeInventoryRequest
    #
    # @param json_object [String] 
    # @return [square.rb::BatchChangeInventoryRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      changes = parsed_json["changes"]&.map do | item |
  item = item.to_json
  square.rb::InventoryChange.from_json(json_object: item)
end
      ignore_unchanged_counts = parsed_json["ignore_unchanged_counts"]
      new(
        idempotency_key: idempotency_key,
        changes: changes,
        ignore_unchanged_counts: ignore_unchanged_counts,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchChangeInventoryRequest to a JSON object
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
      obj.idempotency_key.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      obj.changes&.is_a?(Array) != false || raise("Passed value for field obj.changes is not the expected type, validation failed.")
      obj.ignore_unchanged_counts&.is_a?(Boolean) != false || raise("Passed value for field obj.ignore_unchanged_counts is not the expected type, validation failed.")
    end
  end
end