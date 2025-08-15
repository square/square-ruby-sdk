
module Square
  module Inventory
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Inventory::Client]
      def initialize(client)
        @client = client
      end

      # Deprecated version of [RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdjustment) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::GetInventoryAdjustmentResponse]
      def deprecated_get_adjustment(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryAdjustmentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
      # with the provided `adjustment_id`.
      #
      # @return [Square::GetInventoryAdjustmentResponse]
      def get_adjustment(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryAdjustmentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deprecated version of [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::BatchChangeInventoryResponse]
      def deprecated_batch_change(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/inventory/batch-change"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchChangeInventoryResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deprecated version of [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::BatchGetInventoryChangesResponse]
      def deprecated_batch_get_changes(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/inventory/batch-retrieve-changes"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryChangesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deprecated version of [BatchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::BatchGetInventoryCountsResponse]
      def deprecated_batch_get_counts(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/inventory/batch-retrieve-counts"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryCountsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Applies adjustments and counts to the provided item quantities.
      # 
      # On success: returns the current calculated counts for all objects
      # referenced in the request.
      # On failure: returns a list of related errors.
      #
      # @return [Square::BatchChangeInventoryResponse]
      def batch_create_changes(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/inventory/changes/batch-create"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchChangeInventoryResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns historical physical counts and adjustments based on the
      # provided filter criteria.
      # 
      # Results are paginated and sorted in ascending order according their
      # `occurred_at` timestamp (oldest first).
      # 
      # BatchRetrieveInventoryChanges is a catch-all query endpoint for queries
      # that cannot be handled by other, simpler endpoints.
      #
      # @return [Square::BatchGetInventoryChangesResponse]
      def batch_get_changes(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/inventory/changes/batch-retrieve"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryChangesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns current counts for the provided
      # [CatalogObject](entity:CatalogObject)s at the requested
      # [Location](entity:Location)s.
      # 
      # Results are paginated and sorted in descending order according to their
      # `calculated_at` timestamp (newest first).
      # 
      # When `updated_after` is specified, only counts that have changed since that
      # time (based on the server timestamp for the most recent change) are
      # returned. This allows clients to perform a "sync" operation, for example
      # in response to receiving a Webhook notification.
      #
      # @return [Square::BatchGetInventoryCountsResponse]
      def batch_get_counts(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/inventory/counts/batch-retrieve"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryCountsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deprecated version of [RetrieveInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::GetInventoryPhysicalCountResponse]
      def deprecated_get_physical_count(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryPhysicalCountResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
      # object with the provided `physical_count_id`.
      #
      # @return [Square::GetInventoryPhysicalCountResponse]
      def get_physical_count(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryPhysicalCountResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns the [InventoryTransfer](entity:InventoryTransfer) object
      # with the provided `transfer_id`.
      #
      # @return [Square::GetInventoryTransferResponse]
      def get_transfer(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryTransferResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves the current calculated stock count for a given
      # [CatalogObject](entity:CatalogObject) at a given set of
      # [Location](entity:Location)s. Responses are paginated and unsorted.
      # For more sophisticated queries, use a batch endpoint.
      #
      # @return [Square::GetInventoryCountResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryCountResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns a set of physical counts and inventory adjustments for the
      # provided [CatalogObject](entity:CatalogObject) at the requested
      # [Location](entity:Location)s.
      # 
      # You can achieve the same result by calling [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
      # and having the `catalog_object_ids` list contain a single element of the `CatalogObject` ID.
      # 
      # Results are paginated and sorted in descending order according to their
      # `occurred_at` timestamp (newest first).
      # 
      # There are no limits on how far back the caller can page. This endpoint can be
      # used to display recent changes for a specific item. For more
      # sophisticated queries, use a batch endpoint.
      #
      # @return [Square::GetInventoryChangesResponse]
      def changes(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryChangesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
