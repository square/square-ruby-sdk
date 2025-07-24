# frozen_string_literal: true
require_relative "checkout_location_settings_policy"
require_relative "checkout_location_settings_branding"
require_relative "checkout_location_settings_tipping"
require_relative "checkout_location_settings_coupons"
require "ostruct"
require "json"

module square.rb
  class CheckoutLocationSettings
  # @return [String] The ID of the location that these settings apply to.
    attr_reader :location_id
  # @return [Boolean] Indicates whether customers are allowed to leave notes at checkout.
    attr_reader :customer_notes_enabled
  # @return [Array<square.rb::CheckoutLocationSettingsPolicy>] Policy information is displayed at the bottom of the checkout pages.
#  You can set a maximum of two policies.
    attr_reader :policies
  # @return [square.rb::CheckoutLocationSettingsBranding] The branding settings for this location.
    attr_reader :branding
  # @return [square.rb::CheckoutLocationSettingsTipping] The tip settings for this location.
    attr_reader :tipping
  # @return [square.rb::CheckoutLocationSettingsCoupons] The coupon settings for this location.
    attr_reader :coupons
  # @return [String] The timestamp when the settings were last updated, in RFC 3339 format.
#  Examples for January 25th, 2020 6:25:34pm Pacific Standard Time:
#  UTC: 2020-01-26T02:25:34Z
#  Pacific Standard Time with UTC offset: 2020-01-25T18:25:34-08:00
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The ID of the location that these settings apply to.
    # @param customer_notes_enabled [Boolean] Indicates whether customers are allowed to leave notes at checkout.
    # @param policies [Array<square.rb::CheckoutLocationSettingsPolicy>] Policy information is displayed at the bottom of the checkout pages.
#  You can set a maximum of two policies.
    # @param branding [square.rb::CheckoutLocationSettingsBranding] The branding settings for this location.
    # @param tipping [square.rb::CheckoutLocationSettingsTipping] The tip settings for this location.
    # @param coupons [square.rb::CheckoutLocationSettingsCoupons] The coupon settings for this location.
    # @param updated_at [String] The timestamp when the settings were last updated, in RFC 3339 format.
#  Examples for January 25th, 2020 6:25:34pm Pacific Standard Time:
#  UTC: 2020-01-26T02:25:34Z
#  Pacific Standard Time with UTC offset: 2020-01-25T18:25:34-08:00
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutLocationSettings]
    def initialize(location_id: OMIT, customer_notes_enabled: OMIT, policies: OMIT, branding: OMIT, tipping: OMIT, coupons: OMIT, updated_at: OMIT, additional_properties: nil)
      @location_id = location_id if location_id != OMIT
      @customer_notes_enabled = customer_notes_enabled if customer_notes_enabled != OMIT
      @policies = policies if policies != OMIT
      @branding = branding if branding != OMIT
      @tipping = tipping if tipping != OMIT
      @coupons = coupons if coupons != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "customer_notes_enabled": customer_notes_enabled, "policies": policies, "branding": branding, "tipping": tipping, "coupons": coupons, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckoutLocationSettings
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutLocationSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      customer_notes_enabled = parsed_json["customer_notes_enabled"]
      policies = parsed_json["policies"]&.map do | item |
  item = item.to_json
  square.rb::CheckoutLocationSettingsPolicy.from_json(json_object: item)
end
      unless parsed_json["branding"].nil?
        branding = parsed_json["branding"].to_json
        branding = square.rb::CheckoutLocationSettingsBranding.from_json(json_object: branding)
      else
        branding = nil
      end
      unless parsed_json["tipping"].nil?
        tipping = parsed_json["tipping"].to_json
        tipping = square.rb::CheckoutLocationSettingsTipping.from_json(json_object: tipping)
      else
        tipping = nil
      end
      unless parsed_json["coupons"].nil?
        coupons = parsed_json["coupons"].to_json
        coupons = square.rb::CheckoutLocationSettingsCoupons.from_json(json_object: coupons)
      else
        coupons = nil
      end
      updated_at = parsed_json["updated_at"]
      new(
        location_id: location_id,
        customer_notes_enabled: customer_notes_enabled,
        policies: policies,
        branding: branding,
        tipping: tipping,
        coupons: coupons,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutLocationSettings to a JSON object
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
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.customer_notes_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.customer_notes_enabled is not the expected type, validation failed.")
      obj.policies&.is_a?(Array) != false || raise("Passed value for field obj.policies is not the expected type, validation failed.")
      obj.branding.nil? || square.rb::CheckoutLocationSettingsBranding.validate_raw(obj: obj.branding)
      obj.tipping.nil? || square.rb::CheckoutLocationSettingsTipping.validate_raw(obj: obj.tipping)
      obj.coupons.nil? || square.rb::CheckoutLocationSettingsCoupons.validate_raw(obj: obj.coupons)
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end