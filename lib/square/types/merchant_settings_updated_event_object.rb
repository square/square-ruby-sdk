# frozen_string_literal: true
require_relative "checkout_merchant_settings"
require "ostruct"
require "json"

module square.rb
  class MerchantSettingsUpdatedEventObject
  # @return [square.rb::CheckoutMerchantSettings] The updated merchant settings.
    attr_reader :merchant_settings
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param merchant_settings [square.rb::CheckoutMerchantSettings] The updated merchant settings.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::MerchantSettingsUpdatedEventObject]
    def initialize(merchant_settings: OMIT, additional_properties: nil)
      @merchant_settings = merchant_settings if merchant_settings != OMIT
      @additional_properties = additional_properties
      @_field_set = { "merchant_settings": merchant_settings }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MerchantSettingsUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::MerchantSettingsUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["merchant_settings"].nil?
        merchant_settings = parsed_json["merchant_settings"].to_json
        merchant_settings = square.rb::CheckoutMerchantSettings.from_json(json_object: merchant_settings)
      else
        merchant_settings = nil
      end
      new(merchant_settings: merchant_settings, additional_properties: struct)
    end
# Serialize an instance of MerchantSettingsUpdatedEventObject to a JSON object
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
      obj.merchant_settings.nil? || square.rb::CheckoutMerchantSettings.validate_raw(obj: obj.merchant_settings)
    end
  end
end