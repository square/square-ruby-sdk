# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A filter to select customers based on exact or fuzzy matching of
#  customer attributes against a specified query. Depending on the customer
#  attributes,
#  the filter can be case-sensitive. This filter can be exact or fuzzy, but it
#  cannot be both.
  class CustomerTextFilter
  # @return [String] Use the exact filter to select customers whose attributes match exactly the
#  specified query.
    attr_reader :exact
  # @return [String] Use the fuzzy filter to select customers whose attributes match the specified
#  query
#  in a fuzzy manner. When the fuzzy option is used, search queries are tokenized,
#  and then
#  each query token must be matched somewhere in the searched attribute. For single
#  token queries,
#  this is effectively the same behavior as a partial match operation.
    attr_reader :fuzzy
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param exact [String] Use the exact filter to select customers whose attributes match exactly the
#  specified query.
    # @param fuzzy [String] Use the fuzzy filter to select customers whose attributes match the specified
#  query
#  in a fuzzy manner. When the fuzzy option is used, search queries are tokenized,
#  and then
#  each query token must be matched somewhere in the searched attribute. For single
#  token queries,
#  this is effectively the same behavior as a partial match operation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerTextFilter]
    def initialize(exact: OMIT, fuzzy: OMIT, additional_properties: nil)
      @exact = exact if exact != OMIT
      @fuzzy = fuzzy if fuzzy != OMIT
      @additional_properties = additional_properties
      @_field_set = { "exact": exact, "fuzzy": fuzzy }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerTextFilter
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerTextFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      exact = parsed_json["exact"]
      fuzzy = parsed_json["fuzzy"]
      new(
        exact: exact,
        fuzzy: fuzzy,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerTextFilter to a JSON object
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
      obj.exact&.is_a?(String) != false || raise("Passed value for field obj.exact is not the expected type, validation failed.")
      obj.fuzzy&.is_a?(String) != false || raise("Passed value for field obj.fuzzy is not the expected type, validation failed.")
    end
  end
end