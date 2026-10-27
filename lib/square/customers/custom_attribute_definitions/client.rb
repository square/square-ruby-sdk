# frozen_string_literal: true

module Square
  module Customers
    module CustomAttributeDefinitions
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists the customer-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a
        # Square seller account.
        #
        # When all response pages are retrieved, the results include all custom attribute definitions
        # that are visible to the requesting application, including those that are created by other
        # applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
        # seller-defined custom attributes (also known as custom fields) are always set to
        # `VISIBILITY_READ_WRITE_VALUES`.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CustomAttributeDefinition`
        # in the `custom_attribute_definitions` field of every page, requesting pages as they are needed. Call `pages`
        # on it to get each page as a `Square::Types::ListCustomerCustomAttributeDefinitionsResponse`, including its
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
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @example
        #   client.customers.custom_attribute_definitions.list(
        #     limit: 1,
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
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
              path: "v2/customers/custom-attribute-definitions",
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCustomerCustomAttributeDefinitionsResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a customer-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller
        # account.
        # Use this endpoint to define a custom attribute that can be associated with customer profiles.
        #
        # A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
        # for a custom attribute. After the definition is created, you can call
        # [UpsertCustomerCustomAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute) or
        # [BulkUpsertCustomerCustomAttributes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes)
        # to set the custom attribute for customer profiles in the seller's Customer Directory.
        #
        # Sellers can view all custom attributes in exported customer data, including those set to
        # `VISIBILITY_HIDDEN`.
        #
        # @param request_options [Hash]
        # @param params [Square::Customers::CustomAttributeDefinitions::Types::CreateCustomerCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.customers.custom_attribute_definitions.create(custom_attribute_definition: {
        #     key: "favoritemovie",
        #     schema: {
        #       "$ref" => "https://developer-production-s.squarecdn.com/schemas/v1/common.json#squareup.common.String"
        #     },
        #     name: "Favorite Movie",
        #     description: "The favorite movie of the customer.",
        #     visibility: "VISIBILITY_HIDDEN"
        #   })
        #
        # @return [Square::Types::CreateCustomerCustomAttributeDefinitionResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/customers/custom-attribute-definitions",
            body: Square::Customers::CustomAttributeDefinitions::Types::CreateCustomerCustomAttributeDefinitionRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateCustomerCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a customer-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square
        # seller account.
        #
        # To retrieve a custom attribute definition created by another application, the `visibility`
        # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
        # attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
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
        #   client.customers.custom_attribute_definitions.get(
        #     key: "key",
        #     version: 1
        #   )
        #
        # @return [Square::Types::GetCustomerCustomAttributeDefinitionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["version"] = params[:version] if params.key?(:version)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/customers/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::GetCustomerCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates a customer-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller
        # account.
        #
        # Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
        # `schema` for a `Selection` data type.
        #
        # Only the definition owner can update a custom attribute definition. Note that sellers can view
        # all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
        #
        # @param request_options [Hash]
        # @param params [Square::Customers::CustomAttributeDefinitions::Types::UpdateCustomerCustomAttributeDefinitionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :key
        #
        # @example
        #   client.customers.custom_attribute_definitions.update(
        #     key: "key",
        #     custom_attribute_definition: {
        #       description: "Update the description as desired.",
        #       visibility: "VISIBILITY_READ_ONLY"
        #     }
        #   )
        #
        # @return [Square::Types::UpdateCustomerCustomAttributeDefinitionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Customers::CustomAttributeDefinitions::Types::UpdateCustomerCustomAttributeDefinitionRequest.new(params).to_h
          non_body_param_names = %w[key]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/customers/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpdateCustomerCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a customer-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square
        # seller account.
        #
        # Deleting a custom attribute definition also deletes the corresponding custom attribute from
        # all customer profiles in the seller's Customer Directory.
        #
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
        #   client.customers.custom_attribute_definitions.delete(key: "key")
        #
        # @return [Square::Types::DeleteCustomerCustomAttributeDefinitionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/customers/custom-attribute-definitions/#{URI.encode_uri_component(params[:key].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteCustomerCustomAttributeDefinitionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates [custom attributes](entity:CustomAttribute) for customer profiles as a bulk operation.
        #
        # Use this endpoint to set the value of one or more custom attributes for one or more customer profiles.
        # A custom attribute is based on a custom attribute definition in a Square seller account, which is
        # created using the
        # [CreateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition)
        # endpoint.
        #
        # This `BulkUpsertCustomerCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
        # requests and returns a map of individual upsert responses. Each upsert request has a unique ID
        # and provides a customer ID and custom attribute. Each upsert response is returned with the ID
        # of the corresponding request.
        #
        # To create or update a custom attribute owned by another application, the `visibility` setting
        # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
        # (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
        #
        # @param request_options [Hash]
        # @param params [Square::Customers::CustomAttributeDefinitions::Types::BatchUpsertCustomerCustomAttributesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.customers.custom_attribute_definitions.batch_upsert(values: {
        #     id1: {
        #       customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8",
        #       custom_attribute: {
        #         key: "favoritemovie",
        #         value: "Dune"
        #       }
        #     },
        #     id2: {
        #       customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM",
        #       custom_attribute: {
        #         key: "ownsmovie",
        #         value: false
        #       }
        #     },
        #     id3: {
        #       customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM",
        #       custom_attribute: {
        #         key: "favoritemovie",
        #         value: "Star Wars"
        #       }
        #     },
        #     id4: {
        #       customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8",
        #       custom_attribute: {
        #         key: "square:a0f1505a-2aa1-490d-91a8-8d31ff181808",
        #         value: "10.5"
        #       }
        #     },
        #     id5: {
        #       customer_id: "70548QG1HN43B05G0KCZ4MMC1G",
        #       custom_attribute: {
        #         key: "sq0ids-0evKIskIGaY45fCyNL66aw:backupemail",
        #         value: "fake-email@squareup.com"
        #       }
        #     }
        #   })
        #
        # @return [Square::Types::BatchUpsertCustomerCustomAttributesResponse]
        def batch_upsert(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/customers/custom-attributes/bulk-upsert",
            body: Square::Customers::CustomAttributeDefinitions::Types::BatchUpsertCustomerCustomAttributesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::BatchUpsertCustomerCustomAttributesResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
