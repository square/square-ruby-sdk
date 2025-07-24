# frozen_string_literal: true
require_relative "search_subscriptions_filter"
require "ostruct"
require "json"

module square.rb
# Represents a query, consisting of specified query expressions, used to search
#  for subscriptions.
  class SearchSubscriptionsQuery
  # @return [square.rb::SearchSubscriptionsFilter] A list of query expressions.
    attr_reader :filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [square.rb::SearchSubscriptionsFilter] A list of query expressions.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchSubscriptionsQuery]
    def initialize(filter: OMIT, additional_properties: nil)
      @filter = filter if filter != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchSubscriptionsQuery
    #
    # @param json_object [String] 
    # @return [square.rb::SearchSubscriptionsQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = square.rb::SearchSubscriptionsFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      new(filter: filter, additional_properties: struct)
    end
# Serialize an instance of SearchSubscriptionsQuery to a JSON object
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
      obj.filter.nil? || square.rb::SearchSubscriptionsFilter.validate_raw(obj: obj.filter)
    end
  end
end