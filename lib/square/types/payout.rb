# frozen_string_literal: true
require_relative "payout_status"
require_relative "money"
require_relative "destination"
require_relative "payout_type"
require_relative "payout_fee"
require "ostruct"
require "json"

module square.rb
# An accounting of the amount owed the seller and record of the actual transfer to
#  their
#  external bank account or to the Square balance.
  class Payout
  # @return [String] A unique ID for the payout.
    attr_reader :id
  # @return [square.rb::PayoutStatus] Indicates the payout status.
#  See [PayoutStatus](#type-payoutstatus) for possible values
    attr_reader :status
  # @return [String] The ID of the location associated with the payout.
    attr_reader :location_id
  # @return [String] The timestamp of when the payout was created and submitted for deposit to the
#  seller's banking destination, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp of when the payout was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [square.rb::Money] The amount of money involved in the payout. A positive amount indicates a
#  deposit, and a negative amount indicates a withdrawal. This amount is never
#  zero.
    attr_reader :amount_money
  # @return [square.rb::Destination] Information about the banking destination (such as a bank account, Square
#  checking account, or debit card)
#  against which the payout was made.
    attr_reader :destination
  # @return [Integer] The version number, which is incremented each time an update is made to this
#  payout record.
#  The version number helps developers receive event notifications or feeds out of
#  order.
    attr_reader :version
  # @return [square.rb::PayoutType] Indicates the payout type.
#  See [PayoutType](#type-payouttype) for possible values
    attr_reader :type
  # @return [Array<square.rb::PayoutFee>] A list of transfer fees and any taxes on the fees assessed by Square for this
#  payout.
    attr_reader :payout_fee
  # @return [String] The calendar date, in ISO 8601 format (YYYY-MM-DD), when the payout is due to
#  arrive in the seller’s banking destination.
    attr_reader :arrival_date
  # @return [String] A unique ID for each `Payout` object that might also appear on the seller’s bank
#  statement. You can use this ID to automate the process of reconciling each
#  payout with the corresponding line item on the bank statement.
    attr_reader :end_to_end_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID for the payout.
    # @param status [square.rb::PayoutStatus] Indicates the payout status.
#  See [PayoutStatus](#type-payoutstatus) for possible values
    # @param location_id [String] The ID of the location associated with the payout.
    # @param created_at [String] The timestamp of when the payout was created and submitted for deposit to the
#  seller's banking destination, in RFC 3339 format.
    # @param updated_at [String] The timestamp of when the payout was last updated, in RFC 3339 format.
    # @param amount_money [square.rb::Money] The amount of money involved in the payout. A positive amount indicates a
#  deposit, and a negative amount indicates a withdrawal. This amount is never
#  zero.
    # @param destination [square.rb::Destination] Information about the banking destination (such as a bank account, Square
#  checking account, or debit card)
#  against which the payout was made.
    # @param version [Integer] The version number, which is incremented each time an update is made to this
#  payout record.
#  The version number helps developers receive event notifications or feeds out of
#  order.
    # @param type [square.rb::PayoutType] Indicates the payout type.
#  See [PayoutType](#type-payouttype) for possible values
    # @param payout_fee [Array<square.rb::PayoutFee>] A list of transfer fees and any taxes on the fees assessed by Square for this
#  payout.
    # @param arrival_date [String] The calendar date, in ISO 8601 format (YYYY-MM-DD), when the payout is due to
#  arrive in the seller’s banking destination.
    # @param end_to_end_id [String] A unique ID for each `Payout` object that might also appear on the seller’s bank
#  statement. You can use this ID to automate the process of reconciling each
#  payout with the corresponding line item on the bank statement.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Payout]
    def initialize(id:, status: OMIT, location_id:, created_at: OMIT, updated_at: OMIT, amount_money: OMIT, destination: OMIT, version: OMIT, type: OMIT, payout_fee: OMIT, arrival_date: OMIT, end_to_end_id: OMIT, additional_properties: nil)
      @id = id
      @status = status if status != OMIT
      @location_id = location_id
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @destination = destination if destination != OMIT
      @version = version if version != OMIT
      @type = type if type != OMIT
      @payout_fee = payout_fee if payout_fee != OMIT
      @arrival_date = arrival_date if arrival_date != OMIT
      @end_to_end_id = end_to_end_id if end_to_end_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "status": status, "location_id": location_id, "created_at": created_at, "updated_at": updated_at, "amount_money": amount_money, "destination": destination, "version": version, "type": type, "payout_fee": payout_fee, "arrival_date": arrival_date, "end_to_end_id": end_to_end_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Payout
    #
    # @param json_object [String] 
    # @return [square.rb::Payout]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      status = parsed_json["status"]
      location_id = parsed_json["location_id"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      unless parsed_json["destination"].nil?
        destination = parsed_json["destination"].to_json
        destination = square.rb::Destination.from_json(json_object: destination)
      else
        destination = nil
      end
      version = parsed_json["version"]
      type = parsed_json["type"]
      payout_fee = parsed_json["payout_fee"]&.map do | item |
  item = item.to_json
  square.rb::PayoutFee.from_json(json_object: item)
end
      arrival_date = parsed_json["arrival_date"]
      end_to_end_id = parsed_json["end_to_end_id"]
      new(
        id: id,
        status: status,
        location_id: location_id,
        created_at: created_at,
        updated_at: updated_at,
        amount_money: amount_money,
        destination: destination,
        version: version,
        type: type,
        payout_fee: payout_fee,
        arrival_date: arrival_date,
        end_to_end_id: end_to_end_id,
        additional_properties: struct
      )
    end
# Serialize an instance of Payout to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::PayoutStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.amount_money.nil? || square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.destination.nil? || square.rb::Destination.validate_raw(obj: obj.destination)
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.type&.is_a?(square.rb::PayoutType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.payout_fee&.is_a?(Array) != false || raise("Passed value for field obj.payout_fee is not the expected type, validation failed.")
      obj.arrival_date&.is_a?(String) != false || raise("Passed value for field obj.arrival_date is not the expected type, validation failed.")
      obj.end_to_end_id&.is_a?(String) != false || raise("Passed value for field obj.end_to_end_id is not the expected type, validation failed.")
    end
  end
end