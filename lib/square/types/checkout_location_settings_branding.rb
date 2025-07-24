# frozen_string_literal: true
require_relative "checkout_location_settings_branding_header_type"
require_relative "checkout_location_settings_branding_button_shape"
require "ostruct"
require "json"

module square.rb
  class CheckoutLocationSettingsBranding
  # @return [square.rb::CheckoutLocationSettingsBrandingHeaderType] Show the location logo on the checkout page.
#  See [HeaderType](#type-headertype) for possible values
    attr_reader :header_type
  # @return [String] The HTML-supported hex color for the button on the checkout page (for example,
#  "#FFFFFF").
    attr_reader :button_color
  # @return [square.rb::CheckoutLocationSettingsBrandingButtonShape] The shape of the button on the checkout page.
#  See [ButtonShape](#type-buttonshape) for possible values
    attr_reader :button_shape
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param header_type [square.rb::CheckoutLocationSettingsBrandingHeaderType] Show the location logo on the checkout page.
#  See [HeaderType](#type-headertype) for possible values
    # @param button_color [String] The HTML-supported hex color for the button on the checkout page (for example,
#  "#FFFFFF").
    # @param button_shape [square.rb::CheckoutLocationSettingsBrandingButtonShape] The shape of the button on the checkout page.
#  See [ButtonShape](#type-buttonshape) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutLocationSettingsBranding]
    def initialize(header_type: OMIT, button_color: OMIT, button_shape: OMIT, additional_properties: nil)
      @header_type = header_type if header_type != OMIT
      @button_color = button_color if button_color != OMIT
      @button_shape = button_shape if button_shape != OMIT
      @additional_properties = additional_properties
      @_field_set = { "header_type": header_type, "button_color": button_color, "button_shape": button_shape }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckoutLocationSettingsBranding
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutLocationSettingsBranding]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      header_type = parsed_json["header_type"]
      button_color = parsed_json["button_color"]
      button_shape = parsed_json["button_shape"]
      new(
        header_type: header_type,
        button_color: button_color,
        button_shape: button_shape,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutLocationSettingsBranding to a JSON object
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
      obj.header_type&.is_a?(square.rb::CheckoutLocationSettingsBrandingHeaderType) != false || raise("Passed value for field obj.header_type is not the expected type, validation failed.")
      obj.button_color&.is_a?(String) != false || raise("Passed value for field obj.button_color is not the expected type, validation failed.")
      obj.button_shape&.is_a?(square.rb::CheckoutLocationSettingsBrandingButtonShape) != false || raise("Passed value for field obj.button_shape is not the expected type, validation failed.")
    end
  end
end