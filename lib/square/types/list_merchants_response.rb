# frozen_string_literal: true
require_relative "error"
require_relative "merchant"
require "ostruct"
require "json"

module square.rb
# The response object returned by the
#  [ListMerchant](api-endpoint:Merchants-ListMerchants) endpoint.
  class ListMerchantsResponse
  # @return [Array<square.rb::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [Array<square.rb::Merchant>] The requested `Merchant` entities.
    attr_reader :merchant
  # @return [Integer] If the  response is truncated, the cursor to use in next  request to fetch next
#  set of objects.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information on errors encountered during the request.
    # @param merchant [Array<square.rb::Merchant>] The requested `Merchant` entities.
    # @param cursor [Integer] If the  response is truncated, the cursor to use in next  request to fetch next
#  set of objects.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListMerchantsResponse]
    def initialize(errors: OMIT, merchant: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @merchant = merchant if merchant != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "merchant": merchant, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListMerchantsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListMerchantsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      merchant = parsed_json["merchant"]&.map do | item |
  item = item.to_json
  square.rb::Merchant.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        merchant: merchant,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListMerchantsResponse to a JSON object
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
      obj.merchant&.is_a?(Array) != false || raise("Passed value for field obj.merchant is not the expected type, validation failed.")
      obj.cursor&.is_a?(Integer) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end