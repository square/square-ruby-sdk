# frozen_string_literal: true

module Square
  module Catalog
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
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
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::BatchDeleteCatalogObjectsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.batch_delete(object_ids: %w[W62UWFY35CWMYGVWK6TWJDNI AA27W3M2GGTF3H6AVPNB77CK])
      #
      # @return [Square::Types::BatchDeleteCatalogObjectsResponse]
      def batch_delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/batch-delete",
          body: Square::Catalog::Types::BatchDeleteCatalogObjectsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchDeleteCatalogObjectsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a set of objects based on the provided ID.
      # Each [CatalogItem](entity:CatalogItem) returned in the set includes all of its
      # child information including: all of its
      # [CatalogItemVariation](entity:CatalogItemVariation) objects, references to
      # its [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
      # any [CatalogTax](entity:CatalogTax) objects that apply to it.
      #
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::BatchGetCatalogObjectsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.batch_get(
      #     object_ids: %w[W62UWFY35CWMYGVWK6TWJDNI AA27W3M2GGTF3H6AVPNB77CK],
      #     include_related_objects: true
      #   )
      #
      # @return [Square::Types::BatchGetCatalogObjectsResponse]
      def batch_get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/batch-retrieve",
          body: Square::Catalog::Types::BatchGetCatalogObjectsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchGetCatalogObjectsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # This endpoint uses full-replacement semantics. The client must send the complete object, and any
      # field absent from the request is interpreted as an intentional clear. This logic applies to
      # nested objects as well. For example, omitting inlined children like variations will delete them.
      #
      # To ensure consistency, only one update request is processed at a time per seller account.
      # While one (batch or non-batch) update request is being processed, other (batched and non-batched)
      # update requests are rejected with the `429` error code. Prefer batching related changes into a
      # single call rather than issuing many small writes, since each write acquires the lock separately
      # and parallel writes to the same seller will contend with each other, producing `429` errors.
      #
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::BatchUpsertCatalogObjectsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.batch_upsert(
      #     idempotency_key: "789ff020-f723-43a9-b4b5-43b5dc1fa3dc",
      #     batches: [{
      #       objects: []
      #     }]
      #   )
      #
      # @return [Square::Types::BatchUpsertCatalogObjectsResponse]
      def batch_upsert(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/batch-upsert",
          body: Square::Catalog::Types::BatchUpsertCatalogObjectsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchUpsertCatalogObjectsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves information about the Square Catalog API, such as batch size
      # limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.info
      #
      # @return [Square::Types::CatalogInfoResponse]
      def info(request_options: {}, **_params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/catalog/info",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CatalogInfoResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a list of all [CatalogObject](entity:CatalogObject)s of the specified types in the catalog.
      #
      # The `types` parameter is specified as a comma-separated list of the
      # [CatalogObjectType](entity:CatalogObjectType) values,
      # for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".
      # Always specify `types` explicitly. When upgrading to a newer API version, omitting `types` may
      # cause new object types to appear in results that were not returned under the previous version.
      #
      # __Important:__ ListCatalog does not return deleted catalog items. To retrieve
      # deleted catalog items, use [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
      # and set the `include_deleted_objects` attribute value to `true`.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CatalogObject` in the
      # `objects` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListCatalogResponse`, including its other fields.
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
      # @option params [String, nil] :cursor
      # @option params [String, nil] :types
      # @option params [Integer, nil] :catalog_version
      #
      # @example
      #   client.catalog.list(
      #     cursor: "cursor",
      #     types: "types",
      #     catalog_version: 1000000
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["types"] = params[:types] if params.key?(:types)
        query_params["catalog_version"] = params[:catalog_version] if params.key?(:catalog_version)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :objects,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/catalog/list",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCatalogResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Searches for [CatalogObject](entity:CatalogObject) of any type by matching supported search attribute values,
      # excluding custom attribute values on items or item variations, against one or more of the specified query
      # filters.
      #
      # This (`SearchCatalogObjects`) endpoint differs from the
      # [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
      # endpoint in the following aspects:
      #
      # - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search
      # for any type of catalog objects.
      # - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that
      # contain custom attribute values, where `SearchCatalogObjects` does not.
      # - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item
      # variations, whereas `SearchCatalogObjects` does.
      # - The both endpoints have different call conventions, including the query filter formats.
      #
      # The `object_types` parameter is specified as a list of [CatalogObjectType](entity:CatalogObjectType) values.
      # Always specify `object_types` explicitly. When upgrading to a newer API version, omitting
      # `object_types` may cause new object types to appear in results that were not returned under
      # the previous version.
      #
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::SearchCatalogObjectsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.search(
      #     object_types: ["ITEM"],
      #     query: {
      #       prefix_query: {
      #         attribute_name: "name",
      #         attribute_prefix: "tea"
      #       }
      #     },
      #     limit: 100
      #   )
      #
      # @return [Square::Types::SearchCatalogObjectsResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/search",
          body: Square::Catalog::Types::SearchCatalogObjectsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchCatalogObjectsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Searches for catalog items or item variations by matching supported search attribute values, including
      # custom attribute values, against one or more of the specified query filters.
      #
      # This (`SearchCatalogItems`) endpoint differs from the
      # [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
      # endpoint in the following aspects:
      #
      # - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search
      # for any type of catalog objects.
      # - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that
      # contain custom attribute values, where `SearchCatalogObjects` does not.
      # - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item
      # variations, whereas `SearchCatalogObjects` does.
      # - The both endpoints use different call conventions, including the query filter formats.
      #
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::SearchCatalogItemsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.search_items(
      #     text_filter: "red",
      #     category_ids: ["WINE_CATEGORY_ID"],
      #     stock_levels: %w[OUT LOW],
      #     enabled_location_ids: ["ATL_LOCATION_ID"],
      #     limit: 100,
      #     sort_order: "ASC",
      #     product_types: ["REGULAR"],
      #     custom_attribute_filters: [{
      #       custom_attribute_definition_id: "VEGAN_DEFINITION_ID",
      #       bool_filter: true
      #     }, {
      #       custom_attribute_definition_id: "BRAND_DEFINITION_ID",
      #       string_filter: "Dark Horse"
      #     }, {
      #       key: "VINTAGE",
      #       number_filter: {
      #         min: "min",
      #         max: "max"
      #       }
      #     }, {
      #       custom_attribute_definition_id: "VARIETAL_DEFINITION_ID"
      #     }]
      #   )
      #
      # @return [Square::Types::SearchCatalogItemsResponse]
      def search_items(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/search-catalog-items",
          body: Square::Catalog::Types::SearchCatalogItemsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchCatalogItemsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the [CatalogModifierList](entity:CatalogModifierList) objects
      # that apply to the targeted [CatalogItem](entity:CatalogItem) without having
      # to perform an upsert on the entire item.
      #
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::UpdateItemModifierListsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.update_item_modifier_lists(
      #     item_ids: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      #     modifier_lists_to_enable: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      #     modifier_lists_to_disable: ["7WRC16CJZDVLSNDQ35PP6YAD"]
      #   )
      #
      # @return [Square::Types::UpdateItemModifierListsResponse]
      def update_item_modifier_lists(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/update-item-modifier-lists",
          body: Square::Catalog::Types::UpdateItemModifierListsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateItemModifierListsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the [CatalogTax](entity:CatalogTax) objects that apply to the
      # targeted [CatalogItem](entity:CatalogItem) without having to perform an
      # upsert on the entire item.
      #
      # @param request_options [Hash]
      # @param params [Square::Catalog::Types::UpdateItemTaxesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.catalog.update_item_taxes(
      #     item_ids: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      #     taxes_to_enable: ["4WRCNHCJZDVLSNDQ35PP6YAD"],
      #     taxes_to_disable: ["AQCEGCEBBQONINDOHRGZISEX"]
      #   )
      #
      # @return [Square::Types::UpdateItemTaxesResponse]
      def update_item_taxes(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/catalog/update-item-taxes",
          body: Square::Catalog::Types::UpdateItemTaxesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateItemTaxesResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::Images::Client]
      def images
        @images ||= Square::Catalog::Images::Client.new(client: @client)
      end

      # @return [Square::Object_::Client]
      def object
        @object ||= Square::Catalog::Object_::Client.new(client: @client)
      end
    end
  end
end
