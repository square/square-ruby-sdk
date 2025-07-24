# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/get_inventory_adjustment_response"
require_relative "../types/batch_change_inventory_request"
require_relative "../types/batch_change_inventory_response"
require_relative "../types/batch_retrieve_inventory_changes_request"
require_relative "../types/batch_get_inventory_changes_response"
require_relative "../types/batch_get_inventory_counts_request"
require_relative "../types/batch_get_inventory_counts_response"
require_relative "../types/get_inventory_physical_count_response"
require_relative "../types/get_inventory_transfer_response"
require_relative "../types/get_inventory_count_response"
require_relative "../types/get_inventory_changes_response"
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
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class InventoryClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::InventoryClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Deprecated version of
#  RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdjustment)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param adjustment_id [String] ID of the [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryAdjustmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_get_adjustment(adjustment_id: "adjustment_id")
    def deprecated_get_adjustment(adjustment_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/adjustment/#{adjustment_id}"
end
      SquareApiClient::GetInventoryAdjustmentResponse.from_json(json_object: response.body)
    end
# Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
#  with the provided `adjustment_id`.
    #
    # @param adjustment_id [String] ID of the [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryAdjustmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get_adjustment(adjustment_id: "adjustment_id")
    def get_adjustment(adjustment_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/adjustments/#{adjustment_id}"
end
      SquareApiClient::GetInventoryAdjustmentResponse.from_json(json_object: response.body)
    end
# Deprecated version of
#  [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the
#  endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchChangeInventoryRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :changes (Array<SquareApiClient::InventoryChange>) 
    #   * :ignore_unchanged_counts (Boolean) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchChangeInventoryResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_batch_change(request: { idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", changes: [{ type: PHYSICAL_COUNT, physical_count: { reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92", catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI", state: IN_STOCK, location_id: "C6W5YS5QM06F5", quantity: "53", team_member_id: "LRK57NSQ5X7PUD05", occurred_at: "2016-11-16T22:25:24.878Z" } }], ignore_unchanged_counts: true })
    def deprecated_batch_change(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/batch-change"
end
      SquareApiClient::BatchChangeInventoryResponse.from_json(json_object: response.body)
    end
# Deprecated version of
#  hRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchRetrieveInventoryChangesRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :types (Array<SquareApiClient::InventoryChangeType>) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :updated_after (String) 
    #   * :updated_before (String) 
    #   * :cursor (String) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryChangesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_batch_get_changes(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["C6W5YS5QM06F5"], types: [PHYSICAL_COUNT], states: [IN_STOCK], updated_after: "2016-11-01T00:00:00.000Z", updated_before: "2016-12-01T00:00:00.000Z" })
    def deprecated_batch_get_changes(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/batch-retrieve-changes"
end
      SquareApiClient::BatchGetInventoryChangesResponse.from_json(json_object: response.body)
    end
# Deprecated version of
#  tchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchGetInventoryCountsRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :updated_after (String) 
    #   * :cursor (String) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryCountsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_batch_get_counts(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["59TNP9SA8VGDA"], updated_after: "2016-11-16T00:00:00.000Z" })
    def deprecated_batch_get_counts(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/batch-retrieve-counts"
end
      SquareApiClient::BatchGetInventoryCountsResponse.from_json(json_object: response.body)
    end
# Applies adjustments and counts to the provided item quantities.
#  On success: returns the current calculated counts for all objects
#  referenced in the request.
#  On failure: returns a list of related errors.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchChangeInventoryRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :changes (Array<SquareApiClient::InventoryChange>) 
    #   * :ignore_unchanged_counts (Boolean) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchChangeInventoryResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.batch_create_changes(request: { idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", changes: [{ type: PHYSICAL_COUNT, physical_count: { reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92", catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI", state: IN_STOCK, location_id: "C6W5YS5QM06F5", quantity: "53", team_member_id: "LRK57NSQ5X7PUD05", occurred_at: "2016-11-16T22:25:24.878Z" } }], ignore_unchanged_counts: true })
    def batch_create_changes(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/changes/batch-create"
end
      SquareApiClient::BatchChangeInventoryResponse.from_json(json_object: response.body)
    end
# Returns historical physical counts and adjustments based on the
#  provided filter criteria.
#  Results are paginated and sorted in ascending order according their
#  `occurred_at` timestamp (oldest first).
#  BatchRetrieveInventoryChanges is a catch-all query endpoint for queries
#  that cannot be handled by other, simpler endpoints.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchRetrieveInventoryChangesRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :types (Array<SquareApiClient::InventoryChangeType>) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :updated_after (String) 
    #   * :updated_before (String) 
    #   * :cursor (String) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryChangesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.batch_get_changes(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["C6W5YS5QM06F5"], types: [PHYSICAL_COUNT], states: [IN_STOCK], updated_after: "2016-11-01T00:00:00.000Z", updated_before: "2016-12-01T00:00:00.000Z" })
    def batch_get_changes(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/changes/batch-retrieve"
end
      SquareApiClient::BatchGetInventoryChangesResponse.from_json(json_object: response.body)
    end
# Returns current counts for the provided
#  [CatalogObject](entity:CatalogObject)s at the requested
#  [Location](entity:Location)s.
#  Results are paginated and sorted in descending order according to their
#  `calculated_at` timestamp (newest first).
#  When `updated_after` is specified, only counts that have changed since that
#  time (based on the server timestamp for the most recent change) are
#  returned. This allows clients to perform a "sync" operation, for example
#  in response to receiving a Webhook notification.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchGetInventoryCountsRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :updated_after (String) 
    #   * :cursor (String) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryCountsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.batch_get_counts(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["59TNP9SA8VGDA"], updated_after: "2016-11-16T00:00:00.000Z" })
    def batch_get_counts(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/counts/batch-retrieve"
end
      SquareApiClient::BatchGetInventoryCountsResponse.from_json(json_object: response.body)
    end
# Deprecated version of
#  veInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param physical_count_id [String] ID of the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryPhysicalCountResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_get_physical_count(physical_count_id: "physical_count_id")
    def deprecated_get_physical_count(physical_count_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/physical-count/#{physical_count_id}"
end
      SquareApiClient::GetInventoryPhysicalCountResponse.from_json(json_object: response.body)
    end
# Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
#  object with the provided `physical_count_id`.
    #
    # @param physical_count_id [String] ID of the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryPhysicalCountResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get_physical_count(physical_count_id: "physical_count_id")
    def get_physical_count(physical_count_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/physical-counts/#{physical_count_id}"
end
      SquareApiClient::GetInventoryPhysicalCountResponse.from_json(json_object: response.body)
    end
# Returns the [InventoryTransfer](entity:InventoryTransfer) object
#  with the provided `transfer_id`.
    #
    # @param transfer_id [String] ID of the [InventoryTransfer](entity:InventoryTransfer) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryTransferResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get_transfer(transfer_id: "transfer_id")
    def get_transfer(transfer_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/transfers/#{transfer_id}"
end
      SquareApiClient::GetInventoryTransferResponse.from_json(json_object: response.body)
    end
# Retrieves the current calculated stock count for a given
#  [CatalogObject](entity:CatalogObject) at a given set of
#  [Location](entity:Location)s. Responses are paginated and unsorted.
#  For more sophisticated queries, use a batch endpoint.
    #
    # @param catalog_object_id [String] ID of the [CatalogObject](entity:CatalogObject) to retrieve.
    # @param location_ids [String] The [Location](entity:Location) IDs to look up as a comma-separated
#  list. An empty list queries all locations.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryCountResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get(catalog_object_id: "catalog_object_id")
    def get(catalog_object_id:, location_ids: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_ids": location_ids, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/#{catalog_object_id}"
end
      SquareApiClient::GetInventoryCountResponse.from_json(json_object: response.body)
    end
# Returns a set of physical counts and inventory adjustments for the
#  provided [CatalogObject](entity:CatalogObject) at the requested
#  [Location](entity:Location)s.
#  You can achieve the same result by calling
#  hRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
#  and having the `catalog_object_ids` list contain a single element of the
#  `CatalogObject` ID.
#  Results are paginated and sorted in descending order according to their
#  `occurred_at` timestamp (newest first).
#  There are no limits on how far back the caller can page. This endpoint can be
#  used to display recent changes for a specific item. For more
#  sophisticated queries, use a batch endpoint.
    #
    # @param catalog_object_id [String] ID of the [CatalogObject](entity:CatalogObject) to retrieve.
    # @param location_ids [String] The [Location](entity:Location) IDs to look up as a comma-separated
#  list. An empty list queries all locations.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryChangesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.changes(catalog_object_id: "catalog_object_id")
    def changes(catalog_object_id:, location_ids: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_ids": location_ids, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/#{catalog_object_id}/changes"
end
      SquareApiClient::GetInventoryChangesResponse.from_json(json_object: response.body)
    end
  end
  class AsyncInventoryClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncInventoryClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Deprecated version of
#  RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdjustment)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param adjustment_id [String] ID of the [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryAdjustmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_get_adjustment(adjustment_id: "adjustment_id")
    def deprecated_get_adjustment(adjustment_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/adjustment/#{adjustment_id}"
end
        SquareApiClient::GetInventoryAdjustmentResponse.from_json(json_object: response.body)
      end
    end
# Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
#  with the provided `adjustment_id`.
    #
    # @param adjustment_id [String] ID of the [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryAdjustmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get_adjustment(adjustment_id: "adjustment_id")
    def get_adjustment(adjustment_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/adjustments/#{adjustment_id}"
end
        SquareApiClient::GetInventoryAdjustmentResponse.from_json(json_object: response.body)
      end
    end
# Deprecated version of
#  [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the
#  endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchChangeInventoryRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :changes (Array<SquareApiClient::InventoryChange>) 
    #   * :ignore_unchanged_counts (Boolean) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchChangeInventoryResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_batch_change(request: { idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", changes: [{ type: PHYSICAL_COUNT, physical_count: { reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92", catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI", state: IN_STOCK, location_id: "C6W5YS5QM06F5", quantity: "53", team_member_id: "LRK57NSQ5X7PUD05", occurred_at: "2016-11-16T22:25:24.878Z" } }], ignore_unchanged_counts: true })
    def deprecated_batch_change(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/batch-change"
end
        SquareApiClient::BatchChangeInventoryResponse.from_json(json_object: response.body)
      end
    end
# Deprecated version of
#  hRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchRetrieveInventoryChangesRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :types (Array<SquareApiClient::InventoryChangeType>) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :updated_after (String) 
    #   * :updated_before (String) 
    #   * :cursor (String) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryChangesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_batch_get_changes(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["C6W5YS5QM06F5"], types: [PHYSICAL_COUNT], states: [IN_STOCK], updated_after: "2016-11-01T00:00:00.000Z", updated_before: "2016-12-01T00:00:00.000Z" })
    def deprecated_batch_get_changes(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/batch-retrieve-changes"
end
        SquareApiClient::BatchGetInventoryChangesResponse.from_json(json_object: response.body)
      end
    end
# Deprecated version of
#  tchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchGetInventoryCountsRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :updated_after (String) 
    #   * :cursor (String) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryCountsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_batch_get_counts(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["59TNP9SA8VGDA"], updated_after: "2016-11-16T00:00:00.000Z" })
    def deprecated_batch_get_counts(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/batch-retrieve-counts"
end
        SquareApiClient::BatchGetInventoryCountsResponse.from_json(json_object: response.body)
      end
    end
# Applies adjustments and counts to the provided item quantities.
#  On success: returns the current calculated counts for all objects
#  referenced in the request.
#  On failure: returns a list of related errors.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchChangeInventoryRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :changes (Array<SquareApiClient::InventoryChange>) 
    #   * :ignore_unchanged_counts (Boolean) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchChangeInventoryResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.batch_create_changes(request: { idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe", changes: [{ type: PHYSICAL_COUNT, physical_count: { reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92", catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI", state: IN_STOCK, location_id: "C6W5YS5QM06F5", quantity: "53", team_member_id: "LRK57NSQ5X7PUD05", occurred_at: "2016-11-16T22:25:24.878Z" } }], ignore_unchanged_counts: true })
    def batch_create_changes(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/changes/batch-create"
end
        SquareApiClient::BatchChangeInventoryResponse.from_json(json_object: response.body)
      end
    end
# Returns historical physical counts and adjustments based on the
#  provided filter criteria.
#  Results are paginated and sorted in ascending order according their
#  `occurred_at` timestamp (oldest first).
#  BatchRetrieveInventoryChanges is a catch-all query endpoint for queries
#  that cannot be handled by other, simpler endpoints.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchRetrieveInventoryChangesRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :types (Array<SquareApiClient::InventoryChangeType>) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :updated_after (String) 
    #   * :updated_before (String) 
    #   * :cursor (String) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryChangesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.batch_get_changes(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["C6W5YS5QM06F5"], types: [PHYSICAL_COUNT], states: [IN_STOCK], updated_after: "2016-11-01T00:00:00.000Z", updated_before: "2016-12-01T00:00:00.000Z" })
    def batch_get_changes(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/changes/batch-retrieve"
end
        SquareApiClient::BatchGetInventoryChangesResponse.from_json(json_object: response.body)
      end
    end
# Returns current counts for the provided
#  [CatalogObject](entity:CatalogObject)s at the requested
#  [Location](entity:Location)s.
#  Results are paginated and sorted in descending order according to their
#  `calculated_at` timestamp (newest first).
#  When `updated_after` is specified, only counts that have changed since that
#  time (based on the server timestamp for the most recent change) are
#  returned. This allows clients to perform a "sync" operation, for example
#  in response to receiving a Webhook notification.
    #
    # @param request [Hash] Request of type SquareApiClient::BatchGetInventoryCountsRequest, as a Hash
    #   * :catalog_object_ids (Array<String>) 
    #   * :location_ids (Array<String>) 
    #   * :updated_after (String) 
    #   * :cursor (String) 
    #   * :states (Array<SquareApiClient::InventoryState>) 
    #   * :limit (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetInventoryCountsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.batch_get_counts(request: { catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"], location_ids: ["59TNP9SA8VGDA"], updated_after: "2016-11-16T00:00:00.000Z" })
    def batch_get_counts(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/counts/batch-retrieve"
end
        SquareApiClient::BatchGetInventoryCountsResponse.from_json(json_object: response.body)
      end
    end
# Deprecated version of
#  veInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount)
#  after the endpoint URL
#  is updated to conform to the standard convention.
    #
    # @param physical_count_id [String] ID of the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryPhysicalCountResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.deprecated_get_physical_count(physical_count_id: "physical_count_id")
    def deprecated_get_physical_count(physical_count_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/physical-count/#{physical_count_id}"
end
        SquareApiClient::GetInventoryPhysicalCountResponse.from_json(json_object: response.body)
      end
    end
# Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
#  object with the provided `physical_count_id`.
    #
    # @param physical_count_id [String] ID of the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryPhysicalCountResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get_physical_count(physical_count_id: "physical_count_id")
    def get_physical_count(physical_count_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/physical-counts/#{physical_count_id}"
end
        SquareApiClient::GetInventoryPhysicalCountResponse.from_json(json_object: response.body)
      end
    end
# Returns the [InventoryTransfer](entity:InventoryTransfer) object
#  with the provided `transfer_id`.
    #
    # @param transfer_id [String] ID of the [InventoryTransfer](entity:InventoryTransfer) to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryTransferResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get_transfer(transfer_id: "transfer_id")
    def get_transfer(transfer_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/transfers/#{transfer_id}"
end
        SquareApiClient::GetInventoryTransferResponse.from_json(json_object: response.body)
      end
    end
# Retrieves the current calculated stock count for a given
#  [CatalogObject](entity:CatalogObject) at a given set of
#  [Location](entity:Location)s. Responses are paginated and unsorted.
#  For more sophisticated queries, use a batch endpoint.
    #
    # @param catalog_object_id [String] ID of the [CatalogObject](entity:CatalogObject) to retrieve.
    # @param location_ids [String] The [Location](entity:Location) IDs to look up as a comma-separated
#  list. An empty list queries all locations.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryCountResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.get(catalog_object_id: "catalog_object_id")
    def get(catalog_object_id:, location_ids: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_ids": location_ids, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/#{catalog_object_id}"
end
        SquareApiClient::GetInventoryCountResponse.from_json(json_object: response.body)
      end
    end
# Returns a set of physical counts and inventory adjustments for the
#  provided [CatalogObject](entity:CatalogObject) at the requested
#  [Location](entity:Location)s.
#  You can achieve the same result by calling
#  hRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
#  and having the `catalog_object_ids` list contain a single element of the
#  `CatalogObject` ID.
#  Results are paginated and sorted in descending order according to their
#  `occurred_at` timestamp (newest first).
#  There are no limits on how far back the caller can page. This endpoint can be
#  used to display recent changes for a specific item. For more
#  sophisticated queries, use a batch endpoint.
    #
    # @param catalog_object_id [String] ID of the [CatalogObject](entity:CatalogObject) to retrieve.
    # @param location_ids [String] The [Location](entity:Location) IDs to look up as a comma-separated
#  list. An empty list queries all locations.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInventoryChangesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.inventory.changes(catalog_object_id: "catalog_object_id")
    def changes(catalog_object_id:, location_ids: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_ids": location_ids, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/inventory/#{catalog_object_id}/changes"
end
        SquareApiClient::GetInventoryChangesResponse.from_json(json_object: response.body)
      end
    end
  end
end