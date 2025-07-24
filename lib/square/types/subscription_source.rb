# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The origination details of the subscription.
  class SubscriptionSource
  # @return [String] The name used to identify the place (physical or digital) that
#  a subscription originates. If unset, the name defaults to the name
#  of the application that created the subscription.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name used to identify the place (physical or digital) that
#  a subscription originates. If unset, the name defaults to the name
#  of the application that created the subscription.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SubscriptionSource]
    def initialize(name: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionSource
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SubscriptionSource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      new(name: name, additional_properties: struct)
    end
# Serialize an instance of SubscriptionSource to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end