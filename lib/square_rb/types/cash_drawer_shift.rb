# frozen_string_literal: true
require_relative "cash_drawer_shift_state"
require_relative "money"
require_relative "cash_drawer_device"
require "ostruct"
require "json"

module SquareApiClient
# This model gives the details of a cash drawer shift.
#  The cash_payment_money, cash_refund_money, cash_paid_in_money,
#  and cash_paid_out_money fields are all computed by summing their respective
#  event types.
  class CashDrawerShift
  # @return [String] The shift unique ID.
    attr_reader :id
  # @return [SquareApiClient::CashDrawerShiftState] The shift current state.
#  See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
    attr_reader :state
  # @return [String] The time when the shift began, in ISO 8601 format.
    attr_reader :opened_at
  # @return [String] The time when the shift ended, in ISO 8601 format.
    attr_reader :ended_at
  # @return [String] The time when the shift was closed, in ISO 8601 format.
    attr_reader :closed_at
  # @return [String] The free-form text description of a cash drawer by an employee.
    attr_reader :description
  # @return [SquareApiClient::Money] The amount of money in the cash drawer at the start of the shift.
#  The amount must be greater than or equal to zero.
    attr_reader :opened_cash_money
  # @return [SquareApiClient::Money] The amount of money added to the cash drawer from cash payments.
#  This is computed by summing all events with the types CASH_TENDER_PAYMENT and
#  CASH_TENDER_CANCELED_PAYMENT. The amount is always greater than or equal to
#  zero.
    attr_reader :cash_payment_money
  # @return [SquareApiClient::Money] The amount of money removed from the cash drawer from cash refunds.
#  It is computed by summing the events of type CASH_TENDER_REFUND. The amount
#  is always greater than or equal to zero.
    attr_reader :cash_refunds_money
  # @return [SquareApiClient::Money] The amount of money added to the cash drawer for reasons other than cash
#  payments. It is computed by summing the events of type PAID_IN. The amount is
#  always greater than or equal to zero.
    attr_reader :cash_paid_in_money
  # @return [SquareApiClient::Money] The amount of money removed from the cash drawer for reasons other than
#  cash refunds. It is computed by summing the events of type PAID_OUT. The amount
#  is always greater than or equal to zero.
    attr_reader :cash_paid_out_money
  # @return [SquareApiClient::Money] The amount of money that should be in the cash drawer at the end of the
#  shift, based on the shift's other money amounts.
#  This can be negative if employees have not correctly recorded all the events
#  on the cash drawer.
#  cash_paid_out_money is a summation of amounts from cash_payment_money (zero
#  or positive), cash_refunds_money (zero or negative), cash_paid_in_money (zero
#  or positive), and cash_paid_out_money (zero or negative) event types.
    attr_reader :expected_cash_money
  # @return [SquareApiClient::Money] The amount of money found in the cash drawer at the end of the shift
#  by an auditing employee. The amount should be positive.
    attr_reader :closed_cash_money
  # @return [SquareApiClient::CashDrawerDevice] The device running Square Point of Sale that was connected to the cash drawer.
    attr_reader :device
  # @return [String] The shift start time in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The shift updated at time in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The ID of the location the cash drawer shift belongs to.
    attr_reader :location_id
  # @return [Array<String>] The IDs of all team members that were logged into Square Point of Sale at any
#  point while the cash drawer shift was open.
    attr_reader :team_member_ids
  # @return [String] The ID of the team member that started the cash drawer shift.
    attr_reader :opening_team_member_id
  # @return [String] The ID of the team member that ended the cash drawer shift.
    attr_reader :ending_team_member_id
  # @return [String] The ID of the team member that closed the cash drawer shift by auditing
#  the cash drawer contents.
    attr_reader :closing_team_member_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The shift unique ID.
    # @param state [SquareApiClient::CashDrawerShiftState] The shift current state.
#  See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
    # @param opened_at [String] The time when the shift began, in ISO 8601 format.
    # @param ended_at [String] The time when the shift ended, in ISO 8601 format.
    # @param closed_at [String] The time when the shift was closed, in ISO 8601 format.
    # @param description [String] The free-form text description of a cash drawer by an employee.
    # @param opened_cash_money [SquareApiClient::Money] The amount of money in the cash drawer at the start of the shift.
#  The amount must be greater than or equal to zero.
    # @param cash_payment_money [SquareApiClient::Money] The amount of money added to the cash drawer from cash payments.
#  This is computed by summing all events with the types CASH_TENDER_PAYMENT and
#  CASH_TENDER_CANCELED_PAYMENT. The amount is always greater than or equal to
#  zero.
    # @param cash_refunds_money [SquareApiClient::Money] The amount of money removed from the cash drawer from cash refunds.
