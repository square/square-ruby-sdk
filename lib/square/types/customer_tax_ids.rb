# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents the tax ID associated with a [customer profile](entity:Customer). The
#  corresponding `tax_ids` field is available only for customers of sellers in EU
#  countries or the United Kingdom.
#  For more information, see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
  class CustomerTaxIds
  # @return [String] The EU VAT identification number for the customer. For example, `IE3426675K`.
#  The ID can contain alphanumeric characters only.
    attr_reader :eu_vat
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param eu_vat [String] The EU VAT identification number for the customer. For example, `IE3426675K`.
#  The ID can contain alphanumeric characters only.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerTaxIds]
    def initialize(eu_vat: OMIT, additional_properties: nil)
      @eu_vat = eu_vat if eu_vat != OMIT
      @additional_properties = additional_properties
      @_field_set = { "eu_vat": eu_vat }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerTaxIds
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerTaxIds]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      eu_vat = parsed_json["eu_vat"]
      new(eu_vat: eu_vat, additional_properties: struct)
    end
# Serialize an instance of CustomerTaxIds to a JSON object
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
      obj.eu_vat&.is_a?(String) != false || raise("Passed value for field obj.eu_vat is not the expected type, validation failed.")
    end
  end
end