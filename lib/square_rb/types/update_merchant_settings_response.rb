# frozen_string_literal: true
require_relative "error"
require_relative "checkout_merchant_settings"
require "ostruct"
require "json"

module SquareApiClient
  class UpdateMerchantSettingsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred when updating the merchant settings.
    attr_reader :errors
  # @return [SquareApiClient::CheckoutMerchantSettings] The updated merchant settings.
    attr_reader :merchant_settings
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred when updating the merchant settings.
    # @param merchant_settings [SquareApiClient::CheckoutMerchantSettings] The updated merchant settings.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateMerchantSettingsResponse]
    def initialize(errors: OMIT, merchant_settings: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @merchant_settings = merchant_settings if merchant_settings != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "merchant_settings": merchant_settings }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateMerchantSettingsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateMerchantSettingsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["merchant_settings"].nil?
        merchant_settings = parsed_json["merchant_settings"].to_json
        merchant_settings = SquareApiClient::CheckoutMerchantSettings.from_json(json_object: merchant_settings)
      else
        merchant_settings = nil
      end
      new(
        errors: errors,
        merchant_settings: merchant_settings,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateMerchantSettingsResponse to a JSON object
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
      obj.merchant_settings.nil? || SquareApiClient::CheckoutMerchantSettings.validate_raw(obj: obj.merchant_settings)
    end
  end
end