#  It is computed by summing the events of type CASH_TENDER_REFUND. The amount
#  is always greater than or equal to zero.
    # @param cash_paid_in_money [SquareApiClient::Money] The amount of money added to the cash drawer for reasons other than cash
#  payments. It is computed by summing the events of type PAID_IN. The amount is
#  always greater than or equal to zero.
    # @param cash_paid_out_money [SquareApiClient::Money] The amount of money removed from the cash drawer for reasons other than
#  cash refunds. It is computed by summing the events of type PAID_OUT. The amount
#  is always greater than or equal to zero.
    # @param expected_cash_money [SquareApiClient::Money] The amount of money that should be in the cash drawer at the end of the
#  shift, based on the shift's other money amounts.
#  This can be negative if employees have not correctly recorded all the events
#  on the cash drawer.
#  cash_paid_out_money is a summation of amounts from cash_payment_money (zero
#  or positive), cash_refunds_money (zero or negative), cash_paid_in_money (zero
#  or positive), and cash_paid_out_money (zero or negative) event types.
    # @param closed_cash_money [SquareApiClient::Money] The amount of money found in the cash drawer at the end of the shift
#  by an auditing employee. The amount should be positive.
    # @param device [SquareApiClient::CashDrawerDevice] The device running Square Point of Sale that was connected to the cash drawer.
    # @param created_at [String] The shift start time in RFC 3339 format.
    # @param updated_at [String] The shift updated at time in RFC 3339 format.
    # @param location_id [String] The ID of the location the cash drawer shift belongs to.
    # @param team_member_ids [Array<String>] The IDs of all team members that were logged into Square Point of Sale at any
#  point while the cash drawer shift was open.
    # @param opening_team_member_id [String] The ID of the team member that started the cash drawer shift.
    # @param ending_team_member_id [String] The ID of the team member that ended the cash drawer shift.
    # @param closing_team_member_id [String] The ID of the team member that closed the cash drawer shift by auditing
