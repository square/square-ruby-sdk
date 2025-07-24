# frozen_string_literal: true
require_relative "terminal_checkout_query_filter"
require_relative "terminal_checkout_query_sort"
require "ostruct"
require "json"

module SquareApiClient
  class TerminalCheckoutQuery
  # @return [SquareApiClient::TerminalCheckoutQueryFilter] Options for filtering returned `TerminalCheckout` objects.
    attr_reader :filter
  # @return [SquareApiClient::TerminalCheckoutQuerySort] Option for sorting returned `TerminalCheckout` objects.
    attr_reader :sort
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [SquareApiClient::TerminalCheckoutQueryFilter] Options for filtering returned `TerminalCheckout` objects.
    # @param sort [SquareApiClient::TerminalCheckoutQuerySort] Option for sorting returned `TerminalCheckout` objects.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TerminalCheckoutQuery]
    def initialize(filter: OMIT, sort: OMIT, additional_properties: nil)
      @filter = filter if filter != OMIT
      @sort = sort if sort != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter, "sort": sort }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalCheckoutQuery
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TerminalCheckoutQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = SquareApiClient::TerminalCheckoutQueryFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      unless parsed_json["sort"].nil?
        sort = parsed_json["sort"].to_json
        sort = SquareApiClient::TerminalCheckoutQuerySort.from_json(json_object: sort)
      else
        sort = nil
      end
      new(
        filter: filter,
        sort: sort,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalCheckoutQuery to a JSON object
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
      obj.filter.nil? || SquareApiClient::TerminalCheckoutQueryFilter.validate_raw(obj: obj.filter)
      obj.sort.nil? || SquareApiClient::TerminalCheckoutQuerySort.validate_raw(obj: obj.sort)
    end
  end
end