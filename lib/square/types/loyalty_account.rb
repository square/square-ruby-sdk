# frozen_string_literal: true
require_relative "loyalty_account_mapping"
require_relative "loyalty_account_expiring_point_deadline"
require "ostruct"
require "json"

module SquareApiClient
# Describes a loyalty account in a [loyalty program](entity:LoyaltyProgram). For
#  more information, see
#  [Create and Retrieve Loyalty
#  Accounts](https://developer.squareup.com/docs/loyalty-api/loyalty-accounts).
  class LoyaltyAccount
  # @return [String] The Square-assigned ID of the loyalty account.
    attr_reader :id
  # @return [String] The Square-assigned ID of the [loyalty program](entity:LoyaltyProgram) to which
#  the account belongs.
    attr_reader :program_id
  # @return [Integer] The available point balance in the loyalty account. If points are scheduled to
#  expire, they are listed in the `expiring_point_deadlines` field.
#  Your application should be able to handle loyalty accounts that have a negative
#  point balance (`balance` is less than 0). This might occur if a seller makes a
#  manual adjustment or as a result of a refund or exchange.
    attr_reader :balance
  # @return [Integer] The total points accrued during the lifetime of the account.
    attr_reader :lifetime_points
  # @return [String] The Square-assigned ID of the [customer](entity:Customer) that is associated
#  with the account.
    attr_reader :customer_id
  # @return [String] The timestamp when the buyer joined the loyalty program, in RFC 3339 format.
#  This field is used to display the **Enrolled On** or **Member Since** date in
#  first-party Square products.
#  If this field is not set in a `CreateLoyaltyAccount` request, Square populates
#  it after the buyer's first action on their account
#  (when `AccumulateLoyaltyPoints` or `CreateLoyaltyReward` is called). In
#  first-party flows, Square populates the field when the buyer agrees to the terms
#  of service in Square Point of Sale.
#  This field is typically specified in a `CreateLoyaltyAccount` request when
#  creating a loyalty account for a buyer who already interacted with their
#  account.
#  For example, you would set this field when migrating accounts from an external
#  system. The timestamp in the request can represent a current or previous date
#  and time, but it cannot be set for the future.
    attr_reader :enrolled_at
  # @return [String] The timestamp when the loyalty account was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the loyalty account was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [SquareApiClient::LoyaltyAccountMapping] The mapping that associates the loyalty account with a buyer. Currently,
#  a loyalty account can only be mapped to a buyer by phone number.
#  To create a loyalty account, you must specify the `mapping` field, with the
#  buyer's phone number
#  in the `phone_number` field.
    attr_reader :mapping
  # @return [Array<SquareApiClient::LoyaltyAccountExpiringPointDeadline>] The schedule for when points expire in the loyalty account balance. This field
#  is present only if the account has points that are scheduled to expire.
#  The total number of points in this field equals the number of points in the
#  `balance` field.
    attr_reader :expiring_point_deadlines
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the loyalty account.
    # @param program_id [String] The Square-assigned ID of the [loyalty program](entity:LoyaltyProgram) to which
#  the account belongs.
    # @param balance [Integer] The available point balance in the loyalty account. If points are scheduled to
#  expire, they are listed in the `expiring_point_deadlines` field.
#  Your application should be able to handle loyalty accounts that have a negative
#  point balance (`balance` is less than 0). This might occur if a seller makes a
#  manual adjustment or as a result of a refund or exchange.
    # @param lifetime_points [Integer] The total points accrued during the lifetime of the account.
    # @param customer_id [String] The Square-assigned ID of the [customer](entity:Customer) that is associated
#  with the account.
    # @param enrolled_at [String] The timestamp when the buyer joined the loyalty program, in RFC 3339 format.
