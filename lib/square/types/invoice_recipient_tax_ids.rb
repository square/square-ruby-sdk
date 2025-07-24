# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents the tax IDs for an invoice recipient. The country of the seller
#  account determines
#  whether the corresponding `tax_ids` field is available for the customer. For
#  more information,
#  see [Invoice recipient tax
#  s](https://developer.squareup.com/docs/invoices-api/overview#recipient-tax-ids).
  class InvoiceRecipientTaxIds
  # @return [String] The EU VAT identification number for the invoice recipient. For example,
#  `IE3426675K`.
    attr_reader :eu_vat
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param eu_vat [String] The EU VAT identification number for the invoice recipient. For example,
#  `IE3426675K`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoiceRecipientTaxIds]
    def initialize(eu_vat: OMIT, additional_properties: nil)
      @eu_vat = eu_vat if eu_vat != OMIT
      @additional_properties = additional_properties
      @_field_set = { "eu_vat": eu_vat }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceRecipientTaxIds
    #
    # @param json_object [String] 
    # @return [square.rb::InvoiceRecipientTaxIds]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      eu_vat = parsed_json["eu_vat"]
      new(eu_vat: eu_vat, additional_properties: struct)
    end
# Serialize an instance of InvoiceRecipientTaxIds to a JSON object
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