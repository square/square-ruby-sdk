# frozen_string_literal: true
require_relative "invoice_filter"
require_relative "invoice_sort"
require "ostruct"
require "json"

module square.rb
# Describes query criteria for searching invoices.
  class InvoiceQuery
  # @return [square.rb::InvoiceFilter] Query filters to apply in searching invoices.
#  For more information, see [Search for
#  r.squareup.com/docs/invoices-api/retrieve-list-search-invoices#search-invoices).
    attr_reader :filter
  # @return [square.rb::InvoiceSort] Describes the sort order for the search result.
    attr_reader :sort
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [square.rb::InvoiceFilter] Query filters to apply in searching invoices.
#  For more information, see [Search for
#  r.squareup.com/docs/invoices-api/retrieve-list-search-invoices#search-invoices).
    # @param sort [square.rb::InvoiceSort] Describes the sort order for the search result.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoiceQuery]
    def initialize(filter:, sort: OMIT, additional_properties: nil)
      @filter = filter
      @sort = sort if sort != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter, "sort": sort }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceQuery
    #
    # @param json_object [String] 
    # @return [square.rb::InvoiceQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = square.rb::InvoiceFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      unless parsed_json["sort"].nil?
        sort = parsed_json["sort"].to_json
        sort = square.rb::InvoiceSort.from_json(json_object: sort)
      else
        sort = nil
      end
      new(
        filter: filter,
        sort: sort,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceQuery to a JSON object
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
      square.rb::InvoiceFilter.validate_raw(obj: obj.filter)
      obj.sort.nil? || square.rb::InvoiceSort.validate_raw(obj: obj.sort)
    end
  end
end