#  This field is used to display the **Enrolled On** or **Member Since** date in
#  first-party Square products.
#  If this field is not set in a `CreateLoyaltyAccount` request, Square populates
#  it after the buyer's first action on their account
#  (when `AccumulateLoyaltyPoints` or `CreateLoyaltyReward` is called). In
#  first-party flows, Square populates the field when the buyer agrees to the terms
#  of service in Square Point of Sale.
#  This field is typically specified in a `CreateLoyaltyAccount` request when
#  creating a loyalty account for a buyer who already interacted with their
#  account.
#  For example, you would set this field when migrating accounts from an external
#  system. The timestamp in the request can represent a current or previous date
#  and time, but it cannot be set for the future.
    # @param created_at [String] The timestamp when the loyalty account was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the loyalty account was last updated, in RFC 3339 format.
    # @param mapping [SquareApiClient::LoyaltyAccountMapping] The mapping that associates the loyalty account with a buyer. Currently,
#  a loyalty account can only be mapped to a buyer by phone number.
#  To create a loyalty account, you must specify the `mapping` field, with the
#  buyer's phone number
#  in the `phone_number` field.
    # @param expiring_point_deadlines [Array<SquareApiClient::LoyaltyAccountExpiringPointDeadline>] The schedule for when points expire in the loyalty account balance. This field
#  is present only if the account has points that are scheduled to expire.
#  The total number of points in this field equals the number of points in the
#  `balance` field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyAccount]
    def initialize(id: OMIT, program_id:, balance: OMIT, lifetime_points: OMIT, customer_id: OMIT, enrolled_at: OMIT, created_at: OMIT, updated_at: OMIT, mapping: OMIT, expiring_point_deadlines: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @program_id = program_id
      @balance = balance if balance != OMIT
      @lifetime_points = lifetime_points if lifetime_points != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @enrolled_at = enrolled_at if enrolled_at != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @mapping = mapping if mapping != OMIT
      @expiring_point_deadlines = expiring_point_deadlines if expiring_point_deadlines != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "program_id": program_id, "balance": balance, "lifetime_points": lifetime_points, "customer_id": customer_id, "enrolled_at": enrolled_at, "created_at": created_at, "updated_at": updated_at, "mapping": mapping, "expiring_point_deadlines": expiring_point_deadlines }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyAccount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyAccount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      program_id = parsed_json["program_id"]
      balance = parsed_json["balance"]
      lifetime_points = parsed_json["lifetime_points"]
      customer_id = parsed_json["customer_id"]
      enrolled_at = parsed_json["enrolled_at"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      unless parsed_json["mapping"].nil?
        mapping = parsed_json["mapping"].to_json
        mapping = SquareApiClient::LoyaltyAccountMapping.from_json(json_object: mapping)
      else
        mapping = nil
      end
      expiring_point_deadlines = parsed_json["expiring_point_deadlines"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyAccountExpiringPointDeadline.from_json(json_object: item)
end
      new(
        id: id,
        program_id: program_id,
        balance: balance,
        lifetime_points: lifetime_points,
        customer_id: customer_id,
        enrolled_at: enrolled_at,
        created_at: created_at,
        updated_at: updated_at,
        mapping: mapping,
        expiring_point_deadlines: expiring_point_deadlines,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyAccount to a JSON object
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
      obj.program_id.is_a?(String) != false || raise("Passed value for field obj.program_id is not the expected type, validation failed.")
      obj.balance&.is_a?(Integer) != false || raise("Passed value for field obj.balance is not the expected type, validation failed.")
      obj.lifetime_points&.is_a?(Integer) != false || raise("Passed value for field obj.lifetime_points is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.enrolled_at&.is_a?(String) != false || raise("Passed value for field obj.enrolled_at is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.mapping.nil? || SquareApiClient::LoyaltyAccountMapping.validate_raw(obj: obj.mapping)
      obj.expiring_point_deadlines&.is_a?(Array) != false || raise("Passed value for field obj.expiring_point_deadlines is not the expected type, validation failed.")
    end
  end
end