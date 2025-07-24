# frozen_string_literal: true
require_relative "cash_drawer_shift_state"
require_relative "money"
require "ostruct"
require "json"

module square.rb
# The summary of a closed cash drawer shift.
#  This model contains only the money counted to start a cash drawer shift, counted
#  at the end of the shift, and the amount that should be in the drawer at shift
#  end based on summing all cash drawer shift events.
  class CashDrawerShiftSummary
  # @return [String] The shift unique ID.
    attr_reader :id
  # @return [square.rb::CashDrawerShiftState] The shift current state.
#  See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
    attr_reader :state
  # @return [String] The shift start time in ISO 8601 format.
    attr_reader :opened_at
  # @return [String] The shift end time in ISO 8601 format.
    attr_reader :ended_at
  # @return [String] The shift close time in ISO 8601 format.
    attr_reader :closed_at
  # @return [String] An employee free-text description of a cash drawer shift.
    attr_reader :description
  # @return [square.rb::Money] The amount of money in the cash drawer at the start of the shift. This
#  must be a positive amount.
    attr_reader :opened_cash_money
  # @return [square.rb::Money] The amount of money that should be in the cash drawer at the end of the
#  shift, based on the cash drawer events on the shift.
#  The amount is correct if all shift employees accurately recorded their
#  cash drawer shift events. Unrecorded events and events with the wrong amount
#  result in an incorrect expected_cash_money amount that can be negative.
    attr_reader :expected_cash_money
  # @return [square.rb::Money] The amount of money found in the cash drawer at the end of the shift by
#  an auditing employee. The amount must be greater than or equal to zero.
    attr_reader :closed_cash_money
  # @return [String] The shift start time in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The shift updated at time in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The ID of the location the cash drawer shift belongs to.
    attr_reader :location_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The shift unique ID.
    # @param state [square.rb::CashDrawerShiftState] The shift current state.
#  See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
    # @param opened_at [String] The shift start time in ISO 8601 format.
    # @param ended_at [String] The shift end time in ISO 8601 format.
    # @param closed_at [String] The shift close time in ISO 8601 format.
    # @param description [String] An employee free-text description of a cash drawer shift.
    # @param opened_cash_money [square.rb::Money] The amount of money in the cash drawer at the start of the shift. This
#  must be a positive amount.
    # @param expected_cash_money [square.rb::Money] The amount of money that should be in the cash drawer at the end of the
#  shift, based on the cash drawer events on the shift.
#  The amount is correct if all shift employees accurately recorded their
#  cash drawer shift events. Unrecorded events and events with the wrong amount
#  result in an incorrect expected_cash_money amount that can be negative.
    # @param closed_cash_money [square.rb::Money] The amount of money found in the cash drawer at the end of the shift by
#  an auditing employee. The amount must be greater than or equal to zero.
    # @param created_at [String] The shift start time in RFC 3339 format.
    # @param updated_at [String] The shift updated at time in RFC 3339 format.
    # @param location_id [String] The ID of the location the cash drawer shift belongs to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CashDrawerShiftSummary]
    def initialize(id: OMIT, state: OMIT, opened_at: OMIT, ended_at: OMIT, closed_at: OMIT, description: OMIT, opened_cash_money: OMIT, expected_cash_money: OMIT, closed_cash_money: OMIT, created_at: OMIT, updated_at: OMIT, location_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @state = state if state != OMIT
      @opened_at = opened_at if opened_at != OMIT
      @ended_at = ended_at if ended_at != OMIT
      @closed_at = closed_at if closed_at != OMIT
      @description = description if description != OMIT
      @opened_cash_money = opened_cash_money if opened_cash_money != OMIT
      @expected_cash_money = expected_cash_money if expected_cash_money != OMIT
      @closed_cash_money = closed_cash_money if closed_cash_money != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @location_id = location_id if location_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "state": state, "opened_at": opened_at, "ended_at": ended_at, "closed_at": closed_at, "description": description, "opened_cash_money": opened_cash_money, "expected_cash_money": expected_cash_money, "closed_cash_money": closed_cash_money, "created_at": created_at, "updated_at": updated_at, "location_id": location_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CashDrawerShiftSummary
    #
    # @param json_object [String] 
    # @return [square.rb::CashDrawerShiftSummary]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      state = parsed_json["state"]
      opened_at = parsed_json["opened_at"]
      ended_at = parsed_json["ended_at"]
      closed_at = parsed_json["closed_at"]
      description = parsed_json["description"]
      unless parsed_json["opened_cash_money"].nil?
        opened_cash_money = parsed_json["opened_cash_money"].to_json
        opened_cash_money = square.rb::Money.from_json(json_object: opened_cash_money)
      else
        opened_cash_money = nil
      end
      unless parsed_json["expected_cash_money"].nil?
        expected_cash_money = parsed_json["expected_cash_money"].to_json
        expected_cash_money = square.rb::Money.from_json(json_object: expected_cash_money)
      else
        expected_cash_money = nil
      end
      unless parsed_json["closed_cash_money"].nil?
        closed_cash_money = parsed_json["closed_cash_money"].to_json
        closed_cash_money = square.rb::Money.from_json(json_object: closed_cash_money)
      else
        closed_cash_money = nil
      end
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      location_id = parsed_json["location_id"]
      new(
        id: id,
        state: state,
        opened_at: opened_at,
        ended_at: ended_at,
        closed_at: closed_at,
        description: description,
        opened_cash_money: opened_cash_money,
        expected_cash_money: expected_cash_money,
        closed_cash_money: closed_cash_money,
        created_at: created_at,
        updated_at: updated_at,
        location_id: location_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CashDrawerShiftSummary to a JSON object
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
      obj.state&.is_a?(square.rb::CashDrawerShiftState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.opened_at&.is_a?(String) != false || raise("Passed value for field obj.opened_at is not the expected type, validation failed.")
      obj.ended_at&.is_a?(String) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
      obj.closed_at&.is_a?(String) != false || raise("Passed value for field obj.closed_at is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.opened_cash_money.nil? || square.rb::Money.validate_raw(obj: obj.opened_cash_money)
      obj.expected_cash_money.nil? || square.rb::Money.validate_raw(obj: obj.expected_cash_money)
      obj.closed_cash_money.nil? || square.rb::Money.validate_raw(obj: obj.closed_cash_money)
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end