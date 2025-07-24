# frozen_string_literal: true
require_relative "catalog_version_updated_event_catalog_version"
require "ostruct"
require "json"

module square.rb
  class CatalogVersionUpdatedEventObject
  # @return [square.rb::CatalogVersionUpdatedEventCatalogVersion] The version of the object.
    attr_reader :catalog_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param catalog_version [square.rb::CatalogVersionUpdatedEventCatalogVersion] The version of the object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogVersionUpdatedEventObject]
    def initialize(catalog_version: OMIT, additional_properties: nil)
      @catalog_version = catalog_version if catalog_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "catalog_version": catalog_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogVersionUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogVersionUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["catalog_version"].nil?
        catalog_version = parsed_json["catalog_version"].to_json
        catalog_version = square.rb::CatalogVersionUpdatedEventCatalogVersion.from_json(json_object: catalog_version)
      else
        catalog_version = nil
      end
      new(catalog_version: catalog_version, additional_properties: struct)
    end
# Serialize an instance of CatalogVersionUpdatedEventObject to a JSON object
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
      obj.catalog_version.nil? || square.rb::CatalogVersionUpdatedEventCatalogVersion.validate_raw(obj: obj.catalog_version)
    end
  end
end