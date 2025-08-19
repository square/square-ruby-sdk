# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/batch_create_vendors_response"
require_relative "../types/batch_get_vendors_response"
require_relative "../types/batch_update_vendors_response"
require_relative "../types/vendor"
require_relative "../types/create_vendor_response"
require_relative "../types/search_vendors_request_filter"
require_relative "../types/search_vendors_request_sort"
require_relative "../types/search_vendors_response"
require_relative "../types/get_vendor_response"
require_relative "../types/update_vendor_request"
require_relative "../types/update_vendor_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class VendorsClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::VendorsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Creates one or more [Vendor](entity:Vendor) objects to represent suppliers to a
#  seller.
    #
    # @param vendors [Hash{String => SquareApiClient::Vendor}] Specifies a set of new [Vendor](entity:Vendor) objects as represented by a
#  collection of idempotency-key/`Vendor`-object pairs.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchCreateVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.batch_create(vendors: { "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe": { name: "Joe's Fresh Seafood", address: { address_line_1: "505 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, contacts: [{ name: "Joe Burrow", email_address: "joe@joesfreshseafood.com", phone_number: "1-212-555-4250", ordinal: 1 }], account_number: "4025391", note: "a vendor" } })
    def batch_create(vendors:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), vendors: vendors }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/bulk-create"
end
      SquareApiClient::BatchCreateVendorsResponse.from_json(json_object: response.body)
    end
# Retrieves one or more vendors of specified [Vendor](entity:Vendor) IDs.
    #
    # @param vendor_ids [Array<String>] IDs of the [Vendor](entity:Vendor) objects to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.batch_get(vendor_ids: ["INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4"])
    def batch_get(vendor_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), vendor_ids: vendor_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/bulk-retrieve"
end
      SquareApiClient::BatchGetVendorsResponse.from_json(json_object: response.body)
    end
# Updates one or more of existing [Vendor](entity:Vendor) objects as suppliers to
#  a seller.
    #
    # @param vendors [Hash{String => SquareApiClient::UpdateVendorRequest}] A set of [UpdateVendorRequest](entity:UpdateVendorRequest) objects encapsulating
#  to-be-updated [Vendor](entity:Vendor)
#  objects. The set is represented by  a collection of
#  `Vendor`-ID/`UpdateVendorRequest`-object pairs.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchUpdateVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.batch_update(vendors: { "FMCYHBWT1TPL8MFH52PBMEN92A": { vendor: {  } }, "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4": { vendor: {  } } })
    def batch_update(vendors:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), vendors: vendors }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/bulk-update"
end
      SquareApiClient::BatchUpdateVendorsResponse.from_json(json_object: response.body)
    end
# Creates a single [Vendor](entity:Vendor) object to represent a supplier to a
#  seller.
    #
    # @param idempotency_key [String] A client-supplied, universally unique identifier (UUID) to make this
