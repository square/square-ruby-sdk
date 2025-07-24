# frozen_string_literal: true
require_relative "tip_settings"
require "ostruct"
require "json"

module square.rb
  class DeviceCheckoutOptions
  # @return [String] The unique ID of the device intended for this `TerminalCheckout`.
#  A list of `DeviceCode` objects can be retrieved from the /v2/devices/codes
#  endpoint.
#  Match a `DeviceCode.device_id` value with `device_id` to get the associated
#  device code.
    attr_reader :device_id
  # @return [Boolean] Instructs the device to skip the receipt screen. Defaults to false.
    attr_reader :skip_receipt_screen
  # @return [Boolean] Indicates that signature collection is desired during checkout. Defaults to
#  false.
    attr_reader :collect_signature
  # @return [square.rb::TipSettings] Tip-specific settings.
    attr_reader :tip_settings
  # @return [Boolean] Show the itemization screen prior to taking a payment. This field is only
#  meaningful when the
#  checkout includes an order ID. Defaults to true.
    attr_reader :show_itemized_cart
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param device_id [String] The unique ID of the device intended for this `TerminalCheckout`.
#  A list of `DeviceCode` objects can be retrieved from the /v2/devices/codes
#  endpoint.
#  Match a `DeviceCode.device_id` value with `device_id` to get the associated
#  device code.
    # @param skip_receipt_screen [Boolean] Instructs the device to skip the receipt screen. Defaults to false.
    # @param collect_signature [Boolean] Indicates that signature collection is desired during checkout. Defaults to
#  false.
    # @param tip_settings [square.rb::TipSettings] Tip-specific settings.
    # @param show_itemized_cart [Boolean] Show the itemization screen prior to taking a payment. This field is only
#  meaningful when the
#  checkout includes an order ID. Defaults to true.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DeviceCheckoutOptions]
    def initialize(device_id:, skip_receipt_screen: OMIT, collect_signature: OMIT, tip_settings: OMIT, show_itemized_cart: OMIT, additional_properties: nil)
      @device_id = device_id
      @skip_receipt_screen = skip_receipt_screen if skip_receipt_screen != OMIT
      @collect_signature = collect_signature if collect_signature != OMIT
      @tip_settings = tip_settings if tip_settings != OMIT
      @show_itemized_cart = show_itemized_cart if show_itemized_cart != OMIT
      @additional_properties = additional_properties
      @_field_set = { "device_id": device_id, "skip_receipt_screen": skip_receipt_screen, "collect_signature": collect_signature, "tip_settings": tip_settings, "show_itemized_cart": show_itemized_cart }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceCheckoutOptions
    #
    # @param json_object [String] 
    # @return [square.rb::DeviceCheckoutOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      device_id = parsed_json["device_id"]
      skip_receipt_screen = parsed_json["skip_receipt_screen"]
      collect_signature = parsed_json["collect_signature"]
      unless parsed_json["tip_settings"].nil?
        tip_settings = parsed_json["tip_settings"].to_json
        tip_settings = square.rb::TipSettings.from_json(json_object: tip_settings)
      else
        tip_settings = nil
      end
      show_itemized_cart = parsed_json["show_itemized_cart"]
      new(
        device_id: device_id,
        skip_receipt_screen: skip_receipt_screen,
        collect_signature: collect_signature,
        tip_settings: tip_settings,
        show_itemized_cart: show_itemized_cart,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceCheckoutOptions to a JSON object
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
      obj.device_id.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
      obj.skip_receipt_screen&.is_a?(Boolean) != false || raise("Passed value for field obj.skip_receipt_screen is not the expected type, validation failed.")
      obj.collect_signature&.is_a?(Boolean) != false || raise("Passed value for field obj.collect_signature is not the expected type, validation failed.")
      obj.tip_settings.nil? || square.rb::TipSettings.validate_raw(obj: obj.tip_settings)
      obj.show_itemized_cart&.is_a?(Boolean) != false || raise("Passed value for field obj.show_itemized_cart is not the expected type, validation failed.")
    end
  end
end