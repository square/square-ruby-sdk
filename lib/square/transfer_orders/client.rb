# frozen_string_literal: true

module Square
  module TransferOrders
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Creates a new transfer order in [DRAFT](entity:TransferOrderStatus) status. A transfer order represents the
      # intent
      # to move [CatalogItemVariation](entity:CatalogItemVariation)s from one [Location](entity:Location) to another.
      # The source and destination locations must be different and must belong to your Square account.
      #
      # In [DRAFT](entity:TransferOrderStatus) status, you can:
      # - Add or remove items
      # - Modify quantities
      # - Update shipping information
      # - Delete the entire order via [DeleteTransferOrder](api-endpoint:TransferOrders-DeleteTransferOrder)
      #
      # The request requires source_location_id and destination_location_id.
      # Inventory levels are not affected until the order is started via
      # [StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder).
      #
      # Common integration points:
      # - Sync with warehouse management systems
      # - Automate regular stock transfers
      # - Initialize transfers from inventory optimization systems
      #
      # Creates a [transfer_order.created](webhook:transfer_order.created) webhook event.
      #
      # @param request_options [Hash]
      # @param params [Square::TransferOrders::Types::CreateTransferOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer_orders.create(
      #     idempotency_key: "65cc0586-3e82-384s-b524-3885cffd52",
      #     transfer_order: {
      #       source_location_id: "EXAMPLE_SOURCE_LOCATION_ID_123",
      #       destination_location_id: "EXAMPLE_DEST_LOCATION_ID_456",
      #       expected_at: "2025-11-09T05:00:00Z",
      #       notes: "Example transfer order for inventory redistribution between locations",
      #       tracking_number: "TRACK123456789",
      #       created_by_team_member_id: "EXAMPLE_TEAM_MEMBER_ID_789",
      #       line_items: [{
      #         item_variation_id: "EXAMPLE_ITEM_VARIATION_ID_001",
      #         quantity_ordered: "5"
      #       }, {
      #         item_variation_id: "EXAMPLE_ITEM_VARIATION_ID_002",
      #         quantity_ordered: "3"
      #       }]
      #     }
      #   )
      #
      # @return [Square::Types::CreateTransferOrderResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders",
          body: Square::TransferOrders::Types::CreateTransferOrderRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Searches for transfer orders using filters. Returns a paginated list of matching
      # [TransferOrder](entity:TransferOrder)s sorted by creation date.
      #
      # Common search scenarios:
      # - Find orders for a source [Location](entity:Location)
      # - Find orders for a destination [Location](entity:Location)
      # - Find orders in a particular [TransferOrderStatus](entity:TransferOrderStatus)
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::TransferOrder` in the
      # `transfer_orders` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
      # as a `Square::Types::SearchTransferOrdersResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Square::TransferOrders::Types::SearchTransferOrdersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer_orders.search(
      #     query: {
      #       filter: {
      #         source_location_ids: ["EXAMPLE_SOURCE_LOCATION_ID_123"],
      #         destination_location_ids: ["EXAMPLE_DEST_LOCATION_ID_456"],
      #         statuses: %w[STARTED PARTIALLY_RECEIVED]
      #       },
      #       sort: {
      #         field: "UPDATED_AT",
      #         order: "DESC"
      #       }
      #     },
      #     cursor: "eyJsYXN0X3VwZGF0ZWRfYXQiOjE3NTMxMTg2NjQ4NzN9",
      #     limit: 10
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :transfer_orders,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/transfer-orders/search",
            body: Square::TransferOrders::Types::SearchTransferOrdersRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::SearchTransferOrdersResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Retrieves a specific [TransferOrder](entity:TransferOrder) by ID. Returns the complete
      # order details including:
      #
      # - Basic information (status, dates, notes)
      # - Line items with ordered and received quantities
      # - Source and destination [Location](entity:Location)s
      # - Tracking information (if available)
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :transfer_order_id
      #
      # @example
      #   client.transfer_orders.get(transfer_order_id: "transfer_order_id")
      #
      # @return [Square::Types::RetrieveTransferOrderResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/transfer-orders/#{URI.encode_uri_component(params[:transfer_order_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::RetrieveTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates an existing transfer order. This endpoint supports sparse updates,
      # allowing you to modify specific fields without affecting others.
      #
      # Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
      #
      # @param request_options [Hash]
      # @param params [Square::TransferOrders::Types::UpdateTransferOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :transfer_order_id
      #
      # @example
      #   client.transfer_orders.update(
      #     transfer_order_id: "transfer_order_id",
      #     idempotency_key: "f47ac10b-58cc-4372-a567-0e02b2c3d479",
      #     transfer_order: {
      #       source_location_id: "EXAMPLE_SOURCE_LOCATION_ID_789",
      #       destination_location_id: "EXAMPLE_DEST_LOCATION_ID_101",
      #       expected_at: "2025-11-10T08:00:00Z",
      #       notes: "Updated: Priority transfer due to low stock at destination",
      #       tracking_number: "TRACK987654321",
      #       line_items: [{
      #         uid: "1",
      #         quantity_ordered: "7"
      #       }, {
      #         item_variation_id: "EXAMPLE_NEW_ITEM_VARIATION_ID_003",
      #         quantity_ordered: "2"
      #       }, {
      #         uid: "2",
      #         remove: true
      #       }]
      #     },
      #     version: 1753109537351
      #   )
      #
      # @return [Square::Types::UpdateTransferOrderResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::TransferOrders::Types::UpdateTransferOrderRequest.new(params).to_h
        non_body_param_names = %w[transfer_order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/transfer-orders/#{URI.encode_uri_component(params[:transfer_order_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::UpdateTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes a transfer order in [DRAFT](entity:TransferOrderStatus) status.
      # Only draft orders can be deleted. Once an order is started via
      # [StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder), it can no longer be deleted.
      #
      # Creates a [transfer_order.deleted](webhook:transfer_order.deleted) webhook event.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :transfer_order_id
      # @option params [Integer, nil] :version
      #
      # @example
      #   client.transfer_orders.delete(
      #     transfer_order_id: "transfer_order_id",
      #     version: 1000000
      #   )
      #
      # @return [Square::Types::DeleteTransferOrderResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["version"] = params[:version] if params.key?(:version)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/transfer-orders/#{URI.encode_uri_component(params[:transfer_order_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::DeleteTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels a transfer order in [STARTED](entity:TransferOrderStatus) or
      # [PARTIALLY_RECEIVED](entity:TransferOrderStatus) status. Any unreceived quantities will no
      # longer be receivable and will be immediately returned to the source [Location](entity:Location)'s inventory.
      #
      # Common reasons for cancellation:
      # - Items no longer needed at destination
      # - Source location needs the inventory
      # - Order created in error
      #
      # Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
      #
      # @param request_options [Hash]
      # @param params [Square::TransferOrders::Types::CancelTransferOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :transfer_order_id
      #
      # @example
      #   client.transfer_orders.cancel(
      #     transfer_order_id: "transfer_order_id",
      #     idempotency_key: "65cc0586-3e82-4d08-b524-3885cffd52",
      #     version: 1753117449752
      #   )
      #
      # @return [Square::Types::CancelTransferOrderResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::TransferOrders::Types::CancelTransferOrderRequest.new(params).to_h
        non_body_param_names = %w[transfer_order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders/#{URI.encode_uri_component(params[:transfer_order_id].to_s)}/cancel",
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
          (response.body.to_s.empty? ? nil : Square::Types::CancelTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Records receipt of [CatalogItemVariation](entity:CatalogItemVariation)s for a transfer order.
      # This endpoint supports partial receiving - you can receive items in multiple batches.
      #
      # For each line item, you can specify:
      # - Quantity received in good condition (added to destination inventory with
      # [InventoryState](entity:InventoryState) of IN_STOCK)
      # - Quantity damaged during transit/handling (added to destination inventory with
      # [InventoryState](entity:InventoryState) of WASTE)
      # - Quantity canceled (returned to source location's inventory)
      #
      # The order must be in [STARTED](entity:TransferOrderStatus) or [PARTIALLY_RECEIVED](entity:TransferOrderStatus)
      # status.
      # Received quantities are added to the destination [Location](entity:Location)'s inventory according to their
      # condition.
      # Canceled quantities are immediately returned to the source [Location](entity:Location)'s inventory.
      #
      # When all items are either received, damaged, or canceled, the order moves to
      # [COMPLETED](entity:TransferOrderStatus) status.
      #
      # Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
      #
      # @param request_options [Hash]
      # @param params [Square::TransferOrders::Types::ReceiveTransferOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :transfer_order_id
      #
      # @example
      #   client.transfer_orders.receive(
      #     transfer_order_id: "transfer_order_id",
      #     idempotency_key: "EXAMPLE_IDEMPOTENCY_KEY_101",
      #     receipt: {
      #       line_items: [{
      #         transfer_order_line_uid: "1",
      #         quantity_received: "3",
      #         quantity_damaged: "1",
      #         quantity_canceled: "1"
      #       }, {
      #         transfer_order_line_uid: "2",
      #         quantity_received: "2",
      #         quantity_canceled: "1"
      #       }]
      #     },
      #     version: 1753118664873
      #   )
      #
      # @return [Square::Types::ReceiveTransferOrderResponse]
      def receive(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::TransferOrders::Types::ReceiveTransferOrderRequest.new(params).to_h
        non_body_param_names = %w[transfer_order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders/#{URI.encode_uri_component(params[:transfer_order_id].to_s)}/receive",
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
          (response.body.to_s.empty? ? nil : Square::Types::ReceiveTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Changes a [DRAFT](entity:TransferOrderStatus) transfer order to [STARTED](entity:TransferOrderStatus) status.
      # This decrements inventory at the source [Location](entity:Location) and marks it as in-transit.
      #
      # The order must be in [DRAFT](entity:TransferOrderStatus) status and have all required fields populated.
      # Once started, the order can no longer be deleted, but it can be canceled via
      # [CancelTransferOrder](api-endpoint:TransferOrders-CancelTransferOrder).
      #
      # Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
      #
      # @param request_options [Hash]
      # @param params [Square::TransferOrders::Types::StartTransferOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :transfer_order_id
      #
      # @example
      #   client.transfer_orders.start(
      #     transfer_order_id: "transfer_order_id",
      #     idempotency_key: "EXAMPLE_IDEMPOTENCY_KEY_789",
      #     version: 1753109537351
      #   )
      #
      # @return [Square::Types::StartTransferOrderResponse]
      def start(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::TransferOrders::Types::StartTransferOrderRequest.new(params).to_h
        non_body_param_names = %w[transfer_order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders/#{URI.encode_uri_component(params[:transfer_order_id].to_s)}/start",
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
          (response.body.to_s.empty? ? nil : Square::Types::StartTransferOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
