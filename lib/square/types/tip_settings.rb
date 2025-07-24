# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
  class TipSettings
  # @return [Boolean] Indicates whether tipping is enabled for this checkout. Defaults to false.
    attr_reader :allow_tipping
  # @return [Boolean] Indicates whether tip options should be presented on the screen before
#  presenting
#  the signature screen during card payment. Defaults to false.
    attr_reader :separate_tip_screen
  # @return [Boolean] Indicates whether custom tip amounts are allowed during the checkout flow.
#  Defaults to false.
    attr_reader :custom_tip_field
  # @return [Array<Integer>] A list of tip percentages that should be presented during the checkout flow,
#  specified as
#  up to 3 non-negative integers from 0 to 100 (inclusive). Defaults to 15, 20, and
#  25.
    attr_reader :tip_percentages
  # @return [Boolean] Enables the "Smart Tip Amounts" behavior.
#  Exact tipping options depend on the region in which the Square seller is active.
#  For payments under 10.00, in the Australia, Canada, Ireland, United Kingdom, and
#  United States, tipping options are presented as no tip, .50, 1.00 or 2.00.
#  For payment amounts of 10.00 or greater, tipping options are presented as the
#  following percentages: 0%, 5%, 10%, 15%.
#  If set to true, the `tip_percentages` settings is ignored.
#  Defaults to false.
#  To learn more about smart tipping, see [Accept Tips with the Square
#  ](https://squareup.com/help/us/en/article/5069-accept-tips-with-the-square-app).
    attr_reader :smart_tipping
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param allow_tipping [Boolean] Indicates whether tipping is enabled for this checkout. Defaults to false.
    # @param separate_tip_screen [Boolean] Indicates whether tip options should be presented on the screen before
#  presenting
#  the signature screen during card payment. Defaults to false.
    # @param custom_tip_field [Boolean] Indicates whether custom tip amounts are allowed during the checkout flow.
#  Defaults to false.
    # @param tip_percentages [Array<Integer>] A list of tip percentages that should be presented during the checkout flow,
#  specified as
#  up to 3 non-negative integers from 0 to 100 (inclusive). Defaults to 15, 20, and
#  25.
    # @param smart_tipping [Boolean] Enables the "Smart Tip Amounts" behavior.
#  Exact tipping options depend on the region in which the Square seller is active.
#  For payments under 10.00, in the Australia, Canada, Ireland, United Kingdom, and
#  United States, tipping options are presented as no tip, .50, 1.00 or 2.00.
#  For payment amounts of 10.00 or greater, tipping options are presented as the
#  following percentages: 0%, 5%, 10%, 15%.
#  If set to true, the `tip_percentages` settings is ignored.
#  Defaults to false.
#  To learn more about smart tipping, see [Accept Tips with the Square
#  ](https://squareup.com/help/us/en/article/5069-accept-tips-with-the-square-app).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TipSettings]
    def initialize(allow_tipping: OMIT, separate_tip_screen: OMIT, custom_tip_field: OMIT, tip_percentages: OMIT, smart_tipping: OMIT, additional_properties: nil)
      @allow_tipping = allow_tipping if allow_tipping != OMIT
      @separate_tip_screen = separate_tip_screen if separate_tip_screen != OMIT
      @custom_tip_field = custom_tip_field if custom_tip_field != OMIT
      @tip_percentages = tip_percentages if tip_percentages != OMIT
      @smart_tipping = smart_tipping if smart_tipping != OMIT
      @additional_properties = additional_properties
      @_field_set = { "allow_tipping": allow_tipping, "separate_tip_screen": separate_tip_screen, "custom_tip_field": custom_tip_field, "tip_percentages": tip_percentages, "smart_tipping": smart_tipping }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TipSettings
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TipSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      allow_tipping = parsed_json["allow_tipping"]
      separate_tip_screen = parsed_json["separate_tip_screen"]
      custom_tip_field = parsed_json["custom_tip_field"]
      tip_percentages = parsed_json["tip_percentages"]
      smart_tipping = parsed_json["smart_tipping"]
      new(
        allow_tipping: allow_tipping,
        separate_tip_screen: separate_tip_screen,
        custom_tip_field: custom_tip_field,
        tip_percentages: tip_percentages,
        smart_tipping: smart_tipping,
        additional_properties: struct
      )
    end
# Serialize an instance of TipSettings to a JSON object
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
      obj.allow_tipping&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_tipping is not the expected type, validation failed.")
      obj.separate_tip_screen&.is_a?(Boolean) != false || raise("Passed value for field obj.separate_tip_screen is not the expected type, validation failed.")
      obj.custom_tip_field&.is_a?(Boolean) != false || raise("Passed value for field obj.custom_tip_field is not the expected type, validation failed.")
      obj.tip_percentages&.is_a?(Array) != false || raise("Passed value for field obj.tip_percentages is not the expected type, validation failed.")
      obj.smart_tipping&.is_a?(Boolean) != false || raise("Passed value for field obj.smart_tipping is not the expected type, validation failed.")
    end
  end
end