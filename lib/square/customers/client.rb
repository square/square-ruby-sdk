# frozen_string_literal: true
require_relative "../../requests"
require_relative "custom_attribute_definitions/client"
require_relative "groups/client"
require_relative "segments/client"
require_relative "cards/client"
require_relative "custom_attributes/client"
require_relative "../types/customer_sort_field"
require_relative "../types/sort_order"
require_relative "../types/list_customers_response"
require_relative "../types/address"
require_relative "../types/customer_tax_ids"
require_relative "../types/create_customer_response"
require_relative "../types/bulk_create_customers_response"
require_relative "../types/bulk_delete_customers_response"
require_relative "../types/bulk_retrieve_customers_response"
require_relative "../types/bulk_update_customers_response"
require_relative "../types/customer_query"
require_relative "../types/search_customers_response"
require_relative "../types/get_customer_response"
require_relative "../types/update_customer_response"
require_relative "../types/delete_customer_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class CustomersClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Customers::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [SquareApiClient::Customers::GroupsClient] 
    attr_reader :groups
  # @return [SquareApiClient::Customers::SegmentsClient] 
    attr_reader :segments
  # @return [SquareApiClient::Customers::CardsClient] 
    attr_reader :cards
  # @return [SquareApiClient::Customers::CustomAttributesClient] 
    attr_reader :custom_attributes


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::CustomersClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = SquareApiClient::Customers::CustomAttributeDefinitionsClient.new(request_client: request_client)
      @groups = SquareApiClient::Customers::GroupsClient.new(request_client: request_client)
      @segments = SquareApiClient::Customers::SegmentsClient.new(request_client: request_client)
      @cards = SquareApiClient::Customers::CardsClient.new(request_client: request_client)
      @custom_attributes = SquareApiClient::Customers::CustomAttributesClient.new(request_client: request_client)
    end
# Lists customer profiles associated with a Square account.
#  Under normal operating conditions, newly created or updated customer profiles
#  become available
#  for the listing operation in well under 30 seconds. Occasionally, propagation of
#  the new or updated
#  profiles can take closer to one minute or longer, especially during network
#  incidents and outages.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the specified limit is less than 1 or greater than 100, Square returns a `400
#  VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 100.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param sort_field [SquareApiClient::CustomerSortField] Indicates how customers should be sorted.
#  The default value is `DEFAULT`.
    # @param sort_order [SquareApiClient::SortOrder] Indicates whether customers should be sorted in ascending (`ASC`) or
#  descending (`DESC`) order.
#  The default value is `ASC`.
    # @param count [Boolean] Indicates whether to return the total count of customers in the `count` field of
#  the response.
#  The default value is `false`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.list
    def list(cursor: nil, limit: nil, sort_field: nil, sort_order: nil, count: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit, "sort_field": sort_field, "sort_order": sort_order, "count": count }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers"
end
      SquareApiClient::ListCustomersResponse.from_json(json_object: response.body)
    end
# Creates a new customer for a business.
#  You must provide at least one of the following values in your request to this
#  endpoint:
#  - `given_name`
#  - `family_name`
#  - `company_name`
#  - `email_address`
#  - `phone_number`
    #
    # @param idempotency_key [String] The idempotency key for the request.	For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param given_name [String] The given name (that is, the first name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param family_name [String] The family name (that is, the last name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param company_name [String] A business name associated with the customer profile.
#  The maximum length for this value is 500 characters.
    # @param nickname [String] A nickname for the customer profile.
#  The maximum length for this value is 100 characters.
    # @param email_address [String] The email address associated with the customer profile.
#  The maximum length for this value is 254 characters.
    # @param address [Hash] The physical address associated with the customer profile. For maximum length
#  constraints, see
#  [Customer
#  s://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
#  The `first_name` and `last_name` fields are ignored if they are present in the
#  request.Request of type SquareApiClient::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param phone_number [String] The phone number associated with the customer profile. The phone number must be
#  valid and can contain
#  9–16 digits, with an optional `+` prefix and country code. For more information,
#  see
#  [Customer phone
#  eveloper.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    # @param reference_id [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
#  The maximum length for this value is 100 characters.
    # @param note [String] A custom note associated with the customer profile.
    # @param birthday [String] The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD`
