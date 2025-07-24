# frozen_string_literal: true
require_relative "customer_filter"
require_relative "customer_sort"
require "ostruct"
require "json"

module SquareApiClient
# Represents filtering and sorting criteria for a
#  [SearchCustomers](api-endpoint:Customers-SearchCustomers) request.
  class CustomerQuery
  # @return [SquareApiClient::CustomerFilter] The filtering criteria for the search query. A query can contain multiple
#  filters in any combination.
#  Multiple filters are combined as `AND` statements.
#  __Note:__ Combining multiple filters as `OR` statements is not supported.
#  Instead, send multiple single-filter
#  searches and join the result sets.
    attr_reader :filter
  # @return [SquareApiClient::CustomerSort] Sorting criteria for query results. The default behavior is to sort
#  customers alphabetically by `given_name` and `family_name`.
    attr_reader :sort
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [SquareApiClient::CustomerFilter] The filtering criteria for the search query. A query can contain multiple
#  filters in any combination.
#  Multiple filters are combined as `AND` statements.
#  __Note:__ Combining multiple filters as `OR` statements is not supported.
#  Instead, send multiple single-filter
#  searches and join the result sets.
    # @param sort [SquareApiClient::CustomerSort] Sorting criteria for query results. The default behavior is to sort
#  customers alphabetically by `given_name` and `family_name`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomerQuery]
    def initialize(filter: OMIT, sort: OMIT, additional_properties: nil)
      @filter = filter if filter != OMIT
      @sort = sort if sort != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter, "sort": sort }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerQuery
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomerQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = SquareApiClient::CustomerFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      unless parsed_json["sort"].nil?
        sort = parsed_json["sort"].to_json
        sort = SquareApiClient::CustomerSort.from_json(json_object: sort)
      else
        sort = nil
      end
      new(
        filter: filter,
        sort: sort,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerQuery to a JSON object
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
      obj.filter.nil? || SquareApiClient::CustomerFilter.validate_raw(obj: obj.filter)
      obj.sort.nil? || SquareApiClient::CustomerSort.validate_raw(obj: obj.sort)
    end
  end
end