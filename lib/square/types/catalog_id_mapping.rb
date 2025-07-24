# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A mapping between a temporary client-supplied ID and a permanent
#  server-generated ID.
#  When calling [UpsertCatalogObject](api-endpoint:Catalog-UpsertCatalogObject) or
#  [BatchUpsertCatalogObjects](api-endpoint:Catalog-BatchUpsertCatalogObjects) to
#  create a [CatalogObject](entity:CatalogObject) instance, you can supply
#  a temporary ID for the to-be-created object, especially when the object is to be
#  referenced
#  elsewhere in the same request body. This temporary ID can be any string unique
#  within
#  the call, but must be prefixed by "#".
#  After the request is submitted and the object created, a permanent
#  server-generated ID is assigned
#  to the new object. The permanent ID is unique across the Square catalog.
  class CatalogIdMapping
  # @return [String] The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
    attr_reader :client_object_id
  # @return [String] The permanent ID for the CatalogObject created by the server.
    attr_reader :object_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param client_object_id [String] The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
    # @param object_id [String] The permanent ID for the CatalogObject created by the server.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogIdMapping]
    def initialize(client_object_id: OMIT, object_id: OMIT, additional_properties: nil)
      @client_object_id = client_object_id if client_object_id != OMIT
      @object_id = object_id if object_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "client_object_id": client_object_id, "object_id": object_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogIdMapping
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogIdMapping]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      client_object_id = parsed_json["client_object_id"]
      object_id = parsed_json["object_id"]
      new(
        client_object_id: client_object_id,
        object_id: object_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogIdMapping to a JSON object
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
      obj.client_object_id&.is_a?(String) != false || raise("Passed value for field obj.client_object_id is not the expected type, validation failed.")
      obj.object_id&.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
    end
  end
end