#  the cash drawer contents.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CashDrawerShift]
    def initialize(id: OMIT, state: OMIT, opened_at: OMIT, ended_at: OMIT, closed_at: OMIT, description: OMIT, opened_cash_money: OMIT, cash_payment_money: OMIT, cash_refunds_money: OMIT, cash_paid_in_money: OMIT, cash_paid_out_money: OMIT, expected_cash_money: OMIT, closed_cash_money: OMIT, device: OMIT, created_at: OMIT, updated_at: OMIT, location_id: OMIT, team_member_ids: OMIT, opening_team_member_id: OMIT, ending_team_member_id: OMIT, closing_team_member_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @state = state if state != OMIT
      @opened_at = opened_at if opened_at != OMIT
      @ended_at = ended_at if ended_at != OMIT
      @closed_at = closed_at if closed_at != OMIT
      @description = description if description != OMIT
      @opened_cash_money = opened_cash_money if opened_cash_money != OMIT
      @cash_payment_money = cash_payment_money if cash_payment_money != OMIT
      @cash_refunds_money = cash_refunds_money if cash_refunds_money != OMIT
      @cash_paid_in_money = cash_paid_in_money if cash_paid_in_money != OMIT
      @cash_paid_out_money = cash_paid_out_money if cash_paid_out_money != OMIT
      @expected_cash_money = expected_cash_money if expected_cash_money != OMIT
      @closed_cash_money = closed_cash_money if closed_cash_money != OMIT
      @device = device if device != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @location_id = location_id if location_id != OMIT
      @team_member_ids = team_member_ids if team_member_ids != OMIT
      @opening_team_member_id = opening_team_member_id if opening_team_member_id != OMIT
      @ending_team_member_id = ending_team_member_id if ending_team_member_id != OMIT
      @closing_team_member_id = closing_team_member_id if closing_team_member_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "state": state, "opened_at": opened_at, "ended_at": ended_at, "closed_at": closed_at, "description": description, "opened_cash_money": opened_cash_money, "cash_payment_money": cash_payment_money, "cash_refunds_money": cash_refunds_money, "cash_paid_in_money": cash_paid_in_money, "cash_paid_out_money": cash_paid_out_money, "expected_cash_money": expected_cash_money, "closed_cash_money": closed_cash_money, "device": device, "created_at": created_at, "updated_at": updated_at, "location_id": location_id, "team_member_ids": team_member_ids, "opening_team_member_id": opening_team_member_id, "ending_team_member_id": ending_team_member_id, "closing_team_member_id": closing_team_member_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CashDrawerShift
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CashDrawerShift]
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
        opened_cash_money = SquareApiClient::Money.from_json(json_object: opened_cash_money)
      else
        opened_cash_money = nil
      end
      unless parsed_json["cash_payment_money"].nil?
        cash_payment_money = parsed_json["cash_payment_money"].to_json
        cash_payment_money = SquareApiClient::Money.from_json(json_object: cash_payment_money)
      else
        cash_payment_money = nil
      end
      unless parsed_json["cash_refunds_money"].nil?
        cash_refunds_money = parsed_json["cash_refunds_money"].to_json
        cash_refunds_money = SquareApiClient::Money.from_json(json_object: cash_refunds_money)
      else
        cash_refunds_money = nil
      end
      unless parsed_json["cash_paid_in_money"].nil?
        cash_paid_in_money = parsed_json["cash_paid_in_money"].to_json
        cash_paid_in_money = SquareApiClient::Money.from_json(json_object: cash_paid_in_money)
      else
        cash_paid_in_money = nil
      end
      unless parsed_json["cash_paid_out_money"].nil?
        cash_paid_out_money = parsed_json["cash_paid_out_money"].to_json
        cash_paid_out_money = SquareApiClient::Money.from_json(json_object: cash_paid_out_money)
      else
        cash_paid_out_money = nil
      end
      unless parsed_json["expected_cash_money"].nil?
        expected_cash_money = parsed_json["expected_cash_money"].to_json
        expected_cash_money = SquareApiClient::Money.from_json(json_object: expected_cash_money)
      else
        expected_cash_money = nil
      end
      unless parsed_json["closed_cash_money"].nil?
        closed_cash_money = parsed_json["closed_cash_money"].to_json
        closed_cash_money = SquareApiClient::Money.from_json(json_object: closed_cash_money)
      else
        closed_cash_money = nil
      end
      unless parsed_json["device"].nil?
        device = parsed_json["device"].to_json
        device = SquareApiClient::CashDrawerDevice.from_json(json_object: device)
      else
        device = nil
      end
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      location_id = parsed_json["location_id"]
      team_member_ids = parsed_json["team_member_ids"]
      opening_team_member_id = parsed_json["opening_team_member_id"]
      ending_team_member_id = parsed_json["ending_team_member_id"]
      closing_team_member_id = parsed_json["closing_team_member_id"]
      new(
        id: id,
        state: state,
        opened_at: opened_at,
        ended_at: ended_at,
        closed_at: closed_at,
        description: description,
        opened_cash_money: opened_cash_money,
        cash_payment_money: cash_payment_money,
        cash_refunds_money: cash_refunds_money,
        cash_paid_in_money: cash_paid_in_money,
        cash_paid_out_money: cash_paid_out_money,
        expected_cash_money: expected_cash_money,
        closed_cash_money: closed_cash_money,
        device: device,
        created_at: created_at,
        updated_at: updated_at,
        location_id: location_id,
        team_member_ids: team_member_ids,
        opening_team_member_id: opening_team_member_id,
        ending_team_member_id: ending_team_member_id,
        closing_team_member_id: closing_team_member_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CashDrawerShift to a JSON object
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
      obj.state&.is_a?(SquareApiClient::CashDrawerShiftState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.opened_at&.is_a?(String) != false || raise("Passed value for field obj.opened_at is not the expected type, validation failed.")
      obj.ended_at&.is_a?(String) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
      obj.closed_at&.is_a?(String) != false || raise("Passed value for field obj.closed_at is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.opened_cash_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.opened_cash_money)
      obj.cash_payment_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.cash_payment_money)
      obj.cash_refunds_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.cash_refunds_money)
      obj.cash_paid_in_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.cash_paid_in_money)
      obj.cash_paid_out_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.cash_paid_out_money)
      obj.expected_cash_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.expected_cash_money)
      obj.closed_cash_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.closed_cash_money)
      obj.device.nil? || SquareApiClient::CashDrawerDevice.validate_raw(obj: obj.device)
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.team_member_ids&.is_a?(Array) != false || raise("Passed value for field obj.team_member_ids is not the expected type, validation failed.")
      obj.opening_team_member_id&.is_a?(String) != false || raise("Passed value for field obj.opening_team_member_id is not the expected type, validation failed.")
      obj.ending_team_member_id&.is_a?(String) != false || raise("Passed value for field obj.ending_team_member_id is not the expected type, validation failed.")
      obj.closing_team_member_id&.is_a?(String) != false || raise("Passed value for field obj.closing_team_member_id is not the expected type, validation failed.")
    end
  end
end