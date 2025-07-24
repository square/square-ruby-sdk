# frozen_string_literal: true
require_relative "sort_order"
require "ostruct"
require "json"

module square.rb
  class TerminalCheckoutQuerySort
  # @return [square.rb::SortOrder] The order in which results are listed.
#  Default: `DESC`
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :sort_order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param sort_order [square.rb::SortOrder] The order in which results are listed.
#  Default: `DESC`
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TerminalCheckoutQuerySort]
    def initialize(sort_order: OMIT, additional_properties: nil)
      @sort_order = sort_order if sort_order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "sort_order": sort_order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalCheckoutQuerySort
    #
    # @param json_object [String] 
    # @return [square.rb::TerminalCheckoutQuerySort]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      sort_order = parsed_json["sort_order"]
      new(sort_order: sort_order, additional_properties: struct)
    end
# Serialize an instance of TerminalCheckoutQuerySort to a JSON object
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
      obj.sort_order&.is_a?(square.rb::SortOrder) != false || raise("Passed value for field obj.sort_order is not the expected type, validation failed.")
    end
  end
end