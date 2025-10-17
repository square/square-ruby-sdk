# frozen_string_literal: true

module Square
  module Inventory
    class Client
      # @return [Square::Inventory::Client]
      def initialize(client:)
        @client = client
      end

      # Deprecated version of [RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdjustment) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::GetInventoryAdjustmentResponse]
      def deprecated_get_adjustment(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/inventory/adjustment/#{params[:adjustment_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetInventoryAdjustmentResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
      # with the provided `adjustment_id`.
      #
      # @return [Square::Types::GetInventoryAdjustmentResponse]
      def get_adjustment(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/inventory/adjustments/#{params[:adjustment_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetInventoryAdjustmentResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Deprecated version of [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::BatchChangeInventoryResponse]
      def deprecated_batch_change(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/inventory/batch-change",
          body: Square::Types::BatchChangeInventoryRequest.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::BatchChangeInventoryResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Deprecated version of [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::BatchGetInventoryChangesResponse]
      def deprecated_batch_get_changes(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/inventory/batch-retrieve-changes",
          body: Square::Types::BatchRetrieveInventoryChangesRequest.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::BatchGetInventoryChangesResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Deprecated version of [BatchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::BatchGetInventoryCountsResponse]
      def deprecated_batch_get_counts(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/inventory/batch-retrieve-counts",
          body: Square::Types::BatchGetInventoryCountsRequest.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::BatchGetInventoryCountsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Applies adjustments and counts to the provided item quantities.
      #
      # On success: returns the current calculated counts for all objects
      # referenced in the request.
      # On failure: returns a list of related errors.
      #
      # @return [Square::Types::BatchChangeInventoryResponse]
      def batch_create_changes(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/inventory/changes/batch-create",
          body: Square::Types::BatchChangeInventoryRequest.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::BatchChangeInventoryResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
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
      # @return [Square::Types::BatchGetInventoryChangesResponse]
      def batch_get_changes(request_options: {}, **params)
        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :changes,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/inventory/changes/batch-retrieve",
            body: Square::Types::BatchRetrieveInventoryChangesRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::BatchGetInventoryChangesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
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
      # @return [Square::Types::BatchGetInventoryCountsResponse]
      def batch_get_counts(request_options: {}, **params)
        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :counts,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/inventory/counts/batch-retrieve",
            body: Square::Types::BatchGetInventoryCountsRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::BatchGetInventoryCountsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end

      # Deprecated version of [RetrieveInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::GetInventoryPhysicalCountResponse]
      def deprecated_get_physical_count(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/inventory/physical-count/#{params[:physical_count_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetInventoryPhysicalCountResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
      # object with the provided `physical_count_id`.
      #
      # @return [Square::Types::GetInventoryPhysicalCountResponse]
      def get_physical_count(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/inventory/physical-counts/#{params[:physical_count_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetInventoryPhysicalCountResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns the [InventoryTransfer](entity:InventoryTransfer) object
      # with the provided `transfer_id`.
      #
      # @return [Square::Types::GetInventoryTransferResponse]
      def get_transfer(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/inventory/transfers/#{params[:transfer_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetInventoryTransferResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves the current calculated stock count for a given
      # [CatalogObject](entity:CatalogObject) at a given set of
      # [Location](entity:Location)s. Responses are paginated and unsorted.
      # For more sophisticated queries, use a batch endpoint.
      #
      # @return [Square::Types::GetInventoryCountResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[location_ids cursor]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :counts,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/inventory/#{params[:catalog_object_id]}",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetInventoryCountResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
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
      # @return [Square::Types::GetInventoryChangesResponse]
      def changes(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[location_ids cursor]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :changes,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/inventory/#{params[:catalog_object_id]}/changes",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetInventoryChangesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
