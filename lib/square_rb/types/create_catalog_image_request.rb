# frozen_string_literal: true
require_relative "catalog_object"
require "ostruct"
require "json"

module SquareApiClient
  class CreateCatalogImageRequest
  # @return [String] A unique string that identifies this CreateCatalogImage request.
#  Keys can be any valid string but must be unique for every CreateCatalogImage
#  request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
    attr_reader :idempotency_key
  # @return [String] Unique ID of the `CatalogObject` to attach this `CatalogImage` object to. Leave
#  this
#  field empty to create unattached images, for example if you are building an
#  integration
#  where an image can be attached to catalog items at a later time.
    attr_reader :object_id
  # @return [SquareApiClient::CatalogObject] The new `CatalogObject` of the `IMAGE` type, namely, a `CatalogImage` object, to
#  encapsulate the specified image file.
    attr_reader :image
  # @return [Boolean] If this is set to `true`, the image created will be the primary, or first image
#  of the object referenced by `object_id`.
#  If the `CatalogObject` already has a primary `CatalogImage`, setting this field
#  to `true` will replace the primary image.
#  If this is set to `false` and you use the Square API version 2021-12-15 or
#  later, the image id will be appended to the list of `image_ids` on the object.
#  With Square API version 2021-12-15 or later, the default value is `false`.
#  Otherwise, the effective default value is `true`.
    attr_reader :is_primary
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A unique string that identifies this CreateCatalogImage request.
#  Keys can be any valid string but must be unique for every CreateCatalogImage
#  request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
    # @param object_id [String] Unique ID of the `CatalogObject` to attach this `CatalogImage` object to. Leave
#  this
#  field empty to create unattached images, for example if you are building an
#  integration
#  where an image can be attached to catalog items at a later time.
    # @param image [SquareApiClient::CatalogObject] The new `CatalogObject` of the `IMAGE` type, namely, a `CatalogImage` object, to
#  encapsulate the specified image file.
    # @param is_primary [Boolean] If this is set to `true`, the image created will be the primary, or first image
#  of the object referenced by `object_id`.
#  If the `CatalogObject` already has a primary `CatalogImage`, setting this field
#  to `true` will replace the primary image.
#  If this is set to `false` and you use the Square API version 2021-12-15 or
#  later, the image id will be appended to the list of `image_ids` on the object.
#  With Square API version 2021-12-15 or later, the default value is `false`.
#  Otherwise, the effective default value is `true`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateCatalogImageRequest]
    def initialize(idempotency_key:, object_id: OMIT, image:, is_primary: OMIT, additional_properties: nil)
      @idempotency_key = idempotency_key
      @object_id = object_id if object_id != OMIT
      @image = image
      @is_primary = is_primary if is_primary != OMIT
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key, "object_id": object_id, "image": image, "is_primary": is_primary }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateCatalogImageRequest
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateCatalogImageRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      object_id = parsed_json["object_id"]
      unless parsed_json["image"].nil?
        image = parsed_json["image"].to_json
        image = SquareApiClient::CatalogObject.from_json(json_object: image)
      else
        image = nil
      end
      is_primary = parsed_json["is_primary"]
      new(
        idempotency_key: idempotency_key,
        object_id: object_id,
        image: image,
        is_primary: is_primary,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateCatalogImageRequest to a JSON object
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
      obj.object_id&.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      SquareApiClient::CatalogObject.validate_raw(obj: obj.image)
      obj.is_primary&.is_a?(Boolean) != false || raise("Passed value for field obj.is_primary is not the expected type, validation failed.")
    end
  end
end