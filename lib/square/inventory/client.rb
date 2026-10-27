# frozen_string_literal: true

module Square
  module Inventory
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the standard and custom inventory adjustment reasons available
      # to the seller.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :include_deleted
      # @option params [Boolean, nil] :include_system_codes
      #
      # @example
      #   client.inventory.list_inventory_adjustment_reasons(
      #     include_deleted: true,
      #     include_system_codes: true
      #   )
      #
      # @return [Square::Types::ListInventoryAdjustmentReasonsResponse]
      def list_inventory_adjustment_reasons(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["include_deleted"] = params[:include_deleted] if params.key?(:include_deleted)
        query_params["include_system_codes"] = params[:include_system_codes] if params.key?(:include_system_codes)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/inventory/adjustment-reasons",
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
          (response.body.to_s.empty? ? nil : Square::Types::ListInventoryAdjustmentReasonsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a custom inventory adjustment reason.
      #
      # @param request_options [Hash]
      # @param params [Square::Inventory::Types::CreateInventoryAdjustmentReasonRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.create_inventory_adjustment_reason(
      #     idempotency_key: "27b2f2b1-1c2a-4b9e-8f3a-0d9c3a1e5b47",
      #     adjustment_reason: {
      #       id: {
      #         type: "CUSTOM"
      #       },
      #       name: "Donated to charity",
      #       direction: "DECREASE"
      #     }
      #   )
      #
      # @return [Square::Types::CreateInventoryAdjustmentReasonResponse]
      def create_inventory_adjustment_reason(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/adjustment-reasons/create",
          body: Square::Inventory::Types::CreateInventoryAdjustmentReasonRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateInventoryAdjustmentReasonResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Soft deletes a custom inventory adjustment reason.
      #
      # @param request_options [Hash]
      # @param params [Square::Inventory::Types::DeleteInventoryAdjustmentReasonRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.delete_inventory_adjustment_reason(reason_id: {
      #     type: "CUSTOM",
      #     custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      #   })
      #
      # @return [Square::Types::DeleteInventoryAdjustmentReasonResponse]
      def delete_inventory_adjustment_reason(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/adjustment-reasons/delete",
          body: Square::Inventory::Types::DeleteInventoryAdjustmentReasonRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DeleteInventoryAdjustmentReasonResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Restores a soft-deleted custom inventory adjustment reason.
      #
      # @param request_options [Hash]
      # @param params [Square::Inventory::Types::RestoreInventoryAdjustmentReasonRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.restore_inventory_adjustment_reason(reason_id: {
      #     type: "CUSTOM",
      #     custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      #   })
      #
      # @return [Square::Types::RestoreInventoryAdjustmentReasonResponse]
      def restore_inventory_adjustment_reason(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/adjustment-reasons/restore",
          body: Square::Inventory::Types::RestoreInventoryAdjustmentReasonRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::RestoreInventoryAdjustmentReasonResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the inventory adjustment reason identified by the provided
      # `reason_id`. Deleted custom reasons can be retrieved by ID.
      #
      # @param request_options [Hash]
      # @param params [Square::Inventory::Types::RetrieveInventoryAdjustmentReasonRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.retrieve_inventory_adjustment_reason(reason_id: {
      #     type: "CUSTOM",
      #     custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      #   })
      #
      # @return [Square::Types::RetrieveInventoryAdjustmentReasonResponse]
      def retrieve_inventory_adjustment_reason(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/adjustment-reasons/retrieve",
          body: Square::Inventory::Types::RetrieveInventoryAdjustmentReasonRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::RetrieveInventoryAdjustmentReasonResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a custom inventory adjustment reason.
      #
      # @param request_options [Hash]
      # @param params [Square::Inventory::Types::UpdateInventoryAdjustmentReasonRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.update_inventory_adjustment_reason(
      #     reason_id: {
      #       type: "CUSTOM",
      #       custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      #     },
      #     adjustment_reason: {
      #       id: {
      #         type: "CUSTOM",
      #         custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      #       },
      #       name: "Charitable donation"
      #     }
      #   )
      #
      # @return [Square::Types::UpdateInventoryAdjustmentReasonResponse]
      def update_inventory_adjustment_reason(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/inventory/adjustment-reasons/update",
          body: Square::Inventory::Types::UpdateInventoryAdjustmentReasonRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateInventoryAdjustmentReasonResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated version of [RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdjustment) after
      # the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :adjustment_id
      #
      # @example
      #   client.inventory.deprecated_get_adjustment(adjustment_id: "adjustment_id")
      #
      # @return [Square::Types::GetInventoryAdjustmentResponse]
      def deprecated_get_adjustment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/inventory/adjustment/#{URI.encode_uri_component(params[:adjustment_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetInventoryAdjustmentResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Applies an update to the provided adjustment.
      #
      # On success: returns the newly updated adjustment.
      # On failure: returns a list of related errors.
      #
      # @param request_options [Hash]
      # @param params [Square::Inventory::Types::UpdateInventoryAdjustmentRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.update_inventory_adjustment(
      #     idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      #     adjustment: {}
      #   )
      #
      # @return [Square::Types::UpdateInventoryAdjustmentResponse]
      def update_inventory_adjustment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/inventory/adjustments/update",
          body: Square::Inventory::Types::UpdateInventoryAdjustmentRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateInventoryAdjustmentResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
      # with the provided `adjustment_id`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :adjustment_id
      #
      # @example
      #   client.inventory.get_adjustment(adjustment_id: "adjustment_id")
      #
      # @return [Square::Types::GetInventoryAdjustmentResponse]
      def get_adjustment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/inventory/adjustments/#{URI.encode_uri_component(params[:adjustment_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetInventoryAdjustmentResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated version of [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::BatchChangeInventoryRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.deprecated_batch_change(
      #     idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      #     changes: [{
      #       type: "PHYSICAL_COUNT",
      #       physical_count: {
      #         reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92",
      #         catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI",
      #         state: "IN_STOCK",
      #         location_id: "C6W5YS5QM06F5",
      #         quantity: "53",
      #         team_member_id: "LRK57NSQ5X7PUD05",
      #         occurred_at: "2016-11-16T22:25:24.878Z"
      #       }
      #     }],
      #     ignore_unchanged_counts: true
      #   )
      #
      # @return [Square::Types::BatchChangeInventoryResponse]
      def deprecated_batch_change(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/batch-change",
          body: Square::Types::BatchChangeInventoryRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchChangeInventoryResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated version of [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
      # after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::BatchRetrieveInventoryChangesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.deprecated_batch_get_changes(
      #     catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      #     location_ids: ["C6W5YS5QM06F5"],
      #     types: ["PHYSICAL_COUNT"],
      #     states: ["IN_STOCK"],
      #     updated_after: "2016-11-01T00:00:00.000Z",
      #     updated_before: "2016-12-01T00:00:00.000Z"
      #   )
      #
      # @return [Square::Types::BatchGetInventoryChangesResponse]
      def deprecated_batch_get_changes(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/batch-retrieve-changes",
          body: Square::Types::BatchRetrieveInventoryChangesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchGetInventoryChangesResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deprecated version of [BatchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts) after
      # the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::BatchGetInventoryCountsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.deprecated_batch_get_counts(
      #     catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      #     location_ids: ["59TNP9SA8VGDA"],
      #     updated_after: "2016-11-16T00:00:00.000Z"
      #   )
      #
      # @return [Square::Types::BatchGetInventoryCountsResponse]
      def deprecated_batch_get_counts(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/batch-retrieve-counts",
          body: Square::Types::BatchGetInventoryCountsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchGetInventoryCountsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Applies adjustments and counts to the provided item quantities.
      #
      # On success: returns the current calculated counts for all objects
      # referenced in the request.
      # On failure: returns a list of related errors.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::BatchChangeInventoryRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.batch_create_changes(
      #     idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      #     changes: [{
      #       type: "PHYSICAL_COUNT",
      #       physical_count: {
      #         reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92",
      #         catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI",
      #         state: "IN_STOCK",
      #         location_id: "C6W5YS5QM06F5",
      #         quantity: "53",
      #         team_member_id: "LRK57NSQ5X7PUD05",
      #         occurred_at: "2016-11-16T22:25:24.878Z"
      #       }
      #     }],
      #     ignore_unchanged_counts: true
      #   )
      #
      # @return [Square::Types::BatchChangeInventoryResponse]
      def batch_create_changes(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/inventory/changes/batch-create",
          body: Square::Types::BatchChangeInventoryRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchChangeInventoryResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::InventoryChange` in the
      # `changes` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::BatchGetInventoryChangesResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::BatchRetrieveInventoryChangesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.batch_get_changes(
      #     catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      #     location_ids: ["C6W5YS5QM06F5"],
      #     types: ["PHYSICAL_COUNT"],
      #     states: ["IN_STOCK"],
      #     updated_after: "2016-11-01T00:00:00.000Z",
      #     updated_before: "2016-12-01T00:00:00.000Z"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def batch_get_changes(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :changes,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/inventory/changes/batch-retrieve",
            body: Square::Types::BatchRetrieveInventoryChangesRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::BatchGetInventoryChangesResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
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
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::InventoryCount` in the
      # `counts` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::BatchGetInventoryCountsResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::BatchGetInventoryCountsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.inventory.batch_get_counts(
      #     catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      #     location_ids: ["59TNP9SA8VGDA"],
      #     updated_after: "2016-11-16T00:00:00.000Z"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def batch_get_counts(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :counts,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/inventory/counts/batch-retrieve",
            body: Square::Types::BatchGetInventoryCountsRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::BatchGetInventoryCountsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Deprecated version of [RetrieveInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount)
      # after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :physical_count_id
      #
      # @example
      #   client.inventory.deprecated_get_physical_count(physical_count_id: "physical_count_id")
      #
      # @return [Square::Types::GetInventoryPhysicalCountResponse]
      def deprecated_get_physical_count(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/inventory/physical-count/#{URI.encode_uri_component(params[:physical_count_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetInventoryPhysicalCountResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
      # object with the provided `physical_count_id`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :physical_count_id
      #
      # @example
      #   client.inventory.get_physical_count(physical_count_id: "physical_count_id")
      #
      # @return [Square::Types::GetInventoryPhysicalCountResponse]
      def get_physical_count(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/inventory/physical-counts/#{URI.encode_uri_component(params[:physical_count_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetInventoryPhysicalCountResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves the current calculated stock count for a given
      # [CatalogObject](entity:CatalogObject) at a given set of
      # [Location](entity:Location)s. Responses are paginated and unsorted.
      # For more sophisticated queries, use a batch endpoint.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::InventoryCount` in the
      # `counts` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::GetInventoryCountResponse`, including its other fields.
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
      # @option params [String] :catalog_object_id
      # @option params [String, nil] :location_ids
      # @option params [String, nil] :cursor
      #
      # @example
      #   client.inventory.get(
      #     catalog_object_id: "catalog_object_id",
      #     location_ids: "location_ids",
      #     cursor: "cursor"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["location_ids"] = params[:location_ids] if params.key?(:location_ids)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :counts,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/inventory/#{URI.encode_uri_component(params[:catalog_object_id].to_s)}",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::GetInventoryCountResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Returns a set of physical counts and inventory adjustments for the
      # provided [CatalogObject](entity:CatalogObject) at the requested
      # [Location](entity:Location)s.
      #
      # You can achieve the same result by calling
      # [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
      # and having the `catalog_object_ids` list contain a single element of the `CatalogObject` ID.
      #
      # Results are paginated and sorted in descending order according to their
      # `occurred_at` timestamp (newest first).
      #
      # There are no limits on how far back the caller can page. This endpoint can be
      # used to display recent changes for a specific item. For more
      # sophisticated queries, use a batch endpoint.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::InventoryChange` in the
      # `changes` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::GetInventoryChangesResponse`, including its other fields.
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
      # @option params [String] :catalog_object_id
      # @option params [String, nil] :location_ids
      # @option params [String, nil] :cursor
      #
      # @example
      #   client.inventory.changes(
      #     catalog_object_id: "catalog_object_id",
      #     location_ids: "location_ids",
      #     cursor: "cursor"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def changes(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["location_ids"] = params[:location_ids] if params.key?(:location_ids)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :changes,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/inventory/#{URI.encode_uri_component(params[:catalog_object_id].to_s)}/changes",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::GetInventoryChangesResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
