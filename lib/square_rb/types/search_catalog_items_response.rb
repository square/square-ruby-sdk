# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require "ostruct"
require "json"

module SquareApiClient
# Defines the response body returned from the
#  [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint.
  class SearchCatalogItemsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::CatalogObject>] Returned items matching the specified query expressions.
    attr_reader :items
  # @return [String] Pagination token used in the next request to return more of the search result.
    attr_reader :cursor
  # @return [Array<String>] Ids of returned item variations matching the specified query expression.
    attr_reader :matched_variation_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param items [Array<SquareApiClient::CatalogObject>] Returned items matching the specified query expressions.
    # @param cursor [String] Pagination token used in the next request to return more of the search result.
    # @param matched_variation_ids [Array<String>] Ids of returned item variations matching the specified query expression.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchCatalogItemsResponse]
    def initialize(errors: OMIT, items: OMIT, cursor: OMIT, matched_variation_ids: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @items = items if items != OMIT
      @cursor = cursor if cursor != OMIT
      @matched_variation_ids = matched_variation_ids if matched_variation_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "items": items, "cursor": cursor, "matched_variation_ids": matched_variation_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchCatalogItemsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchCatalogItemsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      items = parsed_json["items"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogObject.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      matched_variation_ids = parsed_json["matched_variation_ids"]
      new(
        errors: errors,
        items: items,
        cursor: cursor,
        matched_variation_ids: matched_variation_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchCatalogItemsResponse to a JSON object
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
      obj.items&.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.matched_variation_ids&.is_a?(Array) != false || raise("Passed value for field obj.matched_variation_ids is not the expected type, validation failed.")
    end
  end
end