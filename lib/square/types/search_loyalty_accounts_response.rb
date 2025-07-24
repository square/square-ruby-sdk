# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_account"
require "ostruct"
require "json"

module square.rb
# A response that includes loyalty accounts that satisfy the search criteria.
  class SearchLoyaltyAccountsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::LoyaltyAccount>] The loyalty accounts that met the search criteria,
#  in order of creation date.
    attr_reader :loyalty_accounts
  # @return [String] The pagination cursor to use in a subsequent
#  request. If empty, this is the final response.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param loyalty_accounts [Array<square.rb::LoyaltyAccount>] The loyalty accounts that met the search criteria,
#  in order of creation date.
    # @param cursor [String] The pagination cursor to use in a subsequent
#  request. If empty, this is the final response.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchLoyaltyAccountsResponse]
    def initialize(errors: OMIT, loyalty_accounts: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @loyalty_accounts = loyalty_accounts if loyalty_accounts != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "loyalty_accounts": loyalty_accounts, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchLoyaltyAccountsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchLoyaltyAccountsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      loyalty_accounts = parsed_json["loyalty_accounts"]&.map do | item |
  item = item.to_json
  square.rb::LoyaltyAccount.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        loyalty_accounts: loyalty_accounts,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchLoyaltyAccountsResponse to a JSON object
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
      obj.loyalty_accounts&.is_a?(Array) != false || raise("Passed value for field obj.loyalty_accounts is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end