# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a
#  [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints) response.
  class CalculateLoyaltyPointsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Integer] The number of points that the buyer can earn from the base loyalty program.
    attr_reader :points
  # @return [Integer] The number of points that the buyer can earn from a loyalty promotion. To be
#  eligible
#  to earn promotion points, the purchase must first qualify for program points.
#  When `order_id`
#  is not provided in the request, this value is always 0.
    attr_reader :promotion_points
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param points [Integer] The number of points that the buyer can earn from the base loyalty program.
    # @param promotion_points [Integer] The number of points that the buyer can earn from a loyalty promotion. To be
#  eligible
#  to earn promotion points, the purchase must first qualify for program points.
#  When `order_id`
#  is not provided in the request, this value is always 0.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CalculateLoyaltyPointsResponse]
    def initialize(errors: OMIT, points: OMIT, promotion_points: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @points = points if points != OMIT
      @promotion_points = promotion_points if promotion_points != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "points": points, "promotion_points": promotion_points }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CalculateLoyaltyPointsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CalculateLoyaltyPointsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      points = parsed_json["points"]
      promotion_points = parsed_json["promotion_points"]
      new(
        errors: errors,
        points: points,
        promotion_points: promotion_points,
        additional_properties: struct
      )
    end
# Serialize an instance of CalculateLoyaltyPointsResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.promotion_points&.is_a?(Integer) != false || raise("Passed value for field obj.promotion_points is not the expected type, validation failed.")
    end
  end
end