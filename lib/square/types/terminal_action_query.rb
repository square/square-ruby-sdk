# frozen_string_literal: true
require_relative "terminal_action_query_filter"
require_relative "terminal_action_query_sort"
require "ostruct"
require "json"

module square.rb
  class TerminalActionQuery
  # @return [square.rb::TerminalActionQueryFilter] Options for filtering returned `TerminalAction`s
    attr_reader :filter
  # @return [square.rb::TerminalActionQuerySort] Option for sorting returned `TerminalAction` objects.
    attr_reader :sort
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [square.rb::TerminalActionQueryFilter] Options for filtering returned `TerminalAction`s
    # @param sort [square.rb::TerminalActionQuerySort] Option for sorting returned `TerminalAction` objects.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TerminalActionQuery]
    def initialize(filter: OMIT, sort: OMIT, additional_properties: nil)
      @filter = filter if filter != OMIT
      @sort = sort if sort != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter, "sort": sort }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalActionQuery
    #
    # @param json_object [String] 
    # @return [square.rb::TerminalActionQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = square.rb::TerminalActionQueryFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      unless parsed_json["sort"].nil?
        sort = parsed_json["sort"].to_json
        sort = square.rb::TerminalActionQuerySort.from_json(json_object: sort)
      else
        sort = nil
      end
      new(
        filter: filter,
        sort: sort,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalActionQuery to a JSON object
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
      obj.filter.nil? || square.rb::TerminalActionQueryFilter.validate_raw(obj: obj.filter)
      obj.sort.nil? || square.rb::TerminalActionQuerySort.validate_raw(obj: obj.sort)
    end
  end
end