# frozen_string_literal: true
require_relative "custom_attribute_definition_visibility"
require_relative "custom_attribute_definition"
require "ostruct"
require "json"

module square.rb
# A custom attribute value. Each custom attribute value has a corresponding
#  `CustomAttributeDefinition` object.
  class CustomAttribute
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
    attr_reader :key
  # @return [Object] 
    attr_reader :value
  # @return [Integer] Read only. The current version of the custom attribute. This field is
#  incremented when the custom attribute is changed.
#  When updating an existing custom attribute value, you can provide this field
#  and specify the current version of the custom attribute to enable
#  [optimistic
#  oper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency).
#  This field can also be used to enforce strong consistency for reads. For more
#  information about strong consistency for reads,
#  see [Custom Attributes
#  erview](https://developer.squareup.com/docs/devtools/customattributes/overview).
    attr_reader :version
  # @return [square.rb::CustomAttributeDefinitionVisibility] A copy of the `visibility` field value for the associated custom attribute
#  definition.
#  See
#  [CustomAttributeDefinitionVisibility](#type-customattributedefinitionvisibility)
#  for possible values
    attr_reader :visibility
  # @return [square.rb::CustomAttributeDefinition] A copy of the associated custom attribute definition object. This field is only
#  set when
#  the optional field is specified on the request.
    attr_reader :definition
  # @return [String] The timestamp that indicates when the custom attribute was created or was most
#  recently
#  updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The timestamp that indicates when the custom attribute was created, in RFC 3339
#  format.
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
    # @param value [Object] 
    # @param version [Integer] Read only. The current version of the custom attribute. This field is
#  incremented when the custom attribute is changed.
#  When updating an existing custom attribute value, you can provide this field
#  and specify the current version of the custom attribute to enable
#  [optimistic
#  oper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency).
#  This field can also be used to enforce strong consistency for reads. For more
#  information about strong consistency for reads,
#  see [Custom Attributes
#  erview](https://developer.squareup.com/docs/devtools/customattributes/overview).
    # @param visibility [square.rb::CustomAttributeDefinitionVisibility] A copy of the `visibility` field value for the associated custom attribute
#  definition.
#  See
#  [CustomAttributeDefinitionVisibility](#type-customattributedefinitionvisibility)
#  for possible values
    # @param definition [square.rb::CustomAttributeDefinition] A copy of the associated custom attribute definition object. This field is only
#  set when
#  the optional field is specified on the request.
    # @param updated_at [String] The timestamp that indicates when the custom attribute was created or was most
#  recently
#  updated, in RFC 3339 format.
    # @param created_at [String] The timestamp that indicates when the custom attribute was created, in RFC 3339
#  format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomAttribute]
    def initialize(key: OMIT, value: OMIT, version: OMIT, visibility: OMIT, definition: OMIT, updated_at: OMIT, created_at: OMIT, additional_properties: nil)
      @key = key if key != OMIT
      @value = value if value != OMIT
      @version = version if version != OMIT
      @visibility = visibility if visibility != OMIT
      @definition = definition if definition != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "key": key, "value": value, "version": version, "visibility": visibility, "definition": definition, "updated_at": updated_at, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomAttribute
    #
    # @param json_object [String] 
    # @return [square.rb::CustomAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      value = parsed_json["value"]
      version = parsed_json["version"]
      visibility = parsed_json["visibility"]
      unless parsed_json["definition"].nil?
        definition = parsed_json["definition"].to_json
        definition = square.rb::CustomAttributeDefinition.from_json(json_object: definition)
      else
        definition = nil
      end
      updated_at = parsed_json["updated_at"]
      created_at = parsed_json["created_at"]
      new(
        key: key,
        value: value,
        version: version,
        visibility: visibility,
        definition: definition,
        updated_at: updated_at,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomAttribute to a JSON object
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
      obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.visibility&.is_a?(square.rb::CustomAttributeDefinitionVisibility) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
      obj.definition.nil? || square.rb::CustomAttributeDefinition.validate_raw(obj: obj.definition)
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
    end
  end
end