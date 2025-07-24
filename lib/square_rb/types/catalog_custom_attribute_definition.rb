# frozen_string_literal: true
require_relative "catalog_custom_attribute_definition_type"
require_relative "source_application"
require_relative "catalog_object_type"
require_relative "catalog_custom_attribute_definition_seller_visibility"
require_relative "catalog_custom_attribute_definition_app_visibility"
require_relative "catalog_custom_attribute_definition_string_config"
require_relative "catalog_custom_attribute_definition_number_config"
require_relative "catalog_custom_attribute_definition_selection_config"
require "ostruct"
require "json"

module SquareApiClient
# Contains information defining a custom attribute. Custom attributes are
#  intended to store additional information about a catalog object or to associate
#  a
#  catalog object with an entity in another system. Do not use custom attributes
#  to store any sensitive information (personally identifiable information, card
#  details, etc.).
#  [Read more about custom
#  tributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes)
  class CatalogCustomAttributeDefinition
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionType] The type of this custom attribute. Cannot be modified after creation.
#  Required.
#  See
#  atalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype)
#  for possible values
    attr_reader :type
  # @return [String] The name of this definition for API and seller-facing UI purposes.
#  The name must be unique within the (merchant, application) pair. Required.
#  May not be empty and may not exceed 255 characters. Can be modified after
#  creation.
    attr_reader :name
  # @return [String] Seller-oriented description of the meaning of this Custom Attribute,
#  any constraints that the seller should observe, etc. May be displayed as a
#  tooltip in Square UIs.
    attr_reader :description
  # @return [SquareApiClient::SourceApplication] __Read only.__ Contains information about the application that
#  created this custom attribute definition.
    attr_reader :source_application
  # @return [Array<SquareApiClient::CatalogObjectType>] The set of `CatalogObject` types that this custom atttribute may be applied to.
#  Currently, only `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, and
#  `CATEGORY` are allowed. At least one type must be included.
#  See [CatalogObjectType](#type-catalogobjecttype) for possible values
    attr_reader :allowed_object_types
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionSellerVisibility] The visibility of a custom attribute in seller-facing UIs (including Square
#  Point
#  of Sale applications and Square Dashboard). May be modified.
#  See
#  initionSellerVisibility](#type-catalogcustomattributedefinitionsellervisibility)
#  for possible values
    attr_reader :seller_visibility
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionAppVisibility] The visibility of a custom attribute to applications other than the application
#  that created the attribute.
#  See
#  uteDefinitionAppVisibility](#type-catalogcustomattributedefinitionappvisibility)
#  for possible values
    attr_reader :app_visibility
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionStringConfig] Optionally, populated when `type` = `STRING`, unset otherwise.
    attr_reader :string_config
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionNumberConfig] Optionally, populated when `type` = `NUMBER`, unset otherwise.
    attr_reader :number_config
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfig] Populated when `type` is set to `SELECTION`, unset otherwise.
    attr_reader :selection_config
  # @return [Integer] The number of custom attributes that reference this
#  custom attribute definition. Set by the server in response to a ListCatalog
#  request with `include_counts` set to `true`.  If the actual count is greater
#  than 100, `custom_attribute_usage_count` will be set to `100`.
    attr_reader :custom_attribute_usage_count
  # @return [String] The name of the desired custom attribute key that can be used to access
#  the custom attribute value on catalog objects. Cannot be modified after the
#  custom attribute definition has been created.
#  Must be between 1 and 60 characters, and may only contain the characters
#  `[a-zA-Z0-9_-]`.
    attr_reader :key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [SquareApiClient::CatalogCustomAttributeDefinitionType] The type of this custom attribute. Cannot be modified after creation.
#  Required.
#  See
#  atalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype)
#  for possible values
    # @param name [String] The name of this definition for API and seller-facing UI purposes.
#  The name must be unique within the (merchant, application) pair. Required.
#  May not be empty and may not exceed 255 characters. Can be modified after
#  creation.
    # @param description [String] Seller-oriented description of the meaning of this Custom Attribute,
#  any constraints that the seller should observe, etc. May be displayed as a
#  tooltip in Square UIs.
    # @param source_application [SquareApiClient::SourceApplication] __Read only.__ Contains information about the application that
#  created this custom attribute definition.
    # @param allowed_object_types [Array<SquareApiClient::CatalogObjectType>] The set of `CatalogObject` types that this custom atttribute may be applied to.
#  Currently, only `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, and
#  `CATEGORY` are allowed. At least one type must be included.
#  See [CatalogObjectType](#type-catalogobjecttype) for possible values
    # @param seller_visibility [SquareApiClient::CatalogCustomAttributeDefinitionSellerVisibility] The visibility of a custom attribute in seller-facing UIs (including Square
#  Point
#  of Sale applications and Square Dashboard). May be modified.
#  See
#  initionSellerVisibility](#type-catalogcustomattributedefinitionsellervisibility)
#  for possible values
    # @param app_visibility [SquareApiClient::CatalogCustomAttributeDefinitionAppVisibility] The visibility of a custom attribute to applications other than the application
