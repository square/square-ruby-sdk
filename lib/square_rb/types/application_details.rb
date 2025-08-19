# frozen_string_literal: true
require_relative "application_details_external_square_product"
require "ostruct"
require "json"

module SquareApiClient
# Details about the application that took the payment.
  class ApplicationDetails
  # @return [SquareApiClient::ApplicationDetailsExternalSquareProduct] The Square product, such as Square Point of Sale (POS),
#  Square Invoices, or Square Virtual Terminal.
#  See [ExternalSquareProduct](#type-externalsquareproduct) for possible values
    attr_reader :square_product
  # @return [String] The Square ID assigned to the application used to take the payment.
#  Application developers can use this information to identify payments that
#  their application processed.
#  For example, if a developer uses a custom application to process payments,
#  this field contains the application ID from the Developer Dashboard.
#  If a seller uses a [Square App
#  Marketplace](https://developer.squareup.com/docs/app-marketplace)
#  application to process payments, the field contains the corresponding
#  application ID.
    attr_reader :application_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param square_product [SquareApiClient::ApplicationDetailsExternalSquareProduct] The Square product, such as Square Point of Sale (POS),
#  Square Invoices, or Square Virtual Terminal.
#  See [ExternalSquareProduct](#type-externalsquareproduct) for possible values
    # @param application_id [String] The Square ID assigned to the application used to take the payment.
#  Application developers can use this information to identify payments that
#  their application processed.
#  For example, if a developer uses a custom application to process payments,
#  this field contains the application ID from the Developer Dashboard.
#  If a seller uses a [Square App
#  Marketplace](https://developer.squareup.com/docs/app-marketplace)
#  application to process payments, the field contains the corresponding
#  application ID.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ApplicationDetails]
    def initialize(square_product: OMIT, application_id: OMIT, additional_properties: nil)
      @square_product = square_product if square_product != OMIT
      @application_id = application_id if application_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "square_product": square_product, "application_id": application_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ApplicationDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ApplicationDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      square_product = parsed_json["square_product"]
      application_id = parsed_json["application_id"]
      new(
        square_product: square_product,
        application_id: application_id,
        additional_properties: struct
      )
    end
# Serialize an instance of ApplicationDetails to a JSON object
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
      obj.square_product&.is_a?(SquareApiClient::ApplicationDetailsExternalSquareProduct) != false || raise("Passed value for field obj.square_product is not the expected type, validation failed.")
      obj.application_id&.is_a?(String) != false || raise("Passed value for field obj.application_id is not the expected type, validation failed.")
    end
  end
end