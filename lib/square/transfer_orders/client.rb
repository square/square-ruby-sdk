# frozen_string_literal: true

module Square
  module TransferOrders
    class Client
      # @return [Square::TransferOrders::Client]
      def initialize(client:)
        @client = client
      end

      # Creates a new transfer order in [DRAFT](entity:TransferOrderStatus) status. A transfer order represents the intent
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
      # @return [Square::Types::CreateTransferOrderResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
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
      # @return [Square::Types::SearchTransferOrdersResponse]
      def search(request_options: {}, **params)
        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :transfer_orders,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/transfer-orders/search",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::SearchTransferOrdersResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
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
      # @return [Square::Types::RetrieveTransferOrderResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/transfer-orders/#{params[:transfer_order_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Updates an existing transfer order. This endpoint supports sparse updates,
      # allowing you to modify specific fields without affecting others.
      #
      # Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
      #
      # @return [Square::Types::UpdateTransferOrderResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["transfer_order_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/transfer-orders/#{params[:transfer_order_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Deletes a transfer order in [DRAFT](entity:TransferOrderStatus) status.
      # Only draft orders can be deleted. Once an order is started via
      # [StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder), it can no longer be deleted.
      #
      # Creates a [transfer_order.deleted](webhook:transfer_order.deleted) webhook event.
      #
      # @return [Square::Types::DeleteTransferOrderResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[version]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/transfer-orders/#{params[:transfer_order_id]}",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
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
      # @return [Square::Types::CancelTransferOrderResponse]
      def cancel(request_options: {}, **params)
        _path_param_names = ["transfer_order_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders/#{params[:transfer_order_id]}/cancel",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CancelTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Records receipt of [CatalogItemVariation](entity:CatalogItemVariation)s for a transfer order.
      # This endpoint supports partial receiving - you can receive items in multiple batches.
      #
      # For each line item, you can specify:
      # - Quantity received in good condition (added to destination inventory with [InventoryState](entity:InventoryState) of IN_STOCK)
      # - Quantity damaged during transit/handling (added to destination inventory with [InventoryState](entity:InventoryState) of WASTE)
      # - Quantity canceled (returned to source location's inventory)
      #
      # The order must be in [STARTED](entity:TransferOrderStatus) or [PARTIALLY_RECEIVED](entity:TransferOrderStatus) status.
      # Received quantities are added to the destination [Location](entity:Location)'s inventory according to their condition.
      # Canceled quantities are immediately returned to the source [Location](entity:Location)'s inventory.
      #
      # When all items are either received, damaged, or canceled, the order moves to
      # [COMPLETED](entity:TransferOrderStatus) status.
      #
      # Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
      #
      # @return [Square::Types::ReceiveTransferOrderResponse]
      def receive(request_options: {}, **params)
        _path_param_names = ["transfer_order_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders/#{params[:transfer_order_id]}/receive",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::ReceiveTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
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
      # @return [Square::Types::StartTransferOrderResponse]
      def start(request_options: {}, **params)
        _path_param_names = ["transfer_order_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/transfer-orders/#{params[:transfer_order_id]}/start",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::StartTransferOrderResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
