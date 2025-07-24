# frozen_string_literal: true
require_relative "invoice_custom_field_placement"
require "ostruct"
require "json"

module SquareApiClient
# An additional seller-defined and customer-facing field to include on the
#  invoice. For more information,
#  see [Custom
#  ields](https://developer.squareup.com/docs/invoices-api/overview#custom-fields).
#  Adding custom fields to an invoice requires an
#  [Invoices Plus
#  //developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
  class InvoiceCustomField
  # @return [String] The label or title of the custom field. This field is required for a custom
#  field.
    attr_reader :label
  # @return [String] The text of the custom field. If omitted, only the label is rendered.
    attr_reader :value
  # @return [SquareApiClient::InvoiceCustomFieldPlacement] The location of the custom field on the invoice. This field is required for a
#  custom field.
#  See [InvoiceCustomFieldPlacement](#type-invoicecustomfieldplacement) for
#  possible values
    attr_reader :placement
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] The label or title of the custom field. This field is required for a custom
#  field.
    # @param value [String] The text of the custom field. If omitted, only the label is rendered.
    # @param placement [SquareApiClient::InvoiceCustomFieldPlacement] The location of the custom field on the invoice. This field is required for a
#  custom field.
#  See [InvoiceCustomFieldPlacement](#type-invoicecustomfieldplacement) for
#  possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InvoiceCustomField]
    def initialize(label: OMIT, value: OMIT, placement: OMIT, additional_properties: nil)
      @label = label if label != OMIT
      @value = value if value != OMIT
      @placement = placement if placement != OMIT
      @additional_properties = additional_properties
      @_field_set = { "label": label, "value": value, "placement": placement }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceCustomField
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InvoiceCustomField]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      value = parsed_json["value"]
      placement = parsed_json["placement"]
      new(
        label: label,
        value: value,
        placement: placement,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceCustomField to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.placement&.is_a?(SquareApiClient::InvoiceCustomFieldPlacement) != false || raise("Passed value for field obj.placement is not the expected type, validation failed.")
    end
  end
end