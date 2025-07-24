# frozen_string_literal: true
require_relative "signature_image"
require "ostruct"
require "json"

module square.rb
  class SignatureOptions
  # @return [String] The title text to display in the signature capture flow on the Terminal.
    attr_reader :title
  # @return [String] The body text to display in the signature capture flow on the Terminal.
    attr_reader :body
  # @return [Array<square.rb::SignatureImage>] An image representation of the collected signature.
    attr_reader :signature
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title text to display in the signature capture flow on the Terminal.
    # @param body [String] The body text to display in the signature capture flow on the Terminal.
    # @param signature [Array<square.rb::SignatureImage>] An image representation of the collected signature.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SignatureOptions]
    def initialize(title:, body:, signature: OMIT, additional_properties: nil)
      @title = title
      @body = body
      @signature = signature if signature != OMIT
      @additional_properties = additional_properties
      @_field_set = { "title": title, "body": body, "signature": signature }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SignatureOptions
    #
    # @param json_object [String] 
    # @return [square.rb::SignatureOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      body = parsed_json["body"]
      signature = parsed_json["signature"]&.map do | item |
  item = item.to_json
  square.rb::SignatureImage.from_json(json_object: item)
end
      new(
        title: title,
        body: body,
        signature: signature,
        additional_properties: struct
      )
    end
# Serialize an instance of SignatureOptions to a JSON object
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
      obj.signature&.is_a?(Array) != false || raise("Passed value for field obj.signature is not the expected type, validation failed.")
    end
  end
end