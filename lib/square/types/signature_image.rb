# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class SignatureImage
  # @return [String] The mime/type of the image data.
#  Use `image/png;base64` for png.
    attr_reader :image_type
  # @return [String] The base64 representation of the image.
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param image_type [String] The mime/type of the image data.
#  Use `image/png;base64` for png.
    # @param data [String] The base64 representation of the image.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SignatureImage]
    def initialize(image_type: OMIT, data: OMIT, additional_properties: nil)
      @image_type = image_type if image_type != OMIT
      @data = data if data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "image_type": image_type, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SignatureImage
    #
    # @param json_object [String] 
    # @return [square.rb::SignatureImage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      image_type = parsed_json["image_type"]
      data = parsed_json["data"]
      new(
        image_type: image_type,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of SignatureImage to a JSON object
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
      obj.image_type&.is_a?(String) != false || raise("Passed value for field obj.image_type is not the expected type, validation failed.")
      obj.data&.is_a?(String) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
    end
  end
end