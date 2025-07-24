# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The query filter to return the search result whose searchable attribute values
#  contain all of the specified keywords or tokens, independent of the token order
#  or case.
  class CatalogQueryText
  # @return [Array<String>] A list of 1, 2, or 3 search keywords. Keywords with fewer than 3 alphanumeric
#  characters are ignored.
    attr_reader :keywords
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param keywords [Array<String>] A list of 1, 2, or 3 search keywords. Keywords with fewer than 3 alphanumeric
#  characters are ignored.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQueryText]
    def initialize(keywords:, additional_properties: nil)
      @keywords = keywords
      @additional_properties = additional_properties
      @_field_set = { "keywords": keywords }
    end
# Deserialize a JSON object to an instance of CatalogQueryText
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQueryText]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      keywords = parsed_json["keywords"]
      new(keywords: keywords, additional_properties: struct)
    end
# Serialize an instance of CatalogQueryText to a JSON object
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
      obj.keywords.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
    end
  end
end