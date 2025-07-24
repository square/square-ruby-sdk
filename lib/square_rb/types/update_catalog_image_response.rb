# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require "ostruct"
require "json"

module SquareApiClient
  class UpdateCatalogImageResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::CatalogObject] The newly updated `CatalogImage` including a Square-generated
#  URL for the encapsulated image file.
    attr_reader :image
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param image [SquareApiClient::CatalogObject] The newly updated `CatalogImage` including a Square-generated
#  URL for the encapsulated image file.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateCatalogImageResponse]
    def initialize(errors: OMIT, image: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @image = image if image != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "image": image }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateCatalogImageResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateCatalogImageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["image"].nil?
        image = parsed_json["image"].to_json
        image = SquareApiClient::CatalogObject.from_json(json_object: image)
      else
        image = nil
      end
      new(
        errors: errors,
        image: image,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateCatalogImageResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.image.nil? || SquareApiClient::CatalogObject.validate_raw(obj: obj.image)
    end
  end
end