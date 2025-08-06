# frozen_string_literal: true

require_relative "types_export"
require_relative "requests"
require_relative "square_rb/types/get_user_identity_response"
require "json"
require_relative "square_rb/types/heartbeat_response"
require_relative "square_rb/types/checklist_response"
require_relative "square_rb/types/create_tenant_response"
require_relative "square_rb/types/get_tenant_response"
require_relative "square_rb/types/vec"
require_relative "square_rb/types/create_database_response"
require_relative "square_rb/types/database"
require_relative "square_rb/types/delete_database_response"
require_relative "square_rb/types/collection_configuration"
require_relative "square_rb/types/hash_map"
require_relative "square_rb/types/collection"
require_relative "square_rb/types/update_collection_configuration"
require_relative "square_rb/types/update_collection_response"
require_relative "square_rb/types/embeddings_payload"
require_relative "square_rb/types/add_collection_records_response"
require_relative "square_rb/types/delete_collection_records_response"
require_relative "square_rb/types/include_list"
require_relative "square_rb/types/get_response"
require_relative "square_rb/types/query_response"
require_relative "square_rb/types/update_embeddings_payload"
require_relative "square_rb/types/update_collection_records_response"
require_relative "square_rb/types/upsert_collection_records_response"

module ChromaApiClient
  class Client
    # @param base_url [String]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [ChromaApiClient::Client]
    def initialize(api_key:, base_url: nil, max_retries: nil, timeout_in_seconds: nil)
      @request_client = ChromaApiClient::RequestClient.new(
        base_url: base_url,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::GetUserIdentityResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_user_identity
    def get_user_identity(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/auth/identity"
      end
      ChromaApiClient::GetUserIdentityResponse.from_json(json_object: response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [String]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.healthcheck
    def healthcheck(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/healthcheck"
      end
      JSON.parse(response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::HeartbeatResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.heartbeat
    def heartbeat(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/heartbeat"
      end
      ChromaApiClient::HeartbeatResponse.from_json(json_object: response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::ChecklistResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.pre_flight_checks
    def pre_flight_checks(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/pre-flight-checks"
      end
      ChromaApiClient::ChecklistResponse.from_json(json_object: response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [String]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.reset
    def reset(request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/reset"
      end
      response.body
    end

    # @param name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::CREATE_TENANT_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.create_tenant(name: "name")
    def create_tenant(name:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants"
      end
      JSON.parse(response.body)
    end

    # @param tenant_name [String] Tenant name or ID to retrieve
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::GetTenantResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_tenant(tenant_name: "tenant_name")
    def get_tenant(tenant_name:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant_name}"
      end
      ChromaApiClient::GetTenantResponse.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID to list databases for
    # @param limit [Integer] Limit for pagination
    # @param offset [Integer] Offset for pagination
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::VEC]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.list_databases(tenant: "tenant")
    def list_databases(tenant:, limit: nil, offset: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        ChromaApiClient::VecItem.from_json(json_object: item)
      end
    end

    # @param tenant [String] Tenant ID to associate with the new database
    # @param name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::CREATE_DATABASE_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.create_database(tenant: "tenant", name: "name")
    def create_database(tenant:, name:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Name of the database to retrieve
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Database]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_database(tenant: "tenant", database: "database")
    def get_database(tenant:, database:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}"
      end
      ChromaApiClient::Database.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Name of the database to delete
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::DELETE_DATABASE_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.delete_database(tenant: "tenant", database: "database")
    def delete_database(tenant:, database:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name to list collections from
    # @param limit [Integer] Limit for pagination
    # @param offset [Integer] Offset for pagination
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::VEC]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.list_collections(tenant: "tenant", database: "database")
    def list_collections(tenant:, database:, limit: nil, offset: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        ChromaApiClient::VecItem.from_json(json_object: item)
      end
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name containing the new collection
    # @param configuration [Hash] Request of type ChromaApiClient::CollectionConfiguration, as a Hash
    #   * :embedding_function (Hash)
    #   * :hnsw (Hash)
    #     * :ef_construction (Integer)
    #     * :ef_search (Integer)
    #     * :max_neighbors (Integer)
    #     * :resize_factor (Float)
    #     * :space (ChromaApiClient::HnswSpace)
    #     * :sync_threshold (Integer)
    #   * :spann (Hash)
    #     * :ef_construction (Integer)
    #     * :ef_search (Integer)
    #     * :max_neighbors (Integer)
    #     * :merge_threshold (Integer)
    #     * :reassign_neighbor_count (Integer)
    #     * :search_nprobe (Integer)
    #     * :space (ChromaApiClient::HnswSpace)
    #     * :split_threshold (Integer)
    #     * :write_nprobe (Integer)
    # @param get_or_create [Boolean]
    # @param metadata [ChromaApiClient::HASH_MAP]
    # @param name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Collection]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.create_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    name: "name"
    #  )
    def create_collection(tenant:, database:, name:, configuration: nil, get_or_create: nil, metadata: nil,
                          request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          configuration: configuration,
          get_or_create: get_or_create,
          metadata: metadata,
          name: name
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections"
      end
      ChromaApiClient::Collection.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Collection]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def get_collection(tenant:, database:, collection_id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}"
      end
      ChromaApiClient::Collection.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection to update
    # @param new_configuration [Hash] Request of type ChromaApiClient::UpdateCollectionConfiguration, as a Hash
    #   * :embedding_function (Hash)
    #   * :hnsw (Hash)
    #     * :batch_size (Integer)
    #     * :ef_search (Integer)
    #     * :max_neighbors (Integer)
    #     * :num_threads (Integer)
    #     * :resize_factor (Float)
    #     * :sync_threshold (Integer)
    #   * :spann (Hash)
    #     * :ef_search (Integer)
    #     * :search_nprobe (Integer)
    # @param new_metadata [ChromaApiClient::HASH_MAP]
    # @param new_name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPDATE_COLLECTION_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.update_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def update_collection(tenant:, database:, collection_id:, new_configuration: nil, new_metadata: nil, new_name: nil,
                          request_options: nil)
      response = @request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          new_configuration: new_configuration,
          new_metadata: new_metadata,
          new_name: new_name
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection to delete
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPDATE_COLLECTION_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.delete_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def delete_collection(tenant:, database:, collection_id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String]
    # @param database [String]
    # @param collection_id [String]
    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>, Array<String>]
    # @param ids [Array<String>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::ADD_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_add(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    embeddings: [[1.1]],
    #    ids: ["ids"]
    #  )
    def collection_add(tenant:, database:, collection_id:, embeddings:, ids:, documents: nil, metadatas: nil,
                       uris: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          documents: documents,
          embeddings: embeddings,
          ids: ids,
          metadatas: metadatas,
          uris: uris
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/add"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID for the collection
    # @param database [String] Database containing this collection
    # @param collection_id [String] Collection ID whose records are counted
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [Integer]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_count(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def collection_count(tenant:, database:, collection_id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/count"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] Collection ID
    # @param where [Object]
    # @param where_document [Object]
    # @param ids [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::DELETE_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_delete(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def collection_delete(tenant:, database:, collection_id:, where: nil, where_document: nil, ids: nil,
                          request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          where: where,
          where_document: where_document,
          ids: ids
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/delete"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection to update
    # @param new_name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Collection]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.fork_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    new_name: "new_name"
    #  )
    def fork_collection(tenant:, database:, collection_id:, new_name:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), new_name: new_name }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/fork"
      end
      ChromaApiClient::Collection.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name for the collection
    # @param collection_id [String] Collection ID to fetch records from
    # @param where [Object]
    # @param where_document [Object]
    # @param ids [Array<String>]
    # @param include [ChromaApiClient::INCLUDE_LIST]
    # @param limit [Integer]
    # @param offset [Integer]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::GetResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_get(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def collection_get(tenant:, database:, collection_id:, where: nil, where_document: nil, ids: nil, include: nil,
                       limit: nil, offset: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          where: where,
          where_document: where_document,
          ids: ids,
          include: include,
          limit: limit,
          offset: offset
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/get"
      end
      ChromaApiClient::GetResponse.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name containing the collection
    # @param collection_id [String] Collection ID to query
    # @param limit [Integer] Limit for pagination
    # @param offset [Integer] Offset for pagination
    # @param where [Object]
    # @param where_document [Object]
    # @param ids [Array<String>]
    # @param include [ChromaApiClient::INCLUDE_LIST]
    # @param n_results [Integer]
    # @param query_embeddings [Array<Array<Float>>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::QueryResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_query(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    query_embeddings: [[1.1]]
    #  )
    def collection_query(tenant:, database:, collection_id:, query_embeddings:, limit: nil, offset: nil, where: nil, where_document: nil,
                         ids: nil, include: nil, n_results: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          where: where,
          where_document: where_document,
          ids: ids,
          include: include,
          n_results: n_results,
          query_embeddings: query_embeddings
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/query"
      end
      ChromaApiClient::QueryResponse.from_json(json_object: response.body)
    end

    # @param tenant [String]
    # @param database [String]
    # @param collection_id [String]
    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>, Array<String>]
    # @param ids [Array<String>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPDATE_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_update(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    ids: ["ids"]
    #  )
    def collection_update(tenant:, database:, collection_id:, ids:, documents: nil, embeddings: nil, metadatas: nil,
                          uris: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          documents: documents,
          embeddings: embeddings,
          ids: ids,
          metadatas: metadatas,
          uris: uris
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/update"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] Collection ID
    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>, Array<String>]
    # @param ids [Array<String>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPSERT_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_upsert(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    embeddings: [[1.1]],
    #    ids: ["ids"]
    #  )
    def collection_upsert(tenant:, database:, collection_id:, embeddings:, ids:, documents: nil, metadatas: nil,
                          uris: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          documents: documents,
          embeddings: embeddings,
          ids: ids,
          metadatas: metadatas,
          uris: uris
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/upsert"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name to count collections from
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [Integer]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.count_collections(tenant: "tenant", database: "database")
    def count_collections(tenant:, database:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections_count"
      end
      JSON.parse(response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [String]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.version
    def version(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v2/version"
      end
      response.body
    end
  end

  class AsyncClient
    # @param base_url [String]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [ChromaApiClient::AsyncClient]
    def initialize(api_key:, base_url: nil, max_retries: nil, timeout_in_seconds: nil)
      @async_request_client = ChromaApiClient::AsyncRequestClient.new(
        base_url: base_url,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::GetUserIdentityResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_user_identity
    def get_user_identity(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/auth/identity"
      end
      ChromaApiClient::GetUserIdentityResponse.from_json(json_object: response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [String]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.healthcheck
    def healthcheck(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/healthcheck"
      end
      JSON.parse(response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::HeartbeatResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.heartbeat
    def heartbeat(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/heartbeat"
      end
      ChromaApiClient::HeartbeatResponse.from_json(json_object: response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::ChecklistResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.pre_flight_checks
    def pre_flight_checks(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/pre-flight-checks"
      end
      ChromaApiClient::ChecklistResponse.from_json(json_object: response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [String]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.reset
    def reset(request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/reset"
      end
      response.body
    end

    # @param name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::CREATE_TENANT_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.create_tenant(name: "name")
    def create_tenant(name:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants"
      end
      JSON.parse(response.body)
    end

    # @param tenant_name [String] Tenant name or ID to retrieve
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::GetTenantResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_tenant(tenant_name: "tenant_name")
    def get_tenant(tenant_name:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant_name}"
      end
      ChromaApiClient::GetTenantResponse.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID to list databases for
    # @param limit [Integer] Limit for pagination
    # @param offset [Integer] Offset for pagination
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::VEC]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.list_databases(tenant: "tenant")
    def list_databases(tenant:, limit: nil, offset: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        ChromaApiClient::VecItem.from_json(json_object: item)
      end
    end

    # @param tenant [String] Tenant ID to associate with the new database
    # @param name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::CREATE_DATABASE_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.create_database(tenant: "tenant", name: "name")
    def create_database(tenant:, name:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Name of the database to retrieve
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Database]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_database(tenant: "tenant", database: "database")
    def get_database(tenant:, database:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}"
      end
      ChromaApiClient::Database.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Name of the database to delete
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::DELETE_DATABASE_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.delete_database(tenant: "tenant", database: "database")
    def delete_database(tenant:, database:, request_options: nil)
      response = @async_request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name to list collections from
    # @param limit [Integer] Limit for pagination
    # @param offset [Integer] Offset for pagination
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::VEC]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.list_collections(tenant: "tenant", database: "database")
    def list_collections(tenant:, database:, limit: nil, offset: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        ChromaApiClient::VecItem.from_json(json_object: item)
      end
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name containing the new collection
    # @param configuration [Hash] Request of type ChromaApiClient::CollectionConfiguration, as a Hash
    #   * :embedding_function (Hash)
    #   * :hnsw (Hash)
    #     * :ef_construction (Integer)
    #     * :ef_search (Integer)
    #     * :max_neighbors (Integer)
    #     * :resize_factor (Float)
    #     * :space (ChromaApiClient::HnswSpace)
    #     * :sync_threshold (Integer)
    #   * :spann (Hash)
    #     * :ef_construction (Integer)
    #     * :ef_search (Integer)
    #     * :max_neighbors (Integer)
    #     * :merge_threshold (Integer)
    #     * :reassign_neighbor_count (Integer)
    #     * :search_nprobe (Integer)
    #     * :space (ChromaApiClient::HnswSpace)
    #     * :split_threshold (Integer)
    #     * :write_nprobe (Integer)
    # @param get_or_create [Boolean]
    # @param metadata [ChromaApiClient::HASH_MAP]
    # @param name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Collection]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.create_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    name: "name"
    #  )
    def create_collection(tenant:, database:, name:, configuration: nil, get_or_create: nil, metadata: nil,
                          request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          configuration: configuration,
          get_or_create: get_or_create,
          metadata: metadata,
          name: name
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections"
      end
      ChromaApiClient::Collection.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Collection]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.get_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def get_collection(tenant:, database:, collection_id:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}"
      end
      ChromaApiClient::Collection.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection to update
    # @param new_configuration [Hash] Request of type ChromaApiClient::UpdateCollectionConfiguration, as a Hash
    #   * :embedding_function (Hash)
    #   * :hnsw (Hash)
    #     * :batch_size (Integer)
    #     * :ef_search (Integer)
    #     * :max_neighbors (Integer)
    #     * :num_threads (Integer)
    #     * :resize_factor (Float)
    #     * :sync_threshold (Integer)
    #   * :spann (Hash)
    #     * :ef_search (Integer)
    #     * :search_nprobe (Integer)
    # @param new_metadata [ChromaApiClient::HASH_MAP]
    # @param new_name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPDATE_COLLECTION_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.update_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def update_collection(tenant:, database:, collection_id:, new_configuration: nil, new_metadata: nil, new_name: nil,
                          request_options: nil)
      response = @async_request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          new_configuration: new_configuration,
          new_metadata: new_metadata,
          new_name: new_name
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection to delete
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPDATE_COLLECTION_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.delete_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def delete_collection(tenant:, database:, collection_id:, request_options: nil)
      response = @async_request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String]
    # @param database [String]
    # @param collection_id [String]
    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>, Array<String>]
    # @param ids [Array<String>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::ADD_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_add(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    embeddings: [[1.1]],
    #    ids: ["ids"]
    #  )
    def collection_add(tenant:, database:, collection_id:, embeddings:, ids:, documents: nil, metadatas: nil,
                       uris: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          documents: documents,
          embeddings: embeddings,
          ids: ids,
          metadatas: metadatas,
          uris: uris
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/add"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID for the collection
    # @param database [String] Database containing this collection
    # @param collection_id [String] Collection ID whose records are counted
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [Integer]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_count(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def collection_count(tenant:, database:, collection_id:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/count"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] Collection ID
    # @param where [Object]
    # @param where_document [Object]
    # @param ids [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::DELETE_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_delete(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def collection_delete(tenant:, database:, collection_id:, where: nil, where_document: nil, ids: nil,
                          request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          where: where,
          where_document: where_document,
          ids: ids
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/delete"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] UUID of the collection to update
    # @param new_name [String]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::Collection]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.fork_collection(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    new_name: "new_name"
    #  )
    def fork_collection(tenant:, database:, collection_id:, new_name:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), new_name: new_name }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/fork"
      end
      ChromaApiClient::Collection.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name for the collection
    # @param collection_id [String] Collection ID to fetch records from
    # @param where [Object]
    # @param where_document [Object]
    # @param ids [Array<String>]
    # @param include [ChromaApiClient::INCLUDE_LIST]
    # @param limit [Integer]
    # @param offset [Integer]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::GetResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_get(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id"
    #  )
    def collection_get(tenant:, database:, collection_id:, where: nil, where_document: nil, ids: nil, include: nil,
                       limit: nil, offset: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          where: where,
          where_document: where_document,
          ids: ids,
          include: include,
          limit: limit,
          offset: offset
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/get"
      end
      ChromaApiClient::GetResponse.from_json(json_object: response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name containing the collection
    # @param collection_id [String] Collection ID to query
    # @param limit [Integer] Limit for pagination
    # @param offset [Integer] Offset for pagination
    # @param where [Object]
    # @param where_document [Object]
    # @param ids [Array<String>]
    # @param include [ChromaApiClient::INCLUDE_LIST]
    # @param n_results [Integer]
    # @param query_embeddings [Array<Array<Float>>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::QueryResponse]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_query(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    query_embeddings: [[1.1]]
    #  )
    def collection_query(tenant:, database:, collection_id:, query_embeddings:, limit: nil, offset: nil, where: nil, where_document: nil,
                         ids: nil, include: nil, n_results: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          where: where,
          where_document: where_document,
          ids: ids,
          include: include,
          n_results: n_results,
          query_embeddings: query_embeddings
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/query"
      end
      ChromaApiClient::QueryResponse.from_json(json_object: response.body)
    end

    # @param tenant [String]
    # @param database [String]
    # @param collection_id [String]
    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>, Array<String>]
    # @param ids [Array<String>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPDATE_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_update(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    ids: ["ids"]
    #  )
    def collection_update(tenant:, database:, collection_id:, ids:, documents: nil, embeddings: nil, metadatas: nil,
                          uris: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          documents: documents,
          embeddings: embeddings,
          ids: ids,
          metadatas: metadatas,
          uris: uris
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/update"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name
    # @param collection_id [String] Collection ID
    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>, Array<String>]
    # @param ids [Array<String>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [ChromaApiClient::UPSERT_COLLECTION_RECORDS_RESPONSE]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.collection_upsert(
    #    tenant: "tenant",
    #    database: "database",
    #    collection_id: "collection_id",
    #    embeddings: [[1.1]],
    #    ids: ["ids"]
    #  )
    def collection_upsert(tenant:, database:, collection_id:, embeddings:, ids:, documents: nil, metadatas: nil,
                          uris: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          documents: documents,
          embeddings: embeddings,
          ids: ids,
          metadatas: metadatas,
          uris: uris
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections/#{collection_id}/upsert"
      end
      JSON.parse(response.body)
    end

    # @param tenant [String] Tenant ID
    # @param database [String] Database name to count collections from
    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [Integer]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.count_collections(tenant: "tenant", database: "database")
    def count_collections(tenant:, database:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/tenants/#{tenant}/databases/#{database}/collections_count"
      end
      JSON.parse(response.body)
    end

    # @param request_options [ChromaApiClient::RequestOptions]
    # @return [String]
    # @example
    #  api = ChromaApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.version
    def version(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-chroma-token"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/api/v2/version"
      end
      response.body
    end
  end
end
