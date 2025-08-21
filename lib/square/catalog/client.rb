# frozen_string_literal: true

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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/batch-delete",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchDeleteCatalogObjectsResponse.load(_response.body)
        end

        raise _response.body
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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/batch-retrieve",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetCatalogObjectsResponse.load(_response.body)
        end

        raise _response.body
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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/batch-upsert",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchUpsertCatalogObjectsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves information about the Square Catalog API, such as batch size
      # limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
      #
      # @return [Square::Types::CatalogInfoResponse]
      def info(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/catalog/info"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CatalogInfoResponse.load(_response.body)
        end

        raise _response.body
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
        _query_param_names = %w[cursor types catalog_version]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/catalog/list",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListCatalogResponse.load(_response.body)
        end

        raise _response.body
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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchCatalogObjectsResponse.load(_response.body)
        end

        raise _response.body
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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/search-catalog-items",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchCatalogItemsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates the [CatalogModifierList](entity:CatalogModifierList) objects
      # that apply to the targeted [CatalogItem](entity:CatalogItem) without having
      # to perform an upsert on the entire item.
      #
      # @return [Square::Types::UpdateItemModifierListsResponse]
      def update_item_modifier_lists(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/update-item-modifier-lists",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateItemModifierListsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates the [CatalogTax](entity:CatalogTax) objects that apply to the
      # targeted [CatalogItem](entity:CatalogItem) without having to perform an
      # upsert on the entire item.
      #
      # @return [Square::Types::UpdateItemTaxesResponse]
      def update_item_taxes(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/catalog/update-item-taxes",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateItemTaxesResponse.load(_response.body)
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
