# frozen_string_literal: true
require_relative "error"
require_relative "terminal_refund"
require "ostruct"
require "json"

module SquareApiClient
  class GetTerminalRefundResponse
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::TerminalRefund] The requested `Refund`.
    attr_reader :refund
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param refund [SquareApiClient::TerminalRefund] The requested `Refund`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetTerminalRefundResponse]
    def initialize(errors: OMIT, refund: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @refund = refund if refund != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "refund": refund }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetTerminalRefundResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetTerminalRefundResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["refund"].nil?
        refund = parsed_json["refund"].to_json
        refund = SquareApiClient::TerminalRefund.from_json(json_object: refund)
      else
        refund = nil
      end
      new(
        errors: errors,
        refund: refund,
        additional_properties: struct
      )
    end
# Serialize an instance of GetTerminalRefundResponse to a JSON object
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
      obj.refund.nil? || SquareApiClient::TerminalRefund.validate_raw(obj: obj.refund)
    end
  end
end