# frozen_string_literal: true

module Square
  module Catalog
    module Object_
      class Client
        # @return [Square::Catalog::Object_::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a new or updates the specified [CatalogObject](entity:CatalogObject).
        #
        # To ensure consistency, only one update request is processed at a time per seller account.
        # While one (batch or non-batch) update request is being processed, other (batched and non-batched)
        # update requests are rejected with the `429` error code.
        #
        # @return [Square::Types::UpsertCatalogObjectResponse]
        def upsert(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/catalog/object",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpsertCatalogObjectResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a single [CatalogItem](entity:CatalogItem) as a
        # [CatalogObject](entity:CatalogObject) based on the provided ID. The returned
        # object includes all of the relevant [CatalogItem](entity:CatalogItem)
        # information including: [CatalogItemVariation](entity:CatalogItemVariation)
        # children, references to its
        # [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
        # any [CatalogTax](entity:CatalogTax) objects that apply to it.
        #
        # @return [Square::Types::GetCatalogObjectResponse]
        def get(request_options: {}, **params)
          _query_param_names = [
            %w[include_related_objects catalog_version include_category_path_to_root],
            %i[include_related_objects catalog_version include_category_path_to_root]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/catalog/object/#{params[:object_id]}",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCatalogObjectResponse.load(_response.body)
          end

          raise _response.body
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
        # @return [Square::Types::DeleteCatalogObjectResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/catalog/object/#{params[:object_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteCatalogObjectResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
