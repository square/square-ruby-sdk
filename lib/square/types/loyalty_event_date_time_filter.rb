# frozen_string_literal: true
require_relative "time_range"
require "ostruct"
require "json"

module SquareApiClient
# Filter events by date time range.
  class LoyaltyEventDateTimeFilter
  # @return [SquareApiClient::TimeRange] The `created_at` date time range used to filter the result.
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created_at [SquareApiClient::TimeRange] The `created_at` date time range used to filter the result.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyEventDateTimeFilter]
    def initialize(created_at:, additional_properties: nil)
      @created_at = created_at
      @additional_properties = additional_properties
      @_field_set = { "created_at": created_at }
    end
# Deserialize a JSON object to an instance of LoyaltyEventDateTimeFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyEventDateTimeFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["created_at"].nil?
        created_at = parsed_json["created_at"].to_json
        created_at = SquareApiClient::TimeRange.from_json(json_object: created_at)
      else
        created_at = nil
      end
      new(created_at: created_at, additional_properties: struct)
    end
# Serialize an instance of LoyaltyEventDateTimeFilter to a JSON object
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
      SquareApiClient::TimeRange.validate_raw(obj: obj.created_at)
    end
  end
end