# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a
#  [CreateInvoiceAttachment](api-endpoint:Invoices-CreateInvoiceAttachment)
#  request.
  class CreateInvoiceAttachmentRequestData
  # @return [String] A unique string that identifies the `CreateInvoiceAttachment` request.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    attr_reader :idempotency_key
  # @return [String] The description of the attachment to display on the invoice.
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A unique string that identifies the `CreateInvoiceAttachment` request.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param description [String] The description of the attachment to display on the invoice.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateInvoiceAttachmentRequestData]
    def initialize(idempotency_key: OMIT, description: OMIT, additional_properties: nil)
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key, "description": description }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateInvoiceAttachmentRequestData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateInvoiceAttachmentRequestData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      description = parsed_json["description"]
      new(
        idempotency_key: idempotency_key,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateInvoiceAttachmentRequestData to a JSON object
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
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end