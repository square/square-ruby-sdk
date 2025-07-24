# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents a set of points for a loyalty account that are scheduled to expire on
#  a specific date.
  class LoyaltyAccountExpiringPointDeadline
  # @return [Integer] The number of points scheduled to expire at the `expires_at` timestamp.
    attr_reader :points
  # @return [String] The timestamp of when the points are scheduled to expire, in RFC 3339 format.
    attr_reader :expires_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param points [Integer] The number of points scheduled to expire at the `expires_at` timestamp.
    # @param expires_at [String] The timestamp of when the points are scheduled to expire, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyAccountExpiringPointDeadline]
    def initialize(points:, expires_at:, additional_properties: nil)
      @points = points
      @expires_at = expires_at
      @additional_properties = additional_properties
      @_field_set = { "points": points, "expires_at": expires_at }
    end
# Deserialize a JSON object to an instance of LoyaltyAccountExpiringPointDeadline
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyAccountExpiringPointDeadline]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      points = parsed_json["points"]
      expires_at = parsed_json["expires_at"]
      new(
        points: points,
        expires_at: expires_at,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyAccountExpiringPointDeadline to a JSON object
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
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.expires_at.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
    end
  end
end