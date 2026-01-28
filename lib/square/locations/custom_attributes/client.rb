# frozen_string_literal: true

module Square
  module Locations
    module CustomAttributes
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Deletes [custom attributes](entity:CustomAttribute) for locations as a bulk operation.
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Locations::CustomAttributes::Types::BulkDeleteLocationCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::BulkDeleteLocationCustomAttributesResponse]
        def batch_delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/locations/custom-attributes/bulk-delete",
            body: Square::Locations::CustomAttributes::Types::BulkDeleteLocationCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkDeleteLocationCustomAttributesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates [custom attributes](entity:CustomAttribute) for locations as a bulk operation.
        # Use this endpoint to set the value of one or more custom attributes for one or more locations.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which is
        # created using the
        # [CreateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition)
        # endpoint.
        # This `BulkUpsertLocationCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
        # requests and returns a map of individual upsert responses. Each upsert request has a unique ID
        # and provides a location ID and custom attribute. Each upsert response is returned with the ID
        # of the corresponding request.
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Locations::CustomAttributes::Types::BulkUpsertLocationCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::BulkUpsertLocationCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/locations/custom-attributes/bulk-upsert",
            body: Square::Locations::CustomAttributes::Types::BulkUpsertLocationCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::BulkUpsertLocationCustomAttributesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Lists the [custom attributes](entity:CustomAttribute) associated with a location.
        # You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
        # in the same call.
        # When all response pages are retrieved, the results include all custom attributes that are
        # visible to the requesting application, including those that are owned by other applications
        # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [Square::Types::VisibilityFilter, nil] :visibility_filter
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        # @option params [Boolean, nil] :with_definitions
        #
        # @return [Square::Types::ListLocationCustomAttributesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[visibility_filter limit cursor with_definitions]
          query_params = {}
          query_params["visibility_filter"] = params[:visibility_filter] if params.key?(:visibility_filter)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["with_definitions"] = params[:with_definitions] if params.key?(:with_definitions)
          params = params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :custom_attributes,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/locations/#{params[:location_id]}/custom-attributes",
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
              Square::Types::ListLocationCustomAttributesResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Retrieves a [custom attribute](entity:CustomAttribute) associated with a location.
        # You can use the `with_definition` query parameter to also retrieve the custom attribute definition
        # in the same call.
        # To retrieve a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String] :key
        # @option params [Boolean, nil] :with_definition
        # @option params [Integer, nil] :version
        #
        # @return [Square::Types::RetrieveLocationCustomAttributeResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[with_definition version]
          query_params = {}
          query_params["with_definition"] = params[:with_definition] if params.key?(:with_definition)
          query_params["version"] = params[:version] if params.key?(:version)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/locations/#{params[:location_id]}/custom-attributes/#{params[:key]}",
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
            Square::Types::RetrieveLocationCustomAttributeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates a [custom attribute](entity:CustomAttribute) for a location.
        # Use this endpoint to set the value of a custom attribute for a specified location.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which
        # is created using the
        # [CreateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition)
        # endpoint.
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Locations::CustomAttributes::Types::UpsertLocationCustomAttributeRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String] :key
        #
        # @return [Square::Types::UpsertLocationCustomAttributeResponse]
        def upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Locations::CustomAttributes::Types::UpsertLocationCustomAttributeRequest.new(params).to_h
          non_body_param_names = %w[location_id key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/locations/#{params[:location_id]}/custom-attributes/#{params[:key]}",
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
            Square::Types::UpsertLocationCustomAttributeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a [custom attribute](entity:CustomAttribute) associated with a location.
        # To delete a custom attribute owned by another application, the `visibility` setting must be
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String] :key
        #
        # @return [Square::Types::DeleteLocationCustomAttributeResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/locations/#{params[:location_id]}/custom-attributes/#{params[:key]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteLocationCustomAttributeResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
