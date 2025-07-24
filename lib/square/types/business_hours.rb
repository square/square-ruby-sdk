# frozen_string_literal: true
require_relative "business_hours_period"
require "ostruct"
require "json"

module square.rb
# The hours of operation for a location.
  class BusinessHours
  # @return [Array<square.rb::BusinessHoursPeriod>] The list of time periods during which the business is open. There can be at most
#  10 periods per day.
    attr_reader :periods
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param periods [Array<square.rb::BusinessHoursPeriod>] The list of time periods during which the business is open. There can be at most
#  10 periods per day.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BusinessHours]
    def initialize(periods: OMIT, additional_properties: nil)
      @periods = periods if periods != OMIT
      @additional_properties = additional_properties
      @_field_set = { "periods": periods }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BusinessHours
    #
    # @param json_object [String] 
    # @return [square.rb::BusinessHours]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      periods = parsed_json["periods"]&.map do | item |
  item = item.to_json
  square.rb::BusinessHoursPeriod.from_json(json_object: item)
end
      new(periods: periods, additional_properties: struct)
    end
# Serialize an instance of BusinessHours to a JSON object
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
      obj.periods&.is_a?(Array) != false || raise("Passed value for field obj.periods is not the expected type, validation failed.")
    end
  end
end