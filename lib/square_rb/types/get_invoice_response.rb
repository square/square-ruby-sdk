# frozen_string_literal: true
require_relative "invoice"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Describes a `GetInvoice` response.
  class GetInvoiceResponse
  # @return [SquareApiClient::Invoice] The invoice requested.
    attr_reader :invoice
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param invoice [SquareApiClient::Invoice] The invoice requested.
    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetInvoiceResponse]
    def initialize(invoice: OMIT, errors: OMIT, additional_properties: nil)
      @invoice = invoice if invoice != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "invoice": invoice, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetInvoiceResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetInvoiceResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["invoice"].nil?
        invoice = parsed_json["invoice"].to_json
        invoice = SquareApiClient::Invoice.from_json(json_object: invoice)
      else
        invoice = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        invoice: invoice,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetInvoiceResponse to a JSON object
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
      obj.invoice.nil? || SquareApiClient::Invoice.validate_raw(obj: obj.invoice)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end