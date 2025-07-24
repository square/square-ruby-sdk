# frozen_string_literal: true
require_relative "search_availability_filter"
require "ostruct"
require "json"

module SquareApiClient
# The query used to search for buyer-accessible availabilities of bookings.
  class SearchAvailabilityQuery
  # @return [SquareApiClient::SearchAvailabilityFilter] The query filter to search for buyer-accessible availabilities of existing
#  bookings.
    attr_reader :filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [SquareApiClient::SearchAvailabilityFilter] The query filter to search for buyer-accessible availabilities of existing
#  bookings.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchAvailabilityQuery]
    def initialize(filter:, additional_properties: nil)
      @filter = filter
      @additional_properties = additional_properties
      @_field_set = { "filter": filter }
    end
# Deserialize a JSON object to an instance of SearchAvailabilityQuery
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchAvailabilityQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = SquareApiClient::SearchAvailabilityFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      new(filter: filter, additional_properties: struct)
    end
# Serialize an instance of SearchAvailabilityQuery to a JSON object
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
      SquareApiClient::SearchAvailabilityFilter.validate_raw(obj: obj.filter)
    end
  end
end