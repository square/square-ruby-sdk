# frozen_string_literal: true
require_relative "cash_drawer_event_type"
require_relative "money"
require "ostruct"
require "json"

module square.rb
  class CashDrawerShiftEvent
  # @return [String] The unique ID of the event.
    attr_reader :id
  # @return [square.rb::CashDrawerEventType] The type of cash drawer shift event.
#  See [CashDrawerEventType](#type-cashdrawereventtype) for possible values
    attr_reader :event_type
  # @return [square.rb::Money] The amount of money that was added to or removed from the cash drawer
#  in the event. The amount can be positive (for added money)
#  or zero (for other tender type payments). The addition or removal of money can
#  be determined by
#  by the event type.
    attr_reader :event_money
  # @return [String] The event time in RFC 3339 format.
    attr_reader :created_at
  # @return [String] An optional description of the event, entered by the employee that
#  created the event.
    attr_reader :description
  # @return [String] The ID of the team member that created the event.
    attr_reader :team_member_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID of the event.
    # @param event_type [square.rb::CashDrawerEventType] The type of cash drawer shift event.
#  See [CashDrawerEventType](#type-cashdrawereventtype) for possible values
    # @param event_money [square.rb::Money] The amount of money that was added to or removed from the cash drawer
#  in the event. The amount can be positive (for added money)
#  or zero (for other tender type payments). The addition or removal of money can
#  be determined by
#  by the event type.
    # @param created_at [String] The event time in RFC 3339 format.
    # @param description [String] An optional description of the event, entered by the employee that
#  created the event.
    # @param team_member_id [String] The ID of the team member that created the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CashDrawerShiftEvent]
    def initialize(id: OMIT, event_type: OMIT, event_money: OMIT, created_at: OMIT, description: OMIT, team_member_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @event_type = event_type if event_type != OMIT
      @event_money = event_money if event_money != OMIT
      @created_at = created_at if created_at != OMIT
      @description = description if description != OMIT
      @team_member_id = team_member_id if team_member_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "event_type": event_type, "event_money": event_money, "created_at": created_at, "description": description, "team_member_id": team_member_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CashDrawerShiftEvent
    #
    # @param json_object [String] 
    # @return [square.rb::CashDrawerShiftEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      event_type = parsed_json["event_type"]
      unless parsed_json["event_money"].nil?
        event_money = parsed_json["event_money"].to_json
        event_money = square.rb::Money.from_json(json_object: event_money)
      else
        event_money = nil
      end
      created_at = parsed_json["created_at"]
      description = parsed_json["description"]
      team_member_id = parsed_json["team_member_id"]
      new(
        id: id,
        event_type: event_type,
        event_money: event_money,
        created_at: created_at,
        description: description,
        team_member_id: team_member_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CashDrawerShiftEvent to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.event_type&.is_a?(square.rb::CashDrawerEventType) != false || raise("Passed value for field obj.event_type is not the expected type, validation failed.")
      obj.event_money.nil? || square.rb::Money.validate_raw(obj: obj.event_money)
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.team_member_id&.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
    end
  end
end