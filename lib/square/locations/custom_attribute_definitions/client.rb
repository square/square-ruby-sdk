# frozen_string_literal: true

module Square
  module Locations
    module CustomAttributeDefinitions
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists the location-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a
        # Square seller account.
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CustomAttributeDefinition`
        # in the `custom_attribute_definitions` field of every page, requesting pages as they are needed. Call `pages`
        # on it to get each page as a `Square::Types::ListLocationCustomAttributeDefinitionsResponse`, including its
        # other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Square::Types::VisibilityFilter, nil] :visibility_filter
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @example
        #   client.locations.custom_attribute_definitions.list(
        #     visibility_filter: "ALL",
        #     limit: 1,
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["visibility_filter"] = params[:visibility_filter] if params.key?(:visibility_filter)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attribute_definitions,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/locations/custom-attribute-definitions",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListLocationCustomAttributeDefinitionsResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a location-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller
        # account.
        # Use this endpoint to define a custom attribute that can be associated with locations.
        # A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
        # for a custom attribute. After the definition is created, you can call
        # [UpsertLocationCustomAttribute](api-endpoint:LocationCustomAttributes-UpsertLocationCustomAttribute) or
        # [BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes)
        # to set the custom attribute for locations.
        #
        # @param request_options [Hash]
        # @param params [Square::Locations::CustomAttributeDefinitions::Types::CreateLocationCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.locations.custom_attribute_definitions.create(custom_attribute_definition: {
        #     key: "bestseller",
        #     schema: {
        #       "$ref" => "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.String"
        #     },
        #     name: "Bestseller",
        #     description: "Bestselling item at location",
        #     visibility: "VISIBILITY_READ_WRITE_VALUES"
        #   })
        #
        # @return [Square::Types::CreateLocationCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/locations/custom-attribute-definitions",
            body: Square::Locations::CustomAttributeDefinitions::Types::CreateLocationCustomAttributeDefinitionRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateLocationCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a location-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square
        # seller account.
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        # @option params [Integer, nil] :version
        #
        # @example
        #   client.locations.custom_attribute_definitions.get(
        #     key: "key",
        #     version: 1
        #   )
        #
        # @return [Square::Types::RetrieveLocationCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/locations/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::RetrieveLocationCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates a location-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller
        # account.
        # Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
        # `schema` for a `Selection` data type.
        # Only the definition owner can update a custom attribute definition.
        #
        # @param request_options [Hash]
        # @param params [Square::Locations::CustomAttributeDefinitions::Types::UpdateLocationCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @example
        #   client.locations.custom_attribute_definitions.update(
        #     key: "key",
        #     custom_attribute_definition: {
        #       description: "Update the description as desired.",
        #       visibility: "VISIBILITY_READ_ONLY"
        #     }
        #   )
        #
        # @return [Square::Types::UpdateLocationCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Locations::CustomAttributeDefinitions::Types::UpdateLocationCustomAttributeDefinitionRequest.new(params).to_h
          non_body_param_names = %w[key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/locations/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::UpdateLocationCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a location-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square
        # seller account.
        # Deleting a custom attribute definition also deletes the corresponding custom attribute from
        # all locations.
        # Only the definition owner can delete a custom attribute definition.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @example
        #   client.locations.custom_attribute_definitions.delete(key: "key")
        #
        # @return [Square::Types::DeleteLocationCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/locations/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteLocationCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
