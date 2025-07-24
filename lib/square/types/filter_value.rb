# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A filter to select resources based on an exact field value. For any given
#  value, the value can only be in one property. Depending on the field, either
#  all properties can be set or only a subset will be available.
#  Refer to the documentation of the field.
  class FilterValue
  # @return [Array<String>] A list of terms that must be present on the field of the resource.
    attr_reader :all
  # @return [Array<String>] A list of terms where at least one of them must be present on the
#  field of the resource.
    attr_reader :any
  # @return [Array<String>] A list of terms that must not be present on the field the resource
    attr_reader :none
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param all [Array<String>] A list of terms that must be present on the field of the resource.
    # @param any [Array<String>] A list of terms where at least one of them must be present on the
#  field of the resource.
    # @param none [Array<String>] A list of terms that must not be present on the field the resource
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::FilterValue]
    def initialize(all: OMIT, any: OMIT, none: OMIT, additional_properties: nil)
      @all = all if all != OMIT
      @any = any if any != OMIT
      @none = none if none != OMIT
      @additional_properties = additional_properties
      @_field_set = { "all": all, "any": any, "none": none }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FilterValue
    #
    # @param json_object [String] 
    # @return [square.rb::FilterValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      all = parsed_json["all"]
      any = parsed_json["any"]
      none = parsed_json["none"]
      new(
        all: all,
        any: any,
        none: none,
        additional_properties: struct
      )
    end
# Serialize an instance of FilterValue to a JSON object
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
      obj.all&.is_a?(Array) != false || raise("Passed value for field obj.all is not the expected type, validation failed.")
      obj.any&.is_a?(Array) != false || raise("Passed value for field obj.any is not the expected type, validation failed.")
      obj.none&.is_a?(Array) != false || raise("Passed value for field obj.none is not the expected type, validation failed.")
    end
  end
end