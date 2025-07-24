# frozen_string_literal: true
require_relative "invoice"
require "ostruct"
require "json"

module square.rb
  class InvoiceScheduledChargeFailedEventObject
  # @return [square.rb::Invoice] The related invoice.
    attr_reader :invoice
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param invoice [square.rb::Invoice] The related invoice.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoiceScheduledChargeFailedEventObject]
    def initialize(invoice: OMIT, additional_properties: nil)
      @invoice = invoice if invoice != OMIT
      @additional_properties = additional_properties
      @_field_set = { "invoice": invoice }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  InvoiceScheduledChargeFailedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::InvoiceScheduledChargeFailedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["invoice"].nil?
        invoice = parsed_json["invoice"].to_json
        invoice = square.rb::Invoice.from_json(json_object: invoice)
      else
        invoice = nil
      end
      new(invoice: invoice, additional_properties: struct)
    end
# Serialize an instance of InvoiceScheduledChargeFailedEventObject to a JSON
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
      obj.invoice.nil? || square.rb::Invoice.validate_raw(obj: obj.invoice)
    end
  end
end