# frozen_string_literal: true
require_relative "error"
require_relative "terminal_refund"
require "ostruct"
require "json"

module square.rb
  class CancelTerminalRefundResponse
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [square.rb::TerminalRefund] The updated `TerminalRefund`.
    attr_reader :refund
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param refund [square.rb::TerminalRefund] The updated `TerminalRefund`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CancelTerminalRefundResponse]
    def initialize(errors: OMIT, refund: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @refund = refund if refund != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "refund": refund }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CancelTerminalRefundResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CancelTerminalRefundResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["refund"].nil?
        refund = parsed_json["refund"].to_json
        refund = square.rb::TerminalRefund.from_json(json_object: refund)
      else
        refund = nil
      end
      new(
        errors: errors,
        refund: refund,
        additional_properties: struct
      )
    end
# Serialize an instance of CancelTerminalRefundResponse to a JSON object
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
      obj.refund.nil? || square.rb::TerminalRefund.validate_raw(obj: obj.refund)
    end
  end
end