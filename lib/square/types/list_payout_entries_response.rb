# frozen_string_literal: true
require_relative "payout_entry"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# The response to retrieve payout records entries.
  class ListPayoutEntriesResponse
  # @return [Array<SquareApiClient::PayoutEntry>] The requested list of payout entries, ordered with the given or default sort
#  order.
    attr_reader :payout_entries
  # @return [String] The pagination cursor to be used in a subsequent request. If empty, this is the
#  final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payout_entries [Array<SquareApiClient::PayoutEntry>] The requested list of payout entries, ordered with the given or default sort
#  order.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If empty, this is the
#  final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListPayoutEntriesResponse]
    def initialize(payout_entries: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @payout_entries = payout_entries if payout_entries != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payout_entries": payout_entries, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListPayoutEntriesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListPayoutEntriesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payout_entries = parsed_json["payout_entries"]&.map do | item |
  item = item.to_json
  SquareApiClient::PayoutEntry.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        payout_entries: payout_entries,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListPayoutEntriesResponse to a JSON object
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
      obj.payout_entries&.is_a?(Array) != false || raise("Passed value for field obj.payout_entries is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end