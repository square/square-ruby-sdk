# frozen_string_literal: true
require_relative "custom_attribute_definition_visibility"
require "ostruct"
require "json"

module SquareApiClient
# Represents a definition for custom attribute values. A custom attribute
#  definition
#  specifies the key, visibility, schema, and other properties for a custom
#  attribute.
  class CustomAttributeDefinition
  # @return [String] The identifier
#  of the custom attribute definition and its corresponding custom attributes. This
#  value
#  can be a simple key, which is the key that is provided when the custom attribute
#  definition
#  is created, or a qualified key, if the requesting
#  application is not the definition owner. The qualified key consists of the
#  application ID
#  of the custom attribute definition owner
#  followed by the simple key that was provided when the definition was created. It
#  has the
#  format application_id:simple key.
#  The value for a simple key can contain up to 60 alphanumeric characters, periods
#  (.),
#  underscores (_), and hyphens (-).
#  This field can not be changed
#  after the custom attribute definition is created. This field is required when
#  creating
#  a definition and must be unique per application, seller, and resource type.
    attr_reader :key
  # @return [Hash{String => Object}] The JSON schema for the custom attribute definition, which determines the data
#  type of the corresponding custom attributes. For more information,
#  see [Custom Attributes
#  erview](https://developer.squareup.com/docs/devtools/customattributes/overview).
#  This field is required when creating a definition.
    attr_reader :schema
  # @return [String] The name of the custom attribute definition for API and seller-facing UI
#  purposes. The name must
#  be unique within the seller and application pair. This field is required if the
#  `visibility` field is `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    attr_reader :name
  # @return [String] Seller-oriented description of the custom attribute definition, including any
#  constraints
#  that the seller should observe. May be displayed as a tooltip in Square UIs.
#  This field is
#  required if the `visibility` field is `VISIBILITY_READ_ONLY` or
#  `VISIBILITY_READ_WRITE_VALUES`.
    attr_reader :description
  # @return [SquareApiClient::CustomAttributeDefinitionVisibility] Specifies how the custom attribute definition and its values should be shared
#  with
#  the seller and other applications. If no value is specified, the value defaults
#  to `VISIBILITY_HIDDEN`.
#  See [Visibility](#type-visibility) for possible values
    attr_reader :visibility
  # @return [Integer] Read only. The current version of the custom attribute definition.
#  The value is incremented each time the custom attribute definition is updated.
#  When updating a custom attribute definition, you can provide this field
#  and specify the current version of the custom attribute definition to enable
#  [optimistic
#  oper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency).
#  On writes, this field must be set to the latest version. Stale writes are
#  rejected.
#  This field can also be used to enforce strong consistency for reads. For more
#  information about strong consistency for reads,
#  see [Custom Attributes
#  erview](https://developer.squareup.com/docs/devtools/customattributes/overview).
    attr_reader :version
  # @return [String] The timestamp that indicates when the custom attribute definition was created or
#  most recently updated,
#  in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The timestamp that indicates when the custom attribute definition was created,
#  in RFC 3339 format.
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The identifier
#  of the custom attribute definition and its corresponding custom attributes. This
#  value
#  can be a simple key, which is the key that is provided when the custom attribute
#  definition
#  is created, or a qualified key, if the requesting
#  application is not the definition owner. The qualified key consists of the
#  application ID
#  of the custom attribute definition owner
#  followed by the simple key that was provided when the definition was created. It
#  has the
#  format application_id:simple key.
#  The value for a simple key can contain up to 60 alphanumeric characters, periods
#  (.),
#  underscores (_), and hyphens (-).
#  This field can not be changed
#  after the custom attribute definition is created. This field is required when
#  creating
#  a definition and must be unique per application, seller, and resource type.
    # @param schema [Hash{String => Object}] The JSON schema for the custom attribute definition, which determines the data
#  type of the corresponding custom attributes. For more information,
#  see [Custom Attributes
#  erview](https://developer.squareup.com/docs/devtools/customattributes/overview).
#  This field is required when creating a definition.
    # @param name [String] The name of the custom attribute definition for API and seller-facing UI
#  purposes. The name must
#  be unique within the seller and application pair. This field is required if the
#  `visibility` field is `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param description [String] Seller-oriented description of the custom attribute definition, including any
#  constraints
#  that the seller should observe. May be displayed as a tooltip in Square UIs.
#  This field is
#  required if the `visibility` field is `VISIBILITY_READ_ONLY` or
#  `VISIBILITY_READ_WRITE_VALUES`.
    # @param visibility [SquareApiClient::CustomAttributeDefinitionVisibility] Specifies how the custom attribute definition and its values should be shared
#  with
#  the seller and other applications. If no value is specified, the value defaults
#  to `VISIBILITY_HIDDEN`.
#  See [Visibility](#type-visibility) for possible values
    # @param version [Integer] Read only. The current version of the custom attribute definition.
#  The value is incremented each time the custom attribute definition is updated.
#  When updating a custom attribute definition, you can provide this field
#  and specify the current version of the custom attribute definition to enable
#  [optimistic
#  oper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency).
#  On writes, this field must be set to the latest version. Stale writes are
#  rejected.
#  This field can also be used to enforce strong consistency for reads. For more
#  information about strong consistency for reads,
#  see [Custom Attributes
#  erview](https://developer.squareup.com/docs/devtools/customattributes/overview).
    # @param updated_at [String] The timestamp that indicates when the custom attribute definition was created or
#  most recently updated,
#  in RFC 3339 format.
    # @param created_at [String] The timestamp that indicates when the custom attribute definition was created,
#  in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomAttributeDefinition]
    def initialize(key: OMIT, schema: OMIT, name: OMIT, description: OMIT, visibility: OMIT, version: OMIT, updated_at: OMIT, created_at: OMIT, additional_properties: nil)
      @key = key if key != OMIT
      @schema = schema if schema != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @visibility = visibility if visibility != OMIT
      @version = version if version != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "key": key, "schema": schema, "name": name, "description": description, "visibility": visibility, "version": version, "updated_at": updated_at, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomAttributeDefinition
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomAttributeDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      schema = parsed_json["schema"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      visibility = parsed_json["visibility"]
      version = parsed_json["version"]
      updated_at = parsed_json["updated_at"]
      created_at = parsed_json["created_at"]
      new(
        key: key,
        schema: schema,
        name: name,
        description: description,
        visibility: visibility,
        version: version,
        updated_at: updated_at,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomAttributeDefinition to a JSON object
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
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.schema&.is_a?(Hash) != false || raise("Passed value for field obj.schema is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.visibility&.is_a?(SquareApiClient::CustomAttributeDefinitionVisibility) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
    end
  end
end