# frozen_string_literal: true
require_relative "invoice_attachment"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a
#  [CreateInvoiceAttachment](api-endpoint:Invoices-CreateInvoiceAttachment)
#  response.
  class CreateInvoiceAttachmentResponse
  # @return [square.rb::InvoiceAttachment] Metadata about the attachment that was added to the invoice.
    attr_reader :attachment
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attachment [square.rb::InvoiceAttachment] Metadata about the attachment that was added to the invoice.
    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateInvoiceAttachmentResponse]
    def initialize(attachment: OMIT, errors: OMIT, additional_properties: nil)
      @attachment = attachment if attachment != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "attachment": attachment, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateInvoiceAttachmentResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateInvoiceAttachmentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["attachment"].nil?
        attachment = parsed_json["attachment"].to_json
        attachment = square.rb::InvoiceAttachment.from_json(json_object: attachment)
      else
        attachment = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        attachment: attachment,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateInvoiceAttachmentResponse to a JSON object
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
      obj.attachment.nil? || square.rb::InvoiceAttachment.validate_raw(obj: obj.attachment)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end