#  that created the attribute.
#  See
#  uteDefinitionAppVisibility](#type-catalogcustomattributedefinitionappvisibility)
#  for possible values
    # @param string_config [SquareApiClient::CatalogCustomAttributeDefinitionStringConfig] Optionally, populated when `type` = `STRING`, unset otherwise.
    # @param number_config [SquareApiClient::CatalogCustomAttributeDefinitionNumberConfig] Optionally, populated when `type` = `NUMBER`, unset otherwise.
    # @param selection_config [SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfig] Populated when `type` is set to `SELECTION`, unset otherwise.
    # @param custom_attribute_usage_count [Integer] The number of custom attributes that reference this
#  custom attribute definition. Set by the server in response to a ListCatalog
#  request with `include_counts` set to `true`.  If the actual count is greater
#  than 100, `custom_attribute_usage_count` will be set to `100`.
    # @param key [String] The name of the desired custom attribute key that can be used to access
#  the custom attribute value on catalog objects. Cannot be modified after the
#  custom attribute definition has been created.
#  Must be between 1 and 60 characters, and may only contain the characters
#  `[a-zA-Z0-9_-]`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogCustomAttributeDefinition]
    def initialize(type:, name:, description: OMIT, source_application: OMIT, allowed_object_types:, seller_visibility: OMIT, app_visibility: OMIT, string_config: OMIT, number_config: OMIT, selection_config: OMIT, custom_attribute_usage_count: OMIT, key: OMIT, additional_properties: nil)
      @type = type
      @name = name
      @description = description if description != OMIT
      @source_application = source_application if source_application != OMIT
      @allowed_object_types = allowed_object_types
      @seller_visibility = seller_visibility if seller_visibility != OMIT
      @app_visibility = app_visibility if app_visibility != OMIT
      @string_config = string_config if string_config != OMIT
      @number_config = number_config if number_config != OMIT
      @selection_config = selection_config if selection_config != OMIT
      @custom_attribute_usage_count = custom_attribute_usage_count if custom_attribute_usage_count != OMIT
      @key = key if key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "name": name, "description": description, "source_application": source_application, "allowed_object_types": allowed_object_types, "seller_visibility": seller_visibility, "app_visibility": app_visibility, "string_config": string_config, "number_config": number_config, "selection_config": selection_config, "custom_attribute_usage_count": custom_attribute_usage_count, "key": key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogCustomAttributeDefinition
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogCustomAttributeDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      unless parsed_json["source_application"].nil?
        source_application = parsed_json["source_application"].to_json
        source_application = SquareApiClient::SourceApplication.from_json(json_object: source_application)
      else
        source_application = nil
      end
      allowed_object_types = parsed_json["allowed_object_types"]
      seller_visibility = parsed_json["seller_visibility"]
      app_visibility = parsed_json["app_visibility"]
      unless parsed_json["string_config"].nil?
        string_config = parsed_json["string_config"].to_json
        string_config = SquareApiClient::CatalogCustomAttributeDefinitionStringConfig.from_json(json_object: string_config)
      else
        string_config = nil
      end
      unless parsed_json["number_config"].nil?
        number_config = parsed_json["number_config"].to_json
        number_config = SquareApiClient::CatalogCustomAttributeDefinitionNumberConfig.from_json(json_object: number_config)
      else
        number_config = nil
      end
      unless parsed_json["selection_config"].nil?
        selection_config = parsed_json["selection_config"].to_json
        selection_config = SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfig.from_json(json_object: selection_config)
      else
        selection_config = nil
      end
      custom_attribute_usage_count = parsed_json["custom_attribute_usage_count"]
      key = parsed_json["key"]
      new(
        type: type,
        name: name,
        description: description,
        source_application: source_application,
        allowed_object_types: allowed_object_types,
        seller_visibility: seller_visibility,
        app_visibility: app_visibility,
        string_config: string_config,
        number_config: number_config,
        selection_config: selection_config,
        custom_attribute_usage_count: custom_attribute_usage_count,
        key: key,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogCustomAttributeDefinition to a JSON object
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
      obj.type.is_a?(SquareApiClient::CatalogCustomAttributeDefinitionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.source_application.nil? || SquareApiClient::SourceApplication.validate_raw(obj: obj.source_application)
      obj.allowed_object_types.is_a?(Array) != false || raise("Passed value for field obj.allowed_object_types is not the expected type, validation failed.")
      obj.seller_visibility&.is_a?(SquareApiClient::CatalogCustomAttributeDefinitionSellerVisibility) != false || raise("Passed value for field obj.seller_visibility is not the expected type, validation failed.")
      obj.app_visibility&.is_a?(SquareApiClient::CatalogCustomAttributeDefinitionAppVisibility) != false || raise("Passed value for field obj.app_visibility is not the expected type, validation failed.")
      obj.string_config.nil? || SquareApiClient::CatalogCustomAttributeDefinitionStringConfig.validate_raw(obj: obj.string_config)
      obj.number_config.nil? || SquareApiClient::CatalogCustomAttributeDefinitionNumberConfig.validate_raw(obj: obj.number_config)
      obj.selection_config.nil? || SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfig.validate_raw(obj: obj.selection_config)
      obj.custom_attribute_usage_count&.is_a?(Integer) != false || raise("Passed value for field obj.custom_attribute_usage_count is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
    end
  end
end