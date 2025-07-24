# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class ConfirmationDecision
  # @return [Boolean] The buyer's decision to the displayed terms.
    attr_reader :has_agreed
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param has_agreed [Boolean] The buyer's decision to the displayed terms.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ConfirmationDecision]
    def initialize(has_agreed: OMIT, additional_properties: nil)
      @has_agreed = has_agreed if has_agreed != OMIT
      @additional_properties = additional_properties
      @_field_set = { "has_agreed": has_agreed }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ConfirmationDecision
    #
    # @param json_object [String] 
    # @return [square.rb::ConfirmationDecision]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      has_agreed = parsed_json["has_agreed"]
      new(has_agreed: has_agreed, additional_properties: struct)
    end
# Serialize an instance of ConfirmationDecision to a JSON object
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
      obj.has_agreed&.is_a?(Boolean) != false || raise("Passed value for field obj.has_agreed is not the expected type, validation failed.")
    end
  end
end