# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Describes when the loyalty program expires.
  class LoyaltyProgramExpirationPolicy
  # @return [String] The number of months before points expire, in `P[n]M` RFC 3339 duration format.
#  For example, a value of `P12M` represents a duration of 12 months.
#  Points are valid through the last day of the month in which they are scheduled
#  to expire. For example, with a  `P12M` duration, points earned on July 6, 2020
#  expire on August 1, 2021.
    attr_reader :expiration_duration
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param expiration_duration [String] The number of months before points expire, in `P[n]M` RFC 3339 duration format.
#  For example, a value of `P12M` represents a duration of 12 months.
#  Points are valid through the last day of the month in which they are scheduled
#  to expire. For example, with a  `P12M` duration, points earned on July 6, 2020
#  expire on August 1, 2021.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyProgramExpirationPolicy]
    def initialize(expiration_duration:, additional_properties: nil)
      @expiration_duration = expiration_duration
      @additional_properties = additional_properties
      @_field_set = { "expiration_duration": expiration_duration }
    end
# Deserialize a JSON object to an instance of LoyaltyProgramExpirationPolicy
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyProgramExpirationPolicy]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      expiration_duration = parsed_json["expiration_duration"]
      new(expiration_duration: expiration_duration, additional_properties: struct)
    end
# Serialize an instance of LoyaltyProgramExpirationPolicy to a JSON object
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
      obj.expiration_duration.is_a?(String) != false || raise("Passed value for field obj.expiration_duration is not the expected type, validation failed.")
    end
  end
end