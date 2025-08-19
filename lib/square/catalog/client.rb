
module Square
  module Catalog
    class Client
      # @return [Square::Catalog::Client]
      def initialize(client:)
        @client = client
      end

      # Deletes a set of [CatalogItem](entity:CatalogItem)s based on the
      # provided list of target IDs and returns a set of successfully deleted IDs in
      # the response. Deletion is a cascading event such that all children of the
      # targeted object are also deleted. For example, deleting a CatalogItem will
      # also delete all of its [CatalogItemVariation](entity:CatalogItemVariation)
      # children.
      # 
      # `BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted
      # IDs can be deleted. The response will only include IDs that were
      # actually deleted.
      # 
      # To ensure consistency, only one delete request is processed at a time per seller account.
      # While one (batch or non-batch) delete request is being processed, other (batched and non-batched)
      # delete requests are rejected with the `429` error code.
      #
      # @return [Square::Types::BatchDeleteCatalogObjectsResponse]
      def batch_delete(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchDeleteCatalogObjectsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns a set of objects based on the provided ID.
      # Each [CatalogItem](entity:CatalogItem) returned in the set includes all of its
      # child information including: all of its
      # [CatalogItemVariation](entity:CatalogItemVariation) objects, references to
      # its [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
      # any [CatalogTax](entity:CatalogTax) objects that apply to it.
      #
      # @return [Square::Types::BatchGetCatalogObjectsResponse]
      def batch_get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetCatalogObjectsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Creates or updates up to 10,000 target objects based on the provided
      # list of objects. The target objects are grouped into batches and each batch is
      # inserted/updated in an all-or-nothing manner. If an object within a batch is
      # malformed in some way, or violates a database constraint, the entire batch
      # containing that item will be disregarded. However, other batches in the same
      # request may still succeed. Each batch may contain up to 1,000 objects, and
      # batches will be processed in order as long as the total object count for the
      # request (items, variations, modifier lists, discounts, and taxes) is no more
      # than 10,000.
      # 
      # To ensure consistency, only one update request is processed at a time per seller account.
      # While one (batch or non-batch) update request is being processed, other (batched and non-batched)
      # update requests are rejected with the `429` error code.
      #
      # @return [Square::Types::BatchUpsertCatalogObjectsResponse]
      def batch_upsert(request_options: {}, **params)
        _response = @client.send(Internal::JSON::Request.new(
          base_url: Square::Environment::SANDBOX,
          path: "/v2/catalog/batch-upsert",
          method: "POST",
          body: Types::BatchUpsertCatalogObjectsRequest.new(params[:request]).to_h,
          request_options: request_options
        ))
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchUpsertCatalogObjectsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves information about the Square Catalog API, such as batch size
      # limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
      #
      # @return [Square::Types::CatalogInfoResponse]
      def info(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CatalogInfoResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns a list of all [CatalogObject](entity:CatalogObject)s of the specified types in the catalog.
      # 
      # The `types` parameter is specified as a comma-separated list of the [CatalogObjectType](entity:CatalogObjectType) values,
      # for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".
      # 
      # __Important:__ ListCatalog does not return deleted catalog items. To retrieve
      # deleted catalog items, use [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
      # and set the `include_deleted_objects` attribute value to `true`.
      #
      # @return [Square::Types::ListCatalogResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListCatalogResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Searches for [CatalogObject](entity:CatalogObject) of any type by matching supported search attribute values,
      # excluding custom attribute values on items or item variations, against one or more of the specified query filters.
      # 
      # This (`SearchCatalogObjects`) endpoint differs from the [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
      # endpoint in the following aspects:
      # 
      # - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects.
      # - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not.
      # - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does.
      # - The both endpoints have different call conventions, including the query filter formats.
      #
      # @return [Square::Types::SearchCatalogObjectsResponse]
      def search(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchCatalogObjectsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Searches for catalog items or item variations by matching supported search attribute values, including
      # custom attribute values, against one or more of the specified query filters.
      # 
      # This (`SearchCatalogItems`) endpoint differs from the [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
      # endpoint in the following aspects:
      # 
      # - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects.
      # - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not.
      # - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does.
      # - The both endpoints use different call conventions, including the query filter formats.
      #
      # @return [Square::Types::SearchCatalogItemsResponse]
      def search_items(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchCatalogItemsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates the [CatalogModifierList](entity:CatalogModifierList) objects
      # that apply to the targeted [CatalogItem](entity:CatalogItem) without having
      # to perform an upsert on the entire item.
      #
      # @return [Square::Types::UpdateItemModifierListsResponse]
      def update_item_modifier_lists(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateItemModifierListsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates the [CatalogTax](entity:CatalogTax) objects that apply to the
      # targeted [CatalogItem](entity:CatalogItem) without having to perform an
      # upsert on the entire item.
      #
      # @return [Square::Types::UpdateItemTaxesResponse]
      def update_item_taxes(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateItemTaxesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
