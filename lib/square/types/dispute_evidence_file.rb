# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A file to be uploaded as dispute evidence.
  class DisputeEvidenceFile
  # @return [String] The file name including the file extension. For example: "receipt.tiff".
    attr_reader :filename
  # @return [String] Dispute evidence files must be application/pdf, image/heic, image/heif,
#  image/jpeg, image/png, or image/tiff formats.
    attr_reader :filetype
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filename [String] The file name including the file extension. For example: "receipt.tiff".
    # @param filetype [String] Dispute evidence files must be application/pdf, image/heic, image/heif,
#  image/jpeg, image/png, or image/tiff formats.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DisputeEvidenceFile]
    def initialize(filename: OMIT, filetype: OMIT, additional_properties: nil)
      @filename = filename if filename != OMIT
      @filetype = filetype if filetype != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filename": filename, "filetype": filetype }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DisputeEvidenceFile
    #
    # @param json_object [String] 
    # @return [square.rb::DisputeEvidenceFile]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      filename = parsed_json["filename"]
      filetype = parsed_json["filetype"]
      new(
        filename: filename,
        filetype: filetype,
        additional_properties: struct
      )
    end
# Serialize an instance of DisputeEvidenceFile to a JSON object
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
      obj.filename&.is_a?(String) != false || raise("Passed value for field obj.filename is not the expected type, validation failed.")
      obj.filetype&.is_a?(String) != false || raise("Passed value for field obj.filetype is not the expected type, validation failed.")
    end
  end
end