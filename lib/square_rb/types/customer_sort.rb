# frozen_string_literal: true
require_relative "customer_sort_field"
require_relative "sort_order"
require "ostruct"
require "json"

module SquareApiClient
# Represents the sorting criteria in a [search query](entity:CustomerQuery) that
#  defines how to sort
#  customer profiles returned in
#  [SearchCustomers](api-endpoint:Customers-SearchCustomers) results.
  class CustomerSort
  # @return [SquareApiClient::CustomerSortField] Indicates the fields to use as the sort key, which is either the default set of
#  fields or `created_at`.
#  The default value is `DEFAULT`.
#  See [CustomerSortField](#type-customersortfield) for possible values
    attr_reader :field
  # @return [SquareApiClient::SortOrder] Indicates the order in which results should be sorted based on the
#  sort field value. Strings use standard alphabetic comparison
#  to determine order. Strings representing numbers are sorted as strings.
#  The default value is `ASC`.
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param field [SquareApiClient::CustomerSortField] Indicates the fields to use as the sort key, which is either the default set of
#  fields or `created_at`.
#  The default value is `DEFAULT`.
#  See [CustomerSortField](#type-customersortfield) for possible values
    # @param order [SquareApiClient::SortOrder] Indicates the order in which results should be sorted based on the
#  sort field value. Strings use standard alphabetic comparison
#  to determine order. Strings representing numbers are sorted as strings.
#  The default value is `ASC`.
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomerSort]
    def initialize(field: OMIT, order: OMIT, additional_properties: nil)
      @field = field if field != OMIT
      @order = order if order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "field": field, "order": order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerSort
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomerSort]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      field = parsed_json["field"]
      order = parsed_json["order"]
      new(
        field: field,
        order: order,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerSort to a JSON object
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
      obj.field&.is_a?(SquareApiClient::CustomerSortField) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
      obj.order&.is_a?(SquareApiClient::SortOrder) != false || raise("Passed value for field obj.order is not the expected type, validation failed.")
    end
  end
end