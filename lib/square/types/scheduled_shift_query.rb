# frozen_string_literal: true
require_relative "scheduled_shift_filter"
require_relative "scheduled_shift_sort"
require "ostruct"
require "json"

module square.rb
# Represents filter and sort criteria for the `query` field in a
#  [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts) request.
  class ScheduledShiftQuery
  # @return [square.rb::ScheduledShiftFilter] Filtering options for the query.
    attr_reader :filter
  # @return [square.rb::ScheduledShiftSort] Sorting options for the query.
    attr_reader :sort
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [square.rb::ScheduledShiftFilter] Filtering options for the query.
    # @param sort [square.rb::ScheduledShiftSort] Sorting options for the query.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ScheduledShiftQuery]
    def initialize(filter: OMIT, sort: OMIT, additional_properties: nil)
      @filter = filter if filter != OMIT
      @sort = sort if sort != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter, "sort": sort }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScheduledShiftQuery
    #
    # @param json_object [String] 
    # @return [square.rb::ScheduledShiftQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = square.rb::ScheduledShiftFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      unless parsed_json["sort"].nil?
        sort = parsed_json["sort"].to_json
        sort = square.rb::ScheduledShiftSort.from_json(json_object: sort)
      else
        sort = nil
      end
      new(
        filter: filter,
        sort: sort,
        additional_properties: struct
      )
    end
# Serialize an instance of ScheduledShiftQuery to a JSON object
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
      obj.filter.nil? || square.rb::ScheduledShiftFilter.validate_raw(obj: obj.filter)
      obj.sort.nil? || square.rb::ScheduledShiftSort.validate_raw(obj: obj.sort)
    end
  end
end