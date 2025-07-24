# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Fields to describe the action that displays QR-Codes.
  class QrCodeOptions
  # @return [String] The title text to display in the QR code flow on the Terminal.
    attr_reader :title
  # @return [String] The body text to display in the QR code flow on the Terminal.
    attr_reader :body
  # @return [String] The text representation of the data to show in the QR code
#  as UTF8-encoded data.
    attr_reader :barcode_contents
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title text to display in the QR code flow on the Terminal.
    # @param body [String] The body text to display in the QR code flow on the Terminal.
    # @param barcode_contents [String] The text representation of the data to show in the QR code
#  as UTF8-encoded data.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::QrCodeOptions]
    def initialize(title:, body:, barcode_contents:, additional_properties: nil)
      @title = title
      @body = body
      @barcode_contents = barcode_contents
      @additional_properties = additional_properties
      @_field_set = { "title": title, "body": body, "barcode_contents": barcode_contents }
    end
# Deserialize a JSON object to an instance of QrCodeOptions
    #
    # @param json_object [String] 
    # @return [SquareApiClient::QrCodeOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      body = parsed_json["body"]
      barcode_contents = parsed_json["barcode_contents"]
      new(
        title: title,
        body: body,
        barcode_contents: barcode_contents,
        additional_properties: struct
      )
    end
# Serialize an instance of QrCodeOptions to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.body.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      obj.barcode_contents.is_a?(String) != false || raise("Passed value for field obj.barcode_contents is not the expected type, validation failed.")
    end
  end
end