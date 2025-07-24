# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a file attached to an [invoice](entity:Invoice).
  class InvoiceAttachment
  # @return [String] The Square-assigned ID of the attachment.
    attr_reader :id
  # @return [String] The file name of the attachment, which is displayed on the invoice.
    attr_reader :filename
  # @return [String] The description of the attachment, which is displayed on the invoice.
#  This field maps to the seller-defined **Message** field.
    attr_reader :description
  # @return [Integer] The file size of the attachment in bytes.
    attr_reader :filesize
  # @return [String] The MD5 hash that was generated from the file contents.
    attr_reader :hash
  # @return [String] The mime type of the attachment.
#  The following mime types are supported:
#  image/gif, image/jpeg, image/png, image/tiff, image/bmp, application/pdf.
    attr_reader :mime_type
  # @return [String] The timestamp when the attachment was uploaded, in RFC 3339 format.
    attr_reader :uploaded_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the attachment.
    # @param filename [String] The file name of the attachment, which is displayed on the invoice.
    # @param description [String] The description of the attachment, which is displayed on the invoice.
#  This field maps to the seller-defined **Message** field.
    # @param filesize [Integer] The file size of the attachment in bytes.
    # @param hash [String] The MD5 hash that was generated from the file contents.
    # @param mime_type [String] The mime type of the attachment.
#  The following mime types are supported:
#  image/gif, image/jpeg, image/png, image/tiff, image/bmp, application/pdf.
    # @param uploaded_at [String] The timestamp when the attachment was uploaded, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InvoiceAttachment]
    def initialize(id: OMIT, filename: OMIT, description: OMIT, filesize: OMIT, hash: OMIT, mime_type: OMIT, uploaded_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @filename = filename if filename != OMIT
      @description = description if description != OMIT
      @filesize = filesize if filesize != OMIT
      @hash = hash if hash != OMIT
      @mime_type = mime_type if mime_type != OMIT
      @uploaded_at = uploaded_at if uploaded_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "filename": filename, "description": description, "filesize": filesize, "hash": hash, "mime_type": mime_type, "uploaded_at": uploaded_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceAttachment
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InvoiceAttachment]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      filename = parsed_json["filename"]
      description = parsed_json["description"]
      filesize = parsed_json["filesize"]
      hash = parsed_json["hash"]
      mime_type = parsed_json["mime_type"]
      uploaded_at = parsed_json["uploaded_at"]
      new(
        id: id,
        filename: filename,
        description: description,
        filesize: filesize,
        hash: hash,
        mime_type: mime_type,
        uploaded_at: uploaded_at,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceAttachment to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.filename&.is_a?(String) != false || raise("Passed value for field obj.filename is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.filesize&.is_a?(Integer) != false || raise("Passed value for field obj.filesize is not the expected type, validation failed.")
      obj.hash&.is_a?(String) != false || raise("Passed value for field obj.hash is not the expected type, validation failed.")
      obj.mime_type&.is_a?(String) != false || raise("Passed value for field obj.mime_type is not the expected type, validation failed.")
      obj.uploaded_at&.is_a?(String) != false || raise("Passed value for field obj.uploaded_at is not the expected type, validation failed.")
    end
  end
end