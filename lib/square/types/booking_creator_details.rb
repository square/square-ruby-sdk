# frozen_string_literal: true
require_relative "booking_creator_details_creator_type"
require "ostruct"
require "json"

module square.rb
# Information about a booking creator.
  class BookingCreatorDetails
  # @return [square.rb::BookingCreatorDetailsCreatorType] The seller-accessible type of the creator of the booking.
#  See [BookingCreatorDetailsCreatorType](#type-bookingcreatordetailscreatortype)
#  for possible values
    attr_reader :creator_type
  # @return [String] The ID of the team member who created the booking, when the booking creator is
#  of the `TEAM_MEMBER` type.
#  Access to this field requires seller-level permissions.
    attr_reader :team_member_id
  # @return [String] The ID of the customer who created the booking, when the booking creator is of
#  the `CUSTOMER` type.
#  Access to this field requires seller-level permissions.
    attr_reader :customer_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param creator_type [square.rb::BookingCreatorDetailsCreatorType] The seller-accessible type of the creator of the booking.
#  See [BookingCreatorDetailsCreatorType](#type-bookingcreatordetailscreatortype)
#  for possible values
    # @param team_member_id [String] The ID of the team member who created the booking, when the booking creator is
#  of the `TEAM_MEMBER` type.
#  Access to this field requires seller-level permissions.
    # @param customer_id [String] The ID of the customer who created the booking, when the booking creator is of
#  the `CUSTOMER` type.
#  Access to this field requires seller-level permissions.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BookingCreatorDetails]
    def initialize(creator_type: OMIT, team_member_id: OMIT, customer_id: OMIT, additional_properties: nil)
      @creator_type = creator_type if creator_type != OMIT
      @team_member_id = team_member_id if team_member_id != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "creator_type": creator_type, "team_member_id": team_member_id, "customer_id": customer_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BookingCreatorDetails
    #
    # @param json_object [String] 
    # @return [square.rb::BookingCreatorDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      creator_type = parsed_json["creator_type"]
      team_member_id = parsed_json["team_member_id"]
      customer_id = parsed_json["customer_id"]
      new(
        creator_type: creator_type,
        team_member_id: team_member_id,
        customer_id: customer_id,
        additional_properties: struct
      )
    end
# Serialize an instance of BookingCreatorDetails to a JSON object
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
      obj.creator_type&.is_a?(square.rb::BookingCreatorDetailsCreatorType) != false || raise("Passed value for field obj.creator_type is not the expected type, validation failed.")
      obj.team_member_id&.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
    end
  end
end