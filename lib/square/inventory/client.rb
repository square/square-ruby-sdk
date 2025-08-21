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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/adjustment/#{params[:adjustment_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryAdjustmentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
      # with the provided `adjustment_id`.
      #
      # @return [Square::Types::GetInventoryAdjustmentResponse]
      def get_adjustment(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/adjustments/#{params[:adjustment_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryAdjustmentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deprecated version of [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::BatchChangeInventoryResponse]
      def deprecated_batch_change(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/inventory/batch-change",
          body: Square::Types::BatchChangeInventoryRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchChangeInventoryResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deprecated version of [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::BatchGetInventoryChangesResponse]
      def deprecated_batch_get_changes(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/inventory/batch-retrieve-changes",
          body: Square::Types::BatchRetrieveInventoryChangesRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryChangesResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deprecated version of [BatchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::BatchGetInventoryCountsResponse]
      def deprecated_batch_get_counts(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/inventory/batch-retrieve-counts",
          body: Square::Types::BatchGetInventoryCountsRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryCountsResponse.load(_response.body)
        end

        raise _response.body
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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/inventory/changes/batch-create",
          body: Square::Types::BatchChangeInventoryRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchChangeInventoryResponse.load(_response.body)
        end

        raise _response.body
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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/inventory/changes/batch-retrieve",
          body: Square::Types::BatchRetrieveInventoryChangesRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryChangesResponse.load(_response.body)
        end

        raise _response.body
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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/inventory/counts/batch-retrieve",
          body: Square::Types::BatchGetInventoryCountsRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetInventoryCountsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deprecated version of [RetrieveInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount) after the endpoint URL
      # is updated to conform to the standard convention.
      #
      # @return [Square::Types::GetInventoryPhysicalCountResponse]
      def deprecated_get_physical_count(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/physical-count/#{params[:physical_count_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryPhysicalCountResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
      # object with the provided `physical_count_id`.
      #
      # @return [Square::Types::GetInventoryPhysicalCountResponse]
      def get_physical_count(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/physical-counts/#{params[:physical_count_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryPhysicalCountResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns the [InventoryTransfer](entity:InventoryTransfer) object
      # with the provided `transfer_id`.
      #
      # @return [Square::Types::GetInventoryTransferResponse]
      def get_transfer(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/transfers/#{params[:transfer_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryTransferResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves the current calculated stock count for a given
      # [CatalogObject](entity:CatalogObject) at a given set of
      # [Location](entity:Location)s. Responses are paginated and unsorted.
      # For more sophisticated queries, use a batch endpoint.
      #
      # @return [Square::Types::GetInventoryCountResponse]
      def get(request_options: {}, **params)
        _query_param_names = %w[location_ids cursor]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/#{params[:catalog_object_id]}",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryCountResponse.load(_response.body)
        end

        raise _response.body
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
        _query_param_names = %w[location_ids cursor]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/inventory/#{params[:catalog_object_id]}/changes",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInventoryChangesResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::Mobile::Client]
      def mobile
        @mobile ||= Square::Mobile::Client.new(client: @raw_client)
      end

      # @return [Square::OAuth::Client]
      def oAuth
        @oAuth ||= Square::OAuth::Client.new(client: @raw_client)
      end

      # @return [Square::V1Transactions::Client]
      def v1Transactions
        @v1Transactions ||= Square::V1Transactions::Client.new(client: @raw_client)
      end

      # @return [Square::ApplePay::Client]
      def applePay
        @applePay ||= Square::ApplePay::Client.new(client: @raw_client)
      end

      # @return [Square::BankAccounts::Client]
      def bankAccounts
        @bankAccounts ||= Square::BankAccounts::Client.new(client: @raw_client)
      end

      # @return [Square::Bookings::Client]
      def bookings
        @bookings ||= Square::Bookings::Client.new(client: @raw_client)
      end

      # @return [Square::Cards::Client]
      def cards
        @cards ||= Square::Cards::Client.new(client: @raw_client)
      end

      # @return [Square::Catalog::Client]
      def catalog
        @catalog ||= Square::Catalog::Client.new(client: @raw_client)
      end

      # @return [Square::Customers::Client]
      def customers
        @customers ||= Square::Customers::Client.new(client: @raw_client)
      end

      # @return [Square::Devices::Client]
      def devices
        @devices ||= Square::Devices::Client.new(client: @raw_client)
      end

      # @return [Square::Disputes::Client]
      def disputes
        @disputes ||= Square::Disputes::Client.new(client: @raw_client)
      end

      # @return [Square::Employees::Client]
      def employees
        @employees ||= Square::Employees::Client.new(client: @raw_client)
      end

      # @return [Square::Events::Client]
      def events
        @events ||= Square::Events::Client.new(client: @raw_client)
      end

      # @return [Square::GiftCards::Client]
      def giftCards
        @giftCards ||= Square::GiftCards::Client.new(client: @raw_client)
      end

      # @return [Square::Inventory::Client]
      def inventory
        @inventory ||= Square::Inventory::Client.new(client: @raw_client)
      end

      # @return [Square::Invoices::Client]
      def invoices
        @invoices ||= Square::Invoices::Client.new(client: @raw_client)
      end

      # @return [Square::Labor::Client]
      def labor
        @labor ||= Square::Labor::Client.new(client: @raw_client)
      end

      # @return [Square::Locations::Client]
      def locations
        @locations ||= Square::Locations::Client.new(client: @raw_client)
      end

      # @return [Square::Loyalty::Client]
      def loyalty
        @loyalty ||= Square::Loyalty::Client.new(client: @raw_client)
      end

      # @return [Square::Merchants::Client]
      def merchants
        @merchants ||= Square::Merchants::Client.new(client: @raw_client)
      end

      # @return [Square::Checkout::Client]
      def checkout
        @checkout ||= Square::Checkout::Client.new(client: @raw_client)
      end

      # @return [Square::Orders::Client]
      def orders
        @orders ||= Square::Orders::Client.new(client: @raw_client)
      end

      # @return [Square::Payments::Client]
      def payments
        @payments ||= Square::Payments::Client.new(client: @raw_client)
      end

      # @return [Square::Payouts::Client]
      def payouts
        @payouts ||= Square::Payouts::Client.new(client: @raw_client)
      end

      # @return [Square::Refunds::Client]
      def refunds
        @refunds ||= Square::Refunds::Client.new(client: @raw_client)
      end

      # @return [Square::Sites::Client]
      def sites
        @sites ||= Square::Sites::Client.new(client: @raw_client)
      end

      # @return [Square::Snippets::Client]
      def snippets
        @snippets ||= Square::Snippets::Client.new(client: @raw_client)
      end

      # @return [Square::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Square::Subscriptions::Client.new(client: @raw_client)
      end

      # @return [Square::TeamMembers::Client]
      def teamMembers
        @teamMembers ||= Square::TeamMembers::Client.new(client: @raw_client)
      end

      # @return [Square::Team::Client]
      def team
        @team ||= Square::Team::Client.new(client: @raw_client)
      end

      # @return [Square::Terminal::Client]
      def terminal
        @terminal ||= Square::Terminal::Client.new(client: @raw_client)
      end

      # @return [Square::Vendors::Client]
      def vendors
        @vendors ||= Square::Vendors::Client.new(client: @raw_client)
      end

      # @return [Square::CashDrawers::Client]
      def cashDrawers
        @cashDrawers ||= Square::CashDrawers::Client.new(client: @raw_client)
      end

      # @return [Square::Webhooks::Client]
      def webhooks
        @webhooks ||= Square::Webhooks::Client.new(client: @raw_client)
      end
    end
  end
end