#  [CreateVendor](api-endpoint:Vendors-CreateVendor) call idempotent.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  in the
#  [API Development 101](https://developer.squareup.com/docs/buildbasics) section
#  for more
#  information.
    # @param vendor [Hash] The requested [Vendor](entity:Vendor) to be created.Request of type SquareApiClient::Vendor, as a Hash
    #   * :id (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :name (String) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (SquareApiClient::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :contacts (Array<SquareApiClient::VendorContact>) 
    #   * :account_number (String) 
    #   * :note (String) 
    #   * :version (Integer) 
    #   * :status (SquareApiClient::VendorStatus) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateVendorResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.create(idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", vendor: { name: "Joe's Fresh Seafood", address: { address_line_1: "505 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, contacts: [{ name: "Joe Burrow", email_address: "joe@joesfreshseafood.com", phone_number: "1-212-555-4250", ordinal: 1 }], account_number: "4025391", note: "a vendor" })
    def create(idempotency_key:, vendor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, vendor: vendor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/create"
end
      SquareApiClient::CreateVendorResponse.from_json(json_object: response.body)
    end
# Searches for vendors using a filter against supported [Vendor](entity:Vendor)
#  properties and a supported sorter.
    #
    # @param filter [Hash] Specifies a filter used to search for vendors.Request of type SquareApiClient::SearchVendorsRequestFilter, as a Hash
    #   * :name (Array<String>) 
    #   * :status (Array<SquareApiClient::VendorStatus>) 
    # @param sort [Hash] Specifies a sorter used to sort the returned vendors.Request of type SquareApiClient::SearchVendorsRequestSort, as a Hash
    #   * :field (SquareApiClient::SearchVendorsRequestSortField) 
    #   * :order (SquareApiClient::SortOrder) 
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.search
    def search(filter: nil, sort: nil, cursor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), filter: filter, sort: sort, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/search"
end
      SquareApiClient::SearchVendorsResponse.from_json(json_object: response.body)
    end
# Retrieves the vendor of a specified [Vendor](entity:Vendor) ID.
    #
    # @param vendor_id [String] ID of the [Vendor](entity:Vendor) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetVendorResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.get(vendor_id: "vendor_id")
    def get(vendor_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/#{vendor_id}"
end
      SquareApiClient::GetVendorResponse.from_json(json_object: response.body)
    end
# Updates an existing [Vendor](entity:Vendor) object as a supplier to a seller.
    #
    # @param vendor_id [String] ID of the [Vendor](entity:Vendor) to retrieve.
    # @param request [Hash] Request of type SquareApiClient::UpdateVendorRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :vendor (Hash)
    #     * :id (String) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :name (String) 
    #     * :address (Hash)
    #       * :address_line_1 (String) 
    #       * :address_line_2 (String) 
    #       * :address_line_3 (String) 
    #       * :locality (String) 
    #       * :sublocality (String) 
    #       * :sublocality_2 (String) 
    #       * :sublocality_3 (String) 
    #       * :administrative_district_level_1 (String) 
    #       * :administrative_district_level_2 (String) 
    #       * :administrative_district_level_3 (String) 
    #       * :postal_code (String) 
    #       * :country (SquareApiClient::Country) 
    #       * :first_name (String) 
    #       * :last_name (String) 
    #     * :contacts (Array<SquareApiClient::VendorContact>) 
    #     * :account_number (String) 
    #     * :note (String) 
    #     * :version (Integer) 
    #     * :status (SquareApiClient::VendorStatus) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateVendorResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.update(vendor_id: "vendor_id", request: { idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", vendor: { id: "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4", name: "Jack's Chicken Shack", version: 1, status: ACTIVE } })
    def update(vendor_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/#{vendor_id}"
end
      SquareApiClient::UpdateVendorResponse.from_json(json_object: response.body)
    end
  end
  class AsyncVendorsClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncVendorsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Creates one or more [Vendor](entity:Vendor) objects to represent suppliers to a
#  seller.
    #
    # @param vendors [Hash{String => SquareApiClient::Vendor}] Specifies a set of new [Vendor](entity:Vendor) objects as represented by a
#  collection of idempotency-key/`Vendor`-object pairs.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchCreateVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.batch_create(vendors: { "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe": { name: "Joe's Fresh Seafood", address: { address_line_1: "505 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, contacts: [{ name: "Joe Burrow", email_address: "joe@joesfreshseafood.com", phone_number: "1-212-555-4250", ordinal: 1 }], account_number: "4025391", note: "a vendor" } })
    def batch_create(vendors:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), vendors: vendors }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/bulk-create"
end
        SquareApiClient::BatchCreateVendorsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves one or more vendors of specified [Vendor](entity:Vendor) IDs.
    #
    # @param vendor_ids [Array<String>] IDs of the [Vendor](entity:Vendor) objects to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.batch_get(vendor_ids: ["INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4"])
    def batch_get(vendor_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), vendor_ids: vendor_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/bulk-retrieve"
end
        SquareApiClient::BatchGetVendorsResponse.from_json(json_object: response.body)
      end
    end
# Updates one or more of existing [Vendor](entity:Vendor) objects as suppliers to
#  a seller.
    #
    # @param vendors [Hash{String => SquareApiClient::UpdateVendorRequest}] A set of [UpdateVendorRequest](entity:UpdateVendorRequest) objects encapsulating
#  to-be-updated [Vendor](entity:Vendor)
#  objects. The set is represented by  a collection of
#  `Vendor`-ID/`UpdateVendorRequest`-object pairs.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchUpdateVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.batch_update(vendors: { "FMCYHBWT1TPL8MFH52PBMEN92A": { vendor: {  } }, "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4": { vendor: {  } } })
    def batch_update(vendors:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), vendors: vendors }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/bulk-update"
end
        SquareApiClient::BatchUpdateVendorsResponse.from_json(json_object: response.body)
      end
    end
# Creates a single [Vendor](entity:Vendor) object to represent a supplier to a
#  seller.
    #
    # @param idempotency_key [String] A client-supplied, universally unique identifier (UUID) to make this
#  [CreateVendor](api-endpoint:Vendors-CreateVendor) call idempotent.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  in the
#  [API Development 101](https://developer.squareup.com/docs/buildbasics) section
#  for more
#  information.
    # @param vendor [Hash] The requested [Vendor](entity:Vendor) to be created.Request of type SquareApiClient::Vendor, as a Hash
    #   * :id (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :name (String) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (SquareApiClient::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :contacts (Array<SquareApiClient::VendorContact>) 
    #   * :account_number (String) 
    #   * :note (String) 
    #   * :version (Integer) 
    #   * :status (SquareApiClient::VendorStatus) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateVendorResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.create(idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", vendor: { name: "Joe's Fresh Seafood", address: { address_line_1: "505 Electric Ave", address_line_2: "Suite 600", locality: "New York", administrative_district_level_1: "NY", postal_code: "10003", country: US }, contacts: [{ name: "Joe Burrow", email_address: "joe@joesfreshseafood.com", phone_number: "1-212-555-4250", ordinal: 1 }], account_number: "4025391", note: "a vendor" })
    def create(idempotency_key:, vendor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, vendor: vendor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/create"
end
        SquareApiClient::CreateVendorResponse.from_json(json_object: response.body)
      end
    end
# Searches for vendors using a filter against supported [Vendor](entity:Vendor)
#  properties and a supported sorter.
    #
    # @param filter [Hash] Specifies a filter used to search for vendors.Request of type SquareApiClient::SearchVendorsRequestFilter, as a Hash
    #   * :name (Array<String>) 
    #   * :status (Array<SquareApiClient::VendorStatus>) 
    # @param sort [Hash] Specifies a sorter used to sort the returned vendors.Request of type SquareApiClient::SearchVendorsRequestSort, as a Hash
    #   * :field (SquareApiClient::SearchVendorsRequestSortField) 
    #   * :order (SquareApiClient::SortOrder) 
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchVendorsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.search
    def search(filter: nil, sort: nil, cursor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), filter: filter, sort: sort, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/search"
end
        SquareApiClient::SearchVendorsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves the vendor of a specified [Vendor](entity:Vendor) ID.
    #
    # @param vendor_id [String] ID of the [Vendor](entity:Vendor) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetVendorResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.get(vendor_id: "vendor_id")
    def get(vendor_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/#{vendor_id}"
end
        SquareApiClient::GetVendorResponse.from_json(json_object: response.body)
      end
    end
# Updates an existing [Vendor](entity:Vendor) object as a supplier to a seller.
    #
    # @param vendor_id [String] ID of the [Vendor](entity:Vendor) to retrieve.
    # @param request [Hash] Request of type SquareApiClient::UpdateVendorRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :vendor (Hash)
    #     * :id (String) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :name (String) 
    #     * :address (Hash)
    #       * :address_line_1 (String) 
    #       * :address_line_2 (String) 
    #       * :address_line_3 (String) 
    #       * :locality (String) 
    #       * :sublocality (String) 
    #       * :sublocality_2 (String) 
    #       * :sublocality_3 (String) 
    #       * :administrative_district_level_1 (String) 
    #       * :administrative_district_level_2 (String) 
    #       * :administrative_district_level_3 (String) 
    #       * :postal_code (String) 
    #       * :country (SquareApiClient::Country) 
    #       * :first_name (String) 
    #       * :last_name (String) 
    #     * :contacts (Array<SquareApiClient::VendorContact>) 
    #     * :account_number (String) 
    #     * :note (String) 
    #     * :version (Integer) 
    #     * :status (SquareApiClient::VendorStatus) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateVendorResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.vendors.update(vendor_id: "vendor_id", request: { idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", vendor: { id: "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4", name: "Jack's Chicken Shack", version: 1, status: ACTIVE } })
    def update(vendor_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/vendors/#{vendor_id}"
end
        SquareApiClient::UpdateVendorResponse.from_json(json_object: response.body)
      end
    end
  end
end