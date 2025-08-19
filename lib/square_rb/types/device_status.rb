# frozen_string_literal: true
require_relative "device_status_category"
require "ostruct"
require "json"

module SquareApiClient
  class DeviceStatus
  # @return [SquareApiClient::DeviceStatusCategory] 
#  See [Category](#type-category) for possible values
    attr_reader :category
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param category [SquareApiClient::DeviceStatusCategory] 
#  See [Category](#type-category) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceStatus]
    def initialize(category: OMIT, additional_properties: nil)
      @category = category if category != OMIT
      @additional_properties = additional_properties
      @_field_set = { "category": category }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceStatus
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceStatus]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      category = parsed_json["category"]
      new(category: category, additional_properties: struct)
    end
# Serialize an instance of DeviceStatus to a JSON object
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
      obj.category&.is_a?(SquareApiClient::DeviceStatusCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
    end
  end
end