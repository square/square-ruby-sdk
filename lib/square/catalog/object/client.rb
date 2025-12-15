# frozen_string_literal: true

module Square
  module Catalog
    module Object_
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Creates a new or updates the specified [CatalogObject](entity:CatalogObject).
        #
        # To ensure consistency, only one update request is processed at a time per seller account.
        # While one (batch or non-batch) update request is being processed, other (batched and non-batched)
        # update requests are rejected with the `429` error code.
        #
        # @param request_options [Hash]
        # @param params [Square::Catalog::Object_::Types::UpsertCatalogObjectRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::UpsertCatalogObjectResponse]
        def upsert(request_options: {}, **params)
          body_prop_names = %i[idempotency_key object]
          body_bag = params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/catalog/object",
            body: Square::Catalog::Object_::Types::UpsertCatalogObjectRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpsertCatalogObjectResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns a single [CatalogItem](entity:CatalogItem) as a
        # [CatalogObject](entity:CatalogObject) based on the provided ID. The returned
        # object includes all of the relevant [CatalogItem](entity:CatalogItem)
        # information including: [CatalogItemVariation](entity:CatalogItemVariation)
        # children, references to its
        # [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
        # any [CatalogTax](entity:CatalogTax) objects that apply to it.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :object_id_
        # @option params [Boolean, nil] :include_related_objects
        # @option params [Integer, nil] :catalog_version
        # @option params [Boolean, nil] :include_category_path_to_root
        #
        # @return [Square::Types::GetCatalogObjectResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[include_related_objects catalog_version include_category_path_to_root]
          query_params = {}
          query_params["include_related_objects"] = params[:include_related_objects] if params.key?(:include_related_objects)
          query_params["catalog_version"] = params[:catalog_version] if params.key?(:catalog_version)
          query_params["include_category_path_to_root"] = params[:include_category_path_to_root] if params.key?(:include_category_path_to_root)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/catalog/object/#{params[:object_id_]}",
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
            Square::Types::GetCatalogObjectResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a single [CatalogObject](entity:CatalogObject) based on the
        # provided ID and returns the set of successfully deleted IDs in the response.
        # Deletion is a cascading event such that all children of the targeted object
        # are also deleted. For example, deleting a [CatalogItem](entity:CatalogItem)
        # will also delete all of its
        # [CatalogItemVariation](entity:CatalogItemVariation) children.
        #
        # To ensure consistency, only one delete request is processed at a time per seller account.
        # While one (batch or non-batch) delete request is being processed, other (batched and non-batched)
        # delete requests are rejected with the `429` error code.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :object_id_
        #
        # @return [Square::Types::DeleteCatalogObjectResponse]
        def delete(request_options: {}, **params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/catalog/object/#{params[:object_id_]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteCatalogObjectResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
