# frozen_string_literal: true
require_relative "loyalty_account_mapping"
require "ostruct"
require "json"

module square.rb
# The search criteria for the loyalty accounts.
  class SearchLoyaltyAccountsRequestLoyaltyAccountQuery
  # @return [Array<square.rb::LoyaltyAccountMapping>] The set of mappings to use in the loyalty account search.
#  This cannot be combined with `customer_ids`.
#  Max: 30 mappings
    attr_reader :mappings
  # @return [Array<String>] The set of customer IDs to use in the loyalty account search.
#  This cannot be combined with `mappings`.
#  Max: 30 customer IDs
    attr_reader :customer_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param mappings [Array<square.rb::LoyaltyAccountMapping>] The set of mappings to use in the loyalty account search.
#  This cannot be combined with `customer_ids`.
#  Max: 30 mappings
    # @param customer_ids [Array<String>] The set of customer IDs to use in the loyalty account search.
#  This cannot be combined with `mappings`.
#  Max: 30 customer IDs
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchLoyaltyAccountsRequestLoyaltyAccountQuery]
    def initialize(mappings: OMIT, customer_ids: OMIT, additional_properties: nil)
      @mappings = mappings if mappings != OMIT
      @customer_ids = customer_ids if customer_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "mappings": mappings, "customer_ids": customer_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  SearchLoyaltyAccountsRequestLoyaltyAccountQuery
    #
    # @param json_object [String] 
    # @return [square.rb::SearchLoyaltyAccountsRequestLoyaltyAccountQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      mappings = parsed_json["mappings"]&.map do | item |
  item = item.to_json
  square.rb::LoyaltyAccountMapping.from_json(json_object: item)
end
      customer_ids = parsed_json["customer_ids"]
      new(
        mappings: mappings,
        customer_ids: customer_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchLoyaltyAccountsRequestLoyaltyAccountQuery to a
#  JSON object
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
      obj.mappings&.is_a?(Array) != false || raise("Passed value for field obj.mappings is not the expected type, validation failed.")
      obj.customer_ids&.is_a?(Array) != false || raise("Passed value for field obj.customer_ids is not the expected type, validation failed.")
    end
  end
end