#  format. For example,
#  specify `1998-09-21` for September 21, 1998, or `09-21` for September 21.
#  Birthdays are returned in `YYYY-MM-DD`
#  format, where `YYYY` is the specified birth year or `0000` if a birth year is
#  not specified.
    # @param tax_ids [Hash] The tax ID associated with the customer profile. This field is available only
#  for customers of sellers
#  in EU countries or the United Kingdom. For more information,
#  see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).Request of type SquareApiClient::CustomerTaxIds, as a Hash
    #   * :eu_vat (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.create(
#    given_name: "Amelia",
#    family_name: "Earhart",
#    email_address: "Amelia.Earhart@example.com",
#    address: { address_line_1: "500 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US },
#    phone_number: "+1-212-555-4240",
#    reference_id: "YOUR_REFERENCE_ID",
#    note: "a customer"
#  )
    def create(idempotency_key: nil, given_name: nil, family_name: nil, company_name: nil, nickname: nil, email_address: nil, address: nil, phone_number: nil, reference_id: nil, note: nil, birthday: nil, tax_ids: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, given_name: given_name, family_name: family_name, company_name: company_name, nickname: nickname, email_address: email_address, address: address, phone_number: phone_number, reference_id: reference_id, note: note, birthday: birthday, tax_ids: tax_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers"
end
      SquareApiClient::CreateCustomerResponse.from_json(json_object: response.body)
    end
# Creates multiple [customer profiles](entity:Customer) for a business.
#  This endpoint takes a map of individual create requests and returns a map of
#  responses.
#  You must provide at least one of the following values in each create request:
#  - `given_name`
#  - `family_name`
#  - `company_name`
#  - `email_address`
#  - `phone_number`
    #
    # @param customers [Hash{String => SquareApiClient::BulkCreateCustomerData}] A map of 1 to 100 individual create requests, represented by `idempotency key: {
#  customer data }`
#  key-value pairs.
#  Each key is an [idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  that uniquely identifies the create request. Each value contains the customer
#  data used to create the
#  customer profile.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkCreateCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.batch_create(customers: { "8bb76c4f-e35d-4c5b-90de-1194cd9179f0": { given_name: "Amelia", family_name: "Earhart", email_address: "Amelia.Earhart@example.com", address: { address_line_1: "500 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, phone_number: "+1-212-555-4240", reference_id: "YOUR_REFERENCE_ID", note: "a customer" }, "d1689f23-b25d-4932-b2f0-aed00f5e2029": { given_name: "Marie", family_name: "Curie", email_address: "Marie.Curie@example.com", address: { address_line_1: "500 Electric Ave", address_line_2: "Suite 601", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, phone_number: "+1-212-444-4240", reference_id: "YOUR_REFERENCE_ID", note: "another customer" } })
    def batch_create(customers:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customers: customers }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-create"
end
      SquareApiClient::BulkCreateCustomersResponse.from_json(json_object: response.body)
    end
# Deletes multiple customer profiles.
#  The endpoint takes a list of customer IDs and returns a map of responses.
    #
    # @param customer_ids [Array<String>] The IDs of the [customer profiles](entity:Customer) to delete.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkDeleteCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.bulk_delete_customers(customer_ids: ["8DDA5NZVBZFGAX0V3HPF81HHE0", "N18CPRVXR5214XPBBA6BZQWF3C", "2GYD7WNXF7BJZW1PMGNXZ3Y8M8"])
    def bulk_delete_customers(customer_ids:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customer_ids: customer_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-delete"
end
      SquareApiClient::BulkDeleteCustomersResponse.from_json(json_object: response.body)
    end
# Retrieves multiple customer profiles.
#  This endpoint takes a list of customer IDs and returns a map of responses.
    #
    # @param customer_ids [Array<String>] The IDs of the [customer profiles](entity:Customer) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkRetrieveCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.bulk_retrieve_customers(customer_ids: ["8DDA5NZVBZFGAX0V3HPF81HHE0", "N18CPRVXR5214XPBBA6BZQWF3C", "2GYD7WNXF7BJZW1PMGNXZ3Y8M8"])
    def bulk_retrieve_customers(customer_ids:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customer_ids: customer_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-retrieve"
end
      SquareApiClient::BulkRetrieveCustomersResponse.from_json(json_object: response.body)
    end
# Updates multiple customer profiles.
#  This endpoint takes a map of individual update requests and returns a map of
#  responses.
    #
    # @param customers [Hash{String => SquareApiClient::BulkUpdateCustomerData}] A map of 1 to 100 individual update requests, represented by `customer ID: {
#  customer data }`
#  key-value pairs.
#  Each key is the ID of the [customer profile](entity:Customer) to update. To
#  update a customer profile
#  that was created by merging existing profiles, provide the ID of the newly
#  created profile.
#  Each value contains the updated customer data. Only new or changed fields are
#  required. To add or
#  update a field, specify the new value. To remove a field, specify `null`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkUpdateCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.bulk_update_customers(customers: { "8DDA5NZVBZFGAX0V3HPF81HHE0": { email_address: "New.Amelia.Earhart@example.com", note: "updated customer note", version: 2 }, "N18CPRVXR5214XPBBA6BZQWF3C": { given_name: "Marie", family_name: "Curie", version: 0 } })
    def bulk_update_customers(customers:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customers: customers }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-update"
end
      SquareApiClient::BulkUpdateCustomersResponse.from_json(json_object: response.body)
    end
# Searches the customer profiles associated with a Square account using one or
#  more supported query filters.
#  Calling `SearchCustomers` without any explicit query filter returns all
#  customer profiles ordered alphabetically based on `given_name` and
#  `family_name`.
#  Under normal operating conditions, newly created or updated customer profiles
#  become available
#  for the search operation in well under 30 seconds. Occasionally, propagation of
#  the new or updated
#  profiles can take closer to one minute or longer, especially during network
#  incidents and outages.
    #
    # @param cursor [String] Include the pagination cursor in subsequent calls to this endpoint to retrieve
#  the next set of results associated with the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Long] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the specified limit is invalid, Square returns a `400 VALUE_TOO_LOW` or `400
#  VALUE_TOO_HIGH` error. The default value is 100.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param query [Hash] The filtering and sorting criteria for the search request. If a query is not
#  specified,
#  Square returns all customer profiles ordered alphabetically by `given_name` and
#  `family_name`.Request of type SquareApiClient::CustomerQuery, as a Hash
    #   * :filter (Hash)
    #     * :creation_source (Hash)
    #       * :values (Array<SquareApiClient::CustomerCreationSource>) 
    #       * :rule (SquareApiClient::CustomerInclusionExclusion) 
    #     * :created_at (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :updated_at (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :email_address (Hash)
    #       * :exact (String) 
    #       * :fuzzy (String) 
    #     * :phone_number (Hash)
    #       * :exact (String) 
    #       * :fuzzy (String) 
    #     * :reference_id (Hash)
    #       * :exact (String) 
    #       * :fuzzy (String) 
    #     * :group_ids (Hash)
    #       * :all (Array<String>) 
    #       * :any (Array<String>) 
    #       * :none (Array<String>) 
    #     * :custom_attribute (Hash)
    #       * :filters (Array<SquareApiClient::CustomerCustomAttributeFilter>) 
    #     * :segment_ids (Hash)
    #       * :all (Array<String>) 
    #       * :any (Array<String>) 
    #       * :none (Array<String>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::CustomerSortField) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param count [Boolean] Indicates whether to return the total count of matching customers in the `count`
#  field of the response.
#  The default value is `false`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.search(limit: 2, query: { filter: { creation_source: { values: [THIRD_PARTY], rule: INCLUDE }, created_at: { start_at: "2018-01-01T00:00:00-00:00", end_at: "2018-02-01T00:00:00-00:00" }, email_address: { fuzzy: "example.com" }, group_ids: { all: ["545AXB44B4XXWMVQ4W8SBT3HHF"] } }, sort: { field: CREATED_AT, order: ASC } })
    def search(cursor: nil, limit: nil, query: nil, count: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, limit: limit, query: query, count: count }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/search"
end
      SquareApiClient::SearchCustomersResponse.from_json(json_object: response.body)
    end
# Returns details for a single customer.
    #
    # @param customer_id [String] The ID of the customer to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.get(customer_id: "customer_id")
    def get(customer_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}"
end
      SquareApiClient::GetCustomerResponse.from_json(json_object: response.body)
    end
# Updates a customer profile. This endpoint supports sparse updates, so only new
#  or changed fields are required in the request.
#  To add or update a field, specify the new value. To remove a field, specify
#  `null`.
#  To update a customer profile that was created by merging existing profiles, you
#  must use the ID of the newly created profile.
    #
    # @param customer_id [String] The ID of the customer to update.
    # @param given_name [String] The given name (that is, the first name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param family_name [String] The family name (that is, the last name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param company_name [String] A business name associated with the customer profile.
#  The maximum length for this value is 500 characters.
    # @param nickname [String] A nickname for the customer profile.
#  The maximum length for this value is 100 characters.
    # @param email_address [String] The email address associated with the customer profile.
#  The maximum length for this value is 254 characters.
    # @param address [Hash] The physical address associated with the customer profile. Only new or changed
#  fields are required in the request.
#  For maximum length constraints, see [Customer
#  s://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
#  The `first_name` and `last_name` fields are ignored if they are present in the
#  request.Request of type SquareApiClient::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param phone_number [String] The phone number associated with the customer profile. The phone number must be
#  valid and can contain
#  9–16 digits, with an optional `+` prefix and country code. For more information,
#  see
#  [Customer phone
#  eveloper.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    # @param reference_id [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
#  The maximum length for this value is 100 characters.
    # @param note [String] A custom note associated with the customer profile.
    # @param birthday [String] The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD`
#  format. For example,
#  specify `1998-09-21` for September 21, 1998, or `09-21` for September 21.
#  Birthdays are returned in `YYYY-MM-DD`
#  format, where `YYYY` is the specified birth year or `0000` if a birth year is
#  not specified.
    # @param version [Long] The current version of the customer profile.
#  As a best practice, you should include this field to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control. For more information, see [Update a customer
#  reup.com/docs/customers-api/use-the-api/keep-records#update-a-customer-profile).
    # @param tax_ids [Hash] The tax ID associated with the customer profile. This field is available only
#  for customers of sellers
#  in EU countries or the United Kingdom. For more information,
#  see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).Request of type SquareApiClient::CustomerTaxIds, as a Hash
    #   * :eu_vat (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.update(
#    customer_id: "customer_id",
#    email_address: "New.Amelia.Earhart@example.com",
#    note: "updated customer note",
#    version: 2
#  )
    def update(customer_id:, given_name: nil, family_name: nil, company_name: nil, nickname: nil, email_address: nil, address: nil, phone_number: nil, reference_id: nil, note: nil, birthday: nil, version: nil, tax_ids: nil, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), given_name: given_name, family_name: family_name, company_name: company_name, nickname: nickname, email_address: email_address, address: address, phone_number: phone_number, reference_id: reference_id, note: note, birthday: birthday, version: version, tax_ids: tax_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}"
end
      SquareApiClient::UpdateCustomerResponse.from_json(json_object: response.body)
    end
# Deletes a customer profile from a business.
#  To delete a customer profile that was created by merging existing profiles, you
#  must use the ID of the newly created profile.
    #
    # @param customer_id [String] The ID of the customer to delete.
    # @param version [Long] The current version of the customer profile.
#  As a best practice, you should include this parameter to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control.  For more information, see [Delete a customer
#  uareup.com/docs/customers-api/use-the-api/keep-records#delete-customer-profile).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.delete(customer_id: "customer_id")
    def delete(customer_id:, version: nil, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}"
end
      SquareApiClient::DeleteCustomerResponse.from_json(json_object: response.body)
    end
  end
  class AsyncCustomersClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Customers::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [SquareApiClient::Customers::GroupsClient] 
    attr_reader :groups
  # @return [SquareApiClient::Customers::SegmentsClient] 
    attr_reader :segments
  # @return [SquareApiClient::Customers::CardsClient] 
    attr_reader :cards
  # @return [SquareApiClient::Customers::CustomAttributesClient] 
    attr_reader :custom_attributes


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncCustomersClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = SquareApiClient::Customers::AsyncCustomAttributeDefinitionsClient.new(request_client: request_client)
      @groups = SquareApiClient::Customers::AsyncGroupsClient.new(request_client: request_client)
      @segments = SquareApiClient::Customers::AsyncSegmentsClient.new(request_client: request_client)
      @cards = SquareApiClient::Customers::AsyncCardsClient.new(request_client: request_client)
      @custom_attributes = SquareApiClient::Customers::AsyncCustomAttributesClient.new(request_client: request_client)
    end
# Lists customer profiles associated with a Square account.
#  Under normal operating conditions, newly created or updated customer profiles
#  become available
#  for the listing operation in well under 30 seconds. Occasionally, propagation of
#  the new or updated
#  profiles can take closer to one minute or longer, especially during network
#  incidents and outages.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the specified limit is less than 1 or greater than 100, Square returns a `400
#  VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 100.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param sort_field [SquareApiClient::CustomerSortField] Indicates how customers should be sorted.
#  The default value is `DEFAULT`.
    # @param sort_order [SquareApiClient::SortOrder] Indicates whether customers should be sorted in ascending (`ASC`) or
#  descending (`DESC`) order.
#  The default value is `ASC`.
    # @param count [Boolean] Indicates whether to return the total count of customers in the `count` field of
#  the response.
#  The default value is `false`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.list
    def list(cursor: nil, limit: nil, sort_field: nil, sort_order: nil, count: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit, "sort_field": sort_field, "sort_order": sort_order, "count": count }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers"
end
        SquareApiClient::ListCustomersResponse.from_json(json_object: response.body)
      end
    end
# Creates a new customer for a business.
#  You must provide at least one of the following values in your request to this
#  endpoint:
#  - `given_name`
#  - `family_name`
#  - `company_name`
#  - `email_address`
#  - `phone_number`
    #
    # @param idempotency_key [String] The idempotency key for the request.	For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param given_name [String] The given name (that is, the first name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param family_name [String] The family name (that is, the last name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param company_name [String] A business name associated with the customer profile.
#  The maximum length for this value is 500 characters.
    # @param nickname [String] A nickname for the customer profile.
#  The maximum length for this value is 100 characters.
    # @param email_address [String] The email address associated with the customer profile.
#  The maximum length for this value is 254 characters.
    # @param address [Hash] The physical address associated with the customer profile. For maximum length
#  constraints, see
#  [Customer
#  s://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
#  The `first_name` and `last_name` fields are ignored if they are present in the
#  request.Request of type SquareApiClient::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param phone_number [String] The phone number associated with the customer profile. The phone number must be
#  valid and can contain
#  9–16 digits, with an optional `+` prefix and country code. For more information,
#  see
#  [Customer phone
#  eveloper.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    # @param reference_id [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
#  The maximum length for this value is 100 characters.
    # @param note [String] A custom note associated with the customer profile.
    # @param birthday [String] The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD`
#  format. For example,
#  specify `1998-09-21` for September 21, 1998, or `09-21` for September 21.
#  Birthdays are returned in `YYYY-MM-DD`
#  format, where `YYYY` is the specified birth year or `0000` if a birth year is
#  not specified.
    # @param tax_ids [Hash] The tax ID associated with the customer profile. This field is available only
#  for customers of sellers
#  in EU countries or the United Kingdom. For more information,
#  see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).Request of type SquareApiClient::CustomerTaxIds, as a Hash
    #   * :eu_vat (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.create(
#    given_name: "Amelia",
#    family_name: "Earhart",
#    email_address: "Amelia.Earhart@example.com",
#    address: { address_line_1: "500 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US },
#    phone_number: "+1-212-555-4240",
#    reference_id: "YOUR_REFERENCE_ID",
#    note: "a customer"
#  )
    def create(idempotency_key: nil, given_name: nil, family_name: nil, company_name: nil, nickname: nil, email_address: nil, address: nil, phone_number: nil, reference_id: nil, note: nil, birthday: nil, tax_ids: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, given_name: given_name, family_name: family_name, company_name: company_name, nickname: nickname, email_address: email_address, address: address, phone_number: phone_number, reference_id: reference_id, note: note, birthday: birthday, tax_ids: tax_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers"
end
        SquareApiClient::CreateCustomerResponse.from_json(json_object: response.body)
      end
    end
# Creates multiple [customer profiles](entity:Customer) for a business.
#  This endpoint takes a map of individual create requests and returns a map of
#  responses.
#  You must provide at least one of the following values in each create request:
#  - `given_name`
#  - `family_name`
#  - `company_name`
#  - `email_address`
#  - `phone_number`
    #
    # @param customers [Hash{String => SquareApiClient::BulkCreateCustomerData}] A map of 1 to 100 individual create requests, represented by `idempotency key: {
#  customer data }`
#  key-value pairs.
#  Each key is an [idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  that uniquely identifies the create request. Each value contains the customer
#  data used to create the
#  customer profile.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkCreateCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.batch_create(customers: { "8bb76c4f-e35d-4c5b-90de-1194cd9179f0": { given_name: "Amelia", family_name: "Earhart", email_address: "Amelia.Earhart@example.com", address: { address_line_1: "500 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, phone_number: "+1-212-555-4240", reference_id: "YOUR_REFERENCE_ID", note: "a customer" }, "d1689f23-b25d-4932-b2f0-aed00f5e2029": { given_name: "Marie", family_name: "Curie", email_address: "Marie.Curie@example.com", address: { address_line_1: "500 Electric Ave", address_line_2: "Suite 601", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, phone_number: "+1-212-444-4240", reference_id: "YOUR_REFERENCE_ID", note: "another customer" } })
    def batch_create(customers:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customers: customers }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-create"
end
        SquareApiClient::BulkCreateCustomersResponse.from_json(json_object: response.body)
      end
    end
# Deletes multiple customer profiles.
#  The endpoint takes a list of customer IDs and returns a map of responses.
    #
    # @param customer_ids [Array<String>] The IDs of the [customer profiles](entity:Customer) to delete.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkDeleteCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.bulk_delete_customers(customer_ids: ["8DDA5NZVBZFGAX0V3HPF81HHE0", "N18CPRVXR5214XPBBA6BZQWF3C", "2GYD7WNXF7BJZW1PMGNXZ3Y8M8"])
    def bulk_delete_customers(customer_ids:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customer_ids: customer_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-delete"
end
        SquareApiClient::BulkDeleteCustomersResponse.from_json(json_object: response.body)
      end
    end
# Retrieves multiple customer profiles.
#  This endpoint takes a list of customer IDs and returns a map of responses.
    #
    # @param customer_ids [Array<String>] The IDs of the [customer profiles](entity:Customer) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkRetrieveCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.bulk_retrieve_customers(customer_ids: ["8DDA5NZVBZFGAX0V3HPF81HHE0", "N18CPRVXR5214XPBBA6BZQWF3C", "2GYD7WNXF7BJZW1PMGNXZ3Y8M8"])
    def bulk_retrieve_customers(customer_ids:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customer_ids: customer_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-retrieve"
end
        SquareApiClient::BulkRetrieveCustomersResponse.from_json(json_object: response.body)
      end
    end
# Updates multiple customer profiles.
#  This endpoint takes a map of individual update requests and returns a map of
#  responses.
    #
    # @param customers [Hash{String => SquareApiClient::BulkUpdateCustomerData}] A map of 1 to 100 individual update requests, represented by `customer ID: {
#  customer data }`
#  key-value pairs.
#  Each key is the ID of the [customer profile](entity:Customer) to update. To
#  update a customer profile
#  that was created by merging existing profiles, provide the ID of the newly
#  created profile.
#  Each value contains the updated customer data. Only new or changed fields are
#  required. To add or
#  update a field, specify the new value. To remove a field, specify `null`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkUpdateCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.bulk_update_customers(customers: { "8DDA5NZVBZFGAX0V3HPF81HHE0": { email_address: "New.Amelia.Earhart@example.com", note: "updated customer note", version: 2 }, "N18CPRVXR5214XPBBA6BZQWF3C": { given_name: "Marie", family_name: "Curie", version: 0 } })
    def bulk_update_customers(customers:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), customers: customers }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/bulk-update"
end
        SquareApiClient::BulkUpdateCustomersResponse.from_json(json_object: response.body)
      end
    end
# Searches the customer profiles associated with a Square account using one or
#  more supported query filters.
#  Calling `SearchCustomers` without any explicit query filter returns all
#  customer profiles ordered alphabetically based on `given_name` and
#  `family_name`.
#  Under normal operating conditions, newly created or updated customer profiles
#  become available
#  for the search operation in well under 30 seconds. Occasionally, propagation of
#  the new or updated
#  profiles can take closer to one minute or longer, especially during network
#  incidents and outages.
    #
    # @param cursor [String] Include the pagination cursor in subsequent calls to this endpoint to retrieve
#  the next set of results associated with the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Long] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the specified limit is invalid, Square returns a `400 VALUE_TOO_LOW` or `400
#  VALUE_TOO_HIGH` error. The default value is 100.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param query [Hash] The filtering and sorting criteria for the search request. If a query is not
#  specified,
#  Square returns all customer profiles ordered alphabetically by `given_name` and
#  `family_name`.Request of type SquareApiClient::CustomerQuery, as a Hash
    #   * :filter (Hash)
    #     * :creation_source (Hash)
    #       * :values (Array<SquareApiClient::CustomerCreationSource>) 
    #       * :rule (SquareApiClient::CustomerInclusionExclusion) 
    #     * :created_at (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :updated_at (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :email_address (Hash)
    #       * :exact (String) 
    #       * :fuzzy (String) 
    #     * :phone_number (Hash)
    #       * :exact (String) 
    #       * :fuzzy (String) 
    #     * :reference_id (Hash)
    #       * :exact (String) 
    #       * :fuzzy (String) 
    #     * :group_ids (Hash)
    #       * :all (Array<String>) 
    #       * :any (Array<String>) 
    #       * :none (Array<String>) 
    #     * :custom_attribute (Hash)
    #       * :filters (Array<SquareApiClient::CustomerCustomAttributeFilter>) 
    #     * :segment_ids (Hash)
    #       * :all (Array<String>) 
    #       * :any (Array<String>) 
    #       * :none (Array<String>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::CustomerSortField) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param count [Boolean] Indicates whether to return the total count of matching customers in the `count`
#  field of the response.
#  The default value is `false`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchCustomersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.search(limit: 2, query: { filter: { creation_source: { values: [THIRD_PARTY], rule: INCLUDE }, created_at: { start_at: "2018-01-01T00:00:00-00:00", end_at: "2018-02-01T00:00:00-00:00" }, email_address: { fuzzy: "example.com" }, group_ids: { all: ["545AXB44B4XXWMVQ4W8SBT3HHF"] } }, sort: { field: CREATED_AT, order: ASC } })
    def search(cursor: nil, limit: nil, query: nil, count: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, limit: limit, query: query, count: count }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/search"
end
        SquareApiClient::SearchCustomersResponse.from_json(json_object: response.body)
      end
    end
# Returns details for a single customer.
    #
    # @param customer_id [String] The ID of the customer to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.get(customer_id: "customer_id")
    def get(customer_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}"
end
        SquareApiClient::GetCustomerResponse.from_json(json_object: response.body)
      end
    end
# Updates a customer profile. This endpoint supports sparse updates, so only new
#  or changed fields are required in the request.
#  To add or update a field, specify the new value. To remove a field, specify
#  `null`.
#  To update a customer profile that was created by merging existing profiles, you
#  must use the ID of the newly created profile.
    #
    # @param customer_id [String] The ID of the customer to update.
    # @param given_name [String] The given name (that is, the first name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param family_name [String] The family name (that is, the last name) associated with the customer profile.
#  The maximum length for this value is 300 characters.
    # @param company_name [String] A business name associated with the customer profile.
#  The maximum length for this value is 500 characters.
    # @param nickname [String] A nickname for the customer profile.
#  The maximum length for this value is 100 characters.
    # @param email_address [String] The email address associated with the customer profile.
#  The maximum length for this value is 254 characters.
    # @param address [Hash] The physical address associated with the customer profile. Only new or changed
#  fields are required in the request.
#  For maximum length constraints, see [Customer
#  s://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
#  The `first_name` and `last_name` fields are ignored if they are present in the
#  request.Request of type SquareApiClient::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param phone_number [String] The phone number associated with the customer profile. The phone number must be
#  valid and can contain
#  9–16 digits, with an optional `+` prefix and country code. For more information,
#  see
#  [Customer phone
#  eveloper.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    # @param reference_id [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
#  The maximum length for this value is 100 characters.
    # @param note [String] A custom note associated with the customer profile.
    # @param birthday [String] The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD`
#  format. For example,
#  specify `1998-09-21` for September 21, 1998, or `09-21` for September 21.
#  Birthdays are returned in `YYYY-MM-DD`
#  format, where `YYYY` is the specified birth year or `0000` if a birth year is
#  not specified.
    # @param version [Long] The current version of the customer profile.
#  As a best practice, you should include this field to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control. For more information, see [Update a customer
#  reup.com/docs/customers-api/use-the-api/keep-records#update-a-customer-profile).
    # @param tax_ids [Hash] The tax ID associated with the customer profile. This field is available only
#  for customers of sellers
#  in EU countries or the United Kingdom. For more information,
#  see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).Request of type SquareApiClient::CustomerTaxIds, as a Hash
    #   * :eu_vat (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.update(
#    customer_id: "customer_id",
#    email_address: "New.Amelia.Earhart@example.com",
#    note: "updated customer note",
#    version: 2
#  )
    def update(customer_id:, given_name: nil, family_name: nil, company_name: nil, nickname: nil, email_address: nil, address: nil, phone_number: nil, reference_id: nil, note: nil, birthday: nil, version: nil, tax_ids: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), given_name: given_name, family_name: family_name, company_name: company_name, nickname: nickname, email_address: email_address, address: address, phone_number: phone_number, reference_id: reference_id, note: note, birthday: birthday, version: version, tax_ids: tax_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}"
end
        SquareApiClient::UpdateCustomerResponse.from_json(json_object: response.body)
      end
    end
# Deletes a customer profile from a business.
#  To delete a customer profile that was created by merging existing profiles, you
#  must use the ID of the newly created profile.
    #
    # @param customer_id [String] The ID of the customer to delete.
    # @param version [Long] The current version of the customer profile.
#  As a best practice, you should include this parameter to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control.  For more information, see [Delete a customer
#  uareup.com/docs/customers-api/use-the-api/keep-records#delete-customer-profile).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteCustomerResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.delete(customer_id: "customer_id")
    def delete(customer_id:, version: nil, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/#{customer_id}"
end
        SquareApiClient::DeleteCustomerResponse.from_json(json_object: response.body)
      end
    end
  end
end