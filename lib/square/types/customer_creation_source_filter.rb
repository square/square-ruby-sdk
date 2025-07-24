# frozen_string_literal: true
require_relative "customer_creation_source"
require_relative "customer_inclusion_exclusion"
require "ostruct"
require "json"

module square.rb
# The creation source filter.
#  If one or more creation sources are set, customer profiles are included in,
#  or excluded from, the result if they match at least one of the filter criteria.
  class CustomerCreationSourceFilter
  # @return [Array<square.rb::CustomerCreationSource>] The list of creation sources used as filtering criteria.
#  See [CustomerCreationSource](#type-customercreationsource) for possible values
    attr_reader :values
  # @return [square.rb::CustomerInclusionExclusion] Indicates whether a customer profile matching the filter criteria
#  should be included in the result or excluded from the result.
#  Default: `INCLUDE`.
#  See [CustomerInclusionExclusion](#type-customerinclusionexclusion) for possible
#  values
    attr_reader :rule
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param values [Array<square.rb::CustomerCreationSource>] The list of creation sources used as filtering criteria.
#  See [CustomerCreationSource](#type-customercreationsource) for possible values
    # @param rule [square.rb::CustomerInclusionExclusion] Indicates whether a customer profile matching the filter criteria
#  should be included in the result or excluded from the result.
#  Default: `INCLUDE`.
#  See [CustomerInclusionExclusion](#type-customerinclusionexclusion) for possible
#  values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerCreationSourceFilter]
    def initialize(values: OMIT, rule: OMIT, additional_properties: nil)
      @values = values if values != OMIT
      @rule = rule if rule != OMIT
      @additional_properties = additional_properties
      @_field_set = { "values": values, "rule": rule }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerCreationSourceFilter
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerCreationSourceFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      values = parsed_json["values"]
      rule = parsed_json["rule"]
      new(
        values: values,
        rule: rule,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerCreationSourceFilter to a JSON object
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
      obj.values&.is_a?(Array) != false || raise("Passed value for field obj.values is not the expected type, validation failed.")
      obj.rule&.is_a?(square.rb::CustomerInclusionExclusion) != false || raise("Passed value for field obj.rule is not the expected type, validation failed.")
    end
  end
end