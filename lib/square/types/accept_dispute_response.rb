# frozen_string_literal: true
require_relative "error"
require_relative "dispute"
require "ostruct"
require "json"

module square.rb
# Defines the fields in an `AcceptDispute` response.
  class AcceptDisputeResponse
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [square.rb::Dispute] Details about the accepted dispute.
    attr_reader :dispute
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param dispute [square.rb::Dispute] Details about the accepted dispute.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::AcceptDisputeResponse]
    def initialize(errors: OMIT, dispute: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @dispute = dispute if dispute != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "dispute": dispute }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AcceptDisputeResponse
    #
    # @param json_object [String] 
    # @return [square.rb::AcceptDisputeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["dispute"].nil?
        dispute = parsed_json["dispute"].to_json
        dispute = square.rb::Dispute.from_json(json_object: dispute)
      else
        dispute = nil
      end
      new(
        errors: errors,
        dispute: dispute,
        additional_properties: struct
      )
    end
# Serialize an instance of AcceptDisputeResponse to a JSON object
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
      obj.dispute.nil? || square.rb::Dispute.validate_raw(obj: obj.dispute)
    end
  end
end