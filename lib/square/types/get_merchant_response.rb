# frozen_string_literal: true
require_relative "error"
require_relative "merchant"
require "ostruct"
require "json"

module square.rb
# The response object returned by the
#  [RetrieveMerchant](api-endpoint:Merchants-RetrieveMerchant) endpoint.
  class GetMerchantResponse
  # @return [Array<square.rb::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [square.rb::Merchant] The requested `Merchant` object.
    attr_reader :merchant
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information on errors encountered during the request.
    # @param merchant [square.rb::Merchant] The requested `Merchant` object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetMerchantResponse]
    def initialize(errors: OMIT, merchant: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @merchant = merchant if merchant != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "merchant": merchant }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetMerchantResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetMerchantResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["merchant"].nil?
        merchant = parsed_json["merchant"].to_json
        merchant = square.rb::Merchant.from_json(json_object: merchant)
      else
        merchant = nil
      end
      new(
        errors: errors,
        merchant: merchant,
        additional_properties: struct
      )
    end
# Serialize an instance of GetMerchantResponse to a JSON object
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
      obj.merchant.nil? || square.rb::Merchant.validate_raw(obj: obj.merchant)
    end
  end
end