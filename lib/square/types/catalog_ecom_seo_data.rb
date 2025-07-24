# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# SEO data for for a seller's Square Online store.
  class CatalogEcomSeoData
  # @return [String] The SEO title used for the Square Online store.
    attr_reader :page_title
  # @return [String] The SEO description used for the Square Online store.
    attr_reader :page_description
  # @return [String] The SEO permalink used for the Square Online store.
    attr_reader :permalink
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param page_title [String] The SEO title used for the Square Online store.
    # @param page_description [String] The SEO description used for the Square Online store.
    # @param permalink [String] The SEO permalink used for the Square Online store.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogEcomSeoData]
    def initialize(page_title: OMIT, page_description: OMIT, permalink: OMIT, additional_properties: nil)
      @page_title = page_title if page_title != OMIT
      @page_description = page_description if page_description != OMIT
      @permalink = permalink if permalink != OMIT
      @additional_properties = additional_properties
      @_field_set = { "page_title": page_title, "page_description": page_description, "permalink": permalink }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogEcomSeoData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogEcomSeoData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      page_title = parsed_json["page_title"]
      page_description = parsed_json["page_description"]
      permalink = parsed_json["permalink"]
      new(
        page_title: page_title,
        page_description: page_description,
        permalink: permalink,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogEcomSeoData to a JSON object
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
      obj.page_title&.is_a?(String) != false || raise("Passed value for field obj.page_title is not the expected type, validation failed.")
      obj.page_description&.is_a?(String) != false || raise("Passed value for field obj.page_description is not the expected type, validation failed.")
      obj.permalink&.is_a?(String) != false || raise("Passed value for field obj.permalink is not the expected type, validation failed.")
    end
  end
end