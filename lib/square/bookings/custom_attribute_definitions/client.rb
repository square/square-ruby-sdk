# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_booking_custom_attribute_definitions_response"
require_relative "../../types/custom_attribute_definition"
require_relative "../../types/create_booking_custom_attribute_definition_response"
require_relative "../../types/retrieve_booking_custom_attribute_definition_response"
require_relative "../../types/update_booking_custom_attribute_definition_response"
require_relative "../../types/delete_booking_custom_attribute_definition_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Bookings
    class CustomAttributeDefinitionsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Bookings::CustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all bookings custom attribute definitions.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListBookingCustomAttributeDefinitionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.list
      def list(limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions"
end
        square.rb::ListBookingCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
      end
# Creates a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
      #
      # @param custom_attribute_definition [Hash] The custom attribute definition to create, with the following fields:
#  - `key`
#  - `name`. If provided, `name` must be unique (case-sensitive) across all visible
#  booking-related custom attribute
#  definitions for the seller.
#  - `description`
#  - `visibility`. Note that all custom attributes are visible in exported booking
#  data, including those set to
#  `VISIBILITY_HIDDEN`.
#  - `schema`. With the exception of the `Selection` data type, the `schema` is
#  specified as a
#  simple URL to the JSON schema definition hosted on the Square CDN. For more
#  information, see
#  [Specifying the
#  docs/booking-custom-attributes-api/custom-attribute-definitions#specify-schema).Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.create(custom_attribute_definition: {  })
      def create(custom_attribute_definition:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions"
end
        square.rb::CreateBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Retrieves a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @param key [String] The key of the custom attribute definition to retrieve. If the requesting
#  application
#  is not the definition owner, you must use the qualified key.
      # @param version [Integer] The current version of the custom attribute definition, which is used for
#  strongly consistent
#  reads to guarantee that you receive the most up-to-date data. When included in
#  the request,
#  Square returns the specified version or a higher version if one exists. If the
#  specified version
#  is higher than the current version, Square returns a `BAD_REQUEST` error.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::RetrieveBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.get(key: "key")
      def get(key:, version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions/#{key}"
end
        square.rb::RetrieveBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Updates a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
      #
      # @param key [String] The key of the custom attribute definition to update.
      # @param custom_attribute_definition [Hash] The custom attribute definition that contains the fields to update. Only the
#  following fields can be updated:
#  - `name`
#  - `description`
#  - `visibility`
#  - `schema` for a `Selection` data type. Only changes to the named options or the
#  maximum number of allowed
#  selections are supported.
#  For more information, see
#  [Updatable definition
#  custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include the optional `version` field and specify the current version of
#  the custom attribute definition.Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.update(key: "key", custom_attribute_definition: {  })
      def update(key:, custom_attribute_definition:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions/#{key}"
end
        square.rb::UpdateBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
# Deletes a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.delete(key: "key")
      def delete(key:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions/#{key}"
end
        square.rb::DeleteBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCustomAttributeDefinitionsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Bookings::AsyncCustomAttributeDefinitionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all bookings custom attribute definitions.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @param limit [Integer] The maximum number of results to return in a single paged response. This limit
#  is advisory.
#  The response might contain more or fewer results. The minimum value is 1 and the
#  maximum value is 100.
#  The default value is 20. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListBookingCustomAttributeDefinitionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.list
      def list(limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions"
end
          square.rb::ListBookingCustomAttributeDefinitionsResponse.from_json(json_object: response.body)
        end
      end
# Creates a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
      #
      # @param custom_attribute_definition [Hash] The custom attribute definition to create, with the following fields:
#  - `key`
#  - `name`. If provided, `name` must be unique (case-sensitive) across all visible
#  booking-related custom attribute
#  definitions for the seller.
#  - `description`
#  - `visibility`. Note that all custom attributes are visible in exported booking
#  data, including those set to
#  `VISIBILITY_HIDDEN`.
#  - `schema`. With the exception of the `Selection` data type, the `schema` is
#  specified as a
#  simple URL to the JSON schema definition hosted on the Square CDN. For more
#  information, see
#  [Specifying the
#  docs/booking-custom-attributes-api/custom-attribute-definitions#specify-schema).Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.create(custom_attribute_definition: {  })
      def create(custom_attribute_definition:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions"
end
          square.rb::CreateBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @param key [String] The key of the custom attribute definition to retrieve. If the requesting
#  application
#  is not the definition owner, you must use the qualified key.
      # @param version [Integer] The current version of the custom attribute definition, which is used for
#  strongly consistent
#  reads to guarantee that you receive the most up-to-date data. When included in
#  the request,
#  Square returns the specified version or a higher version if one exists. If the
#  specified version
#  is higher than the current version, Square returns a `BAD_REQUEST` error.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::RetrieveBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.get(key: "key")
      def get(key:, version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions/#{key}"
end
          square.rb::RetrieveBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Updates a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
      #
      # @param key [String] The key of the custom attribute definition to update.
      # @param custom_attribute_definition [Hash] The custom attribute definition that contains the fields to update. Only the
#  following fields can be updated:
#  - `name`
#  - `description`
#  - `visibility`
#  - `schema` for a `Selection` data type. Only changes to the named options or the
#  maximum number of allowed
#  selections are supported.
#  For more information, see
#  [Updatable definition
#  custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include the optional `version` field and specify the current version of
#  the custom attribute definition.Request of type square.rb::CustomAttributeDefinition, as a Hash
      #   * :key (String) 
      #   * :schema (Hash{String => Object}) 
      #   * :name (String) 
      #   * :description (String) 
      #   * :visibility (square.rb::CustomAttributeDefinitionVisibility) 
      #   * :version (Integer) 
      #   * :updated_at (String) 
      #   * :created_at (String) 
      # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.update(key: "key", custom_attribute_definition: {  })
      def update(key:, custom_attribute_definition:, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), custom_attribute_definition: custom_attribute_definition, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions/#{key}"
end
          square.rb::UpdateBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
# Deletes a bookings custom attribute definition.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
      #
      # @param key [String] The key of the custom attribute definition to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteBookingCustomAttributeDefinitionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.custom_attribute_definitions.delete(key: "key")
      def delete(key:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/custom-attribute-definitions/#{key}"
end
          square.rb::DeleteBookingCustomAttributeDefinitionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end