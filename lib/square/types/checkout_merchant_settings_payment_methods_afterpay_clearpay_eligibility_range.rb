# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# A range of purchase price that qualifies.
  class CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange
  # @return [square.rb::Money] 
    attr_reader :min
  # @return [square.rb::Money] 
    attr_reader :max
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param min [square.rb::Money] 
    # @param max [square.rb::Money] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange]
    def initialize(min:, max:, additional_properties: nil)
      @min = min
      @max = max
      @additional_properties = additional_properties
      @_field_set = { "min": min, "max": max }
    end
# Deserialize a JSON object to an instance of
#  CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["min"].nil?
        min = parsed_json["min"].to_json
        min = square.rb::Money.from_json(json_object: min)
      else
        min = nil
      end
      unless parsed_json["max"].nil?
        max = parsed_json["max"].to_json
        max = square.rb::Money.from_json(json_object: max)
      else
        max = nil
      end
      new(
        min: min,
        max: max,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange to a JSON
#  object
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
      square.rb::Money.validate_raw(obj: obj.min)
      square.rb::Money.validate_raw(obj: obj.max)
    end
  end
end