# frozen_string_literal: true
require_relative "error"
require_relative "inventory_transfer"
require "ostruct"
require "json"

module SquareApiClient
  class GetInventoryTransferResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::InventoryTransfer] The requested [InventoryTransfer](entity:InventoryTransfer).
    attr_reader :transfer
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param transfer [SquareApiClient::InventoryTransfer] The requested [InventoryTransfer](entity:InventoryTransfer).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetInventoryTransferResponse]
    def initialize(errors: OMIT, transfer: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @transfer = transfer if transfer != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "transfer": transfer }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetInventoryTransferResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetInventoryTransferResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["transfer"].nil?
        transfer = parsed_json["transfer"].to_json
        transfer = SquareApiClient::InventoryTransfer.from_json(json_object: transfer)
      else
        transfer = nil
      end
      new(
        errors: errors,
        transfer: transfer,
        additional_properties: struct
      )
    end
# Serialize an instance of GetInventoryTransferResponse to a JSON object
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
      obj.transfer.nil? || SquareApiClient::InventoryTransfer.validate_raw(obj: obj.transfer)
    end
  end
end