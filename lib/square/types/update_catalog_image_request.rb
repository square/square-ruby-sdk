# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class UpdateCatalogImageRequest
  # @return [String] A unique string that identifies this UpdateCatalogImage request.
#  Keys can be any valid string but must be unique for every UpdateCatalogImage
#  request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
    attr_reader :idempotency_key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A unique string that identifies this UpdateCatalogImage request.
#  Keys can be any valid string but must be unique for every UpdateCatalogImage
#  request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::UpdateCatalogImageRequest]
    def initialize(idempotency_key:, additional_properties: nil)
      @idempotency_key = idempotency_key
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key }
    end
# Deserialize a JSON object to an instance of UpdateCatalogImageRequest
    #
    # @param json_object [String] 
    # @return [square.rb::UpdateCatalogImageRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      new(idempotency_key: idempotency_key, additional_properties: struct)
    end
# Serialize an instance of UpdateCatalogImageRequest to a JSON object
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
      obj.idempotency_key.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
    end
  end
end