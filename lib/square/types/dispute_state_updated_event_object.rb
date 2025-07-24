# frozen_string_literal: true
require_relative "dispute"
require "ostruct"
require "json"

module SquareApiClient
  class DisputeStateUpdatedEventObject
  # @return [SquareApiClient::Dispute] The dispute object.
    attr_reader :object
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object [SquareApiClient::Dispute] The dispute object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DisputeStateUpdatedEventObject]
    def initialize(object: OMIT, additional_properties: nil)
      @object = object if object != OMIT
      @additional_properties = additional_properties
      @_field_set = { "object": object }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DisputeStateUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DisputeStateUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = SquareApiClient::Dispute.from_json(json_object: object)
      else
        object = nil
      end
      new(object: object, additional_properties: struct)
    end
# Serialize an instance of DisputeStateUpdatedEventObject to a JSON object
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
      obj.object.nil? || SquareApiClient::Dispute.validate_raw(obj: obj.object)
    end
  end
end