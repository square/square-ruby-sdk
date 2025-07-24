# frozen_string_literal: true
require_relative "../../requests"
require_relative "images/client"
require_relative "object/client"
require_relative "../types/batch_delete_catalog_objects_response"
require_relative "../types/batch_get_catalog_objects_response"
require_relative "../types/catalog_object_batch"
require_relative "../types/batch_upsert_catalog_objects_response"
require_relative "../types/catalog_info_response"
require_relative "../types/list_catalog_response"
require_relative "../types/catalog_object_type"
require_relative "../types/catalog_query"
require_relative "../types/search_catalog_objects_response"
require_relative "../types/search_catalog_items_request_stock_level"
require_relative "../types/sort_order"
require_relative "../types/catalog_item_product_type"
require_relative "../types/custom_attribute_filter"
require_relative "../types/archived_state"
require_relative "../types/search_catalog_items_response"
require_relative "../types/update_item_modifier_lists_response"
require_relative "../types/update_item_taxes_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class CatalogClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Catalog::ImagesClient] 
    attr_reader :images
  # @return [SquareApiClient::Catalog::ObjectClient] 
    attr_reader :object


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::CatalogClient]
    def initialize(request_client:)
      @request_client = request_client
      @images = SquareApiClient::Catalog::ImagesClient.new(request_client: request_client)
      @object = SquareApiClient::Catalog::ObjectClient.new(request_client: request_client)
    end
# Deletes a set of [CatalogItem](entity:CatalogItem)s based on the
#  provided list of target IDs and returns a set of successfully deleted IDs in
#  the response. Deletion is a cascading event such that all children of the
#  targeted object are also deleted. For example, deleting a CatalogItem will
#  also delete all of its [CatalogItemVariation](entity:CatalogItemVariation)
#  children.
#  `BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted
#  IDs can be deleted. The response will only include IDs that were
#  actually deleted.
#  To ensure consistency, only one delete request is processed at a time per seller
#  account.
#  While one (batch or non-batch) delete request is being processed, other (batched
#  and non-batched)
#  delete requests are rejected with the `429` error code.
    #
    # @param object_ids [Array<String>] The IDs of the CatalogObjects to be deleted. When an object is deleted, other
#  objects
#  in the graph that depend on that object will be deleted as well (for example,
#  deleting a
#  CatalogItem will delete its CatalogItemVariation.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchDeleteCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.batch_delete(object_ids: ["W62UWFY35CWMYGVWK6TWJDNI", "AA27W3M2GGTF3H6AVPNB77CK"])
    def batch_delete(object_ids:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), object_ids: object_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/batch-delete"
end
      SquareApiClient::BatchDeleteCatalogObjectsResponse.from_json(json_object: response.body)
    end
# Returns a set of objects based on the provided ID.
#  Each [CatalogItem](entity:CatalogItem) returned in the set includes all of its
#  child information including: all of its
#  [CatalogItemVariation](entity:CatalogItemVariation) objects, references to
#  its [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
#  any [CatalogTax](entity:CatalogTax) objects that apply to it.
    #
    # @param object_ids [Array<String>] The IDs of the CatalogObjects to be retrieved.
    # @param include_related_objects [Boolean] If `true`, the response will include additional objects that are related to the
#  requested objects. Related objects are defined as any objects referenced by ID
#  by the results in the `objects` field
#  of the response. These objects are put in the `related_objects` field. Setting
#  this to `true` is
#  helpful when the objects are needed for immediate display to a user.
#  This process only goes one level deep. Objects referenced by the related objects
#  will not be included. For example,
#  if the `objects` field of the response contains a CatalogItem, its associated
#  CatalogCategory objects, CatalogTax objects, CatalogImage objects and
#  CatalogModifierLists will be returned in the `related_objects` field of the
#  response. If the `objects` field of the response contains a
#  CatalogItemVariation,
#  its parent CatalogItem will be returned in the `related_objects` field of
#  the response.
#  Default value: `false`
    # @param catalog_version [Long] The specific version of the catalog objects to be included in the response.
#  This allows you to retrieve historical versions of objects. The specified
#  version value is matched against
#  the [CatalogObject](entity:CatalogObject)s' `version` attribute. If not
#  included, results will
#  be from the current version of the catalog.
    # @param include_deleted_objects [Boolean] Indicates whether to include (`true`) or not (`false`) in the response deleted
#  objects, namely, those with the `is_deleted` attribute set to `true`.
    # @param include_category_path_to_root [Boolean] Specifies whether or not to include the `path_to_root` list for each returned
#  category instance. The `path_to_root` list consists
#  of `CategoryPathToRootNode` objects and specifies the path that starts with the
#  immediate parent category of the returned category
#  and ends with its root category. If the returned category is a top-level
#  category, the `path_to_root` list is empty and is not returned
#  in the response payload.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.batch_get(object_ids: ["W62UWFY35CWMYGVWK6TWJDNI", "AA27W3M2GGTF3H6AVPNB77CK"], include_related_objects: true)
    def batch_get(object_ids:, include_related_objects: nil, catalog_version: nil, include_deleted_objects: nil, include_category_path_to_root: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), object_ids: object_ids, include_related_objects: include_related_objects, catalog_version: catalog_version, include_deleted_objects: include_deleted_objects, include_category_path_to_root: include_category_path_to_root }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/batch-retrieve"
end
      SquareApiClient::BatchGetCatalogObjectsResponse.from_json(json_object: response.body)
    end
# Creates or updates up to 10,000 target objects based on the provided
#  list of objects. The target objects are grouped into batches and each batch is
#  inserted/updated in an all-or-nothing manner. If an object within a batch is
#  malformed in some way, or violates a database constraint, the entire batch
#  containing that item will be disregarded. However, other batches in the same
#  request may still succeed. Each batch may contain up to 1,000 objects, and
#  batches will be processed in order as long as the total object count for the
#  request (items, variations, modifier lists, discounts, and taxes) is no more
#  than 10,000.
#  To ensure consistency, only one update request is processed at a time per seller
#  account.
#  While one (batch or non-batch) update request is being processed, other (batched
#  and non-batched)
#  update requests are rejected with the `429` error code.
    #
    # @param idempotency_key [String] A value you specify that uniquely identifies this
#  request among all your requests. A common way to create
#  a valid idempotency key is to use a Universally unique
#  identifier (UUID).
#  If you're unsure whether a particular request was successful,
#  you can reattempt it with the same idempotency key without
#  worrying about creating duplicate objects.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
    # @param batches [Array<Hash>] A batch of CatalogObjects to be inserted/updated atomically.
#  The objects within a batch will be inserted in an all-or-nothing fashion, i.e.,
#  if an error occurs
#  attempting to insert or update an object within a batch, the entire batch will
#  be rejected. However, an error
#  in one batch will not affect other batches within the same request.
#  For each object, its `updated_at` field is ignored and replaced with a current
#  timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates),
#  and its
#  `is_deleted` field must not be set to `true`.
#  To modify an existing object, supply its ID. To create a new object, use an ID
#  starting
#  with `#`. These IDs may be used to create relationships between an object and
#  attributes of
#  other objects that reference it. For example, you can create a CatalogItem with
#  ID `#ABC` and a CatalogItemVariation with its `item_id` attribute set to
#  `#ABC` in order to associate the CatalogItemVariation with its parent
#  CatalogItem.
#  Any `#`-prefixed IDs are valid only within a single atomic batch, and will be
#  replaced by server-generated IDs.
#  Each batch may contain up to 1,000 objects. The total number of objects across
#  all batches for a single request
#  may not exceed 10,000. If either of these limits is violated, an error will be
#  returned and no objects will
#  be inserted or updated.Request of type Array<SquareApiClient::CatalogObjectBatch>, as a Hash
    #   * :objects (Array<SquareApiClient::CatalogObject>) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchUpsertCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.batch_upsert(idempotency_key: "789ff020-f723-43a9-b4b5-43b5dc1fa3dc", batches: [{ objects: [{ type: "IMAGE", id: "#Tea", present_at_all_locations: true }, { type: "IMAGE", id: "#Coffee", present_at_all_locations: true }, { type: "ITEM", id: "#Beverages", present_at_all_locations: true }, { type: "TAX", id: "#SalesTax", present_at_all_locations: true, tax_data: { name: "Sales Tax", calculation_phase: TAX_SUBTOTAL_PHASE, inclusion_type: ADDITIVE, percentage: "5.0", applies_to_custom_amounts: true, enabled: true } }] }])
    def batch_upsert(idempotency_key:, batches:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, batches: batches }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/batch-upsert"
end
      SquareApiClient::BatchUpsertCatalogObjectsResponse.from_json(json_object: response.body)
    end
# Retrieves information about the Square Catalog API, such as batch size
#  limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
    #
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CatalogInfoResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.info
    def info(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/info"
end
      SquareApiClient::CatalogInfoResponse.from_json(json_object: response.body)
    end
# Returns a list of all [CatalogObject](entity:CatalogObject)s of the specified
#  types in the catalog.
#  The `types` parameter is specified as a comma-separated list of the
#  [CatalogObjectType](entity:CatalogObjectType) values,
#  for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`,
#  `DISCOUNT`, `TAX`, `IMAGE`".
#  __Important:__ ListCatalog does not return deleted catalog items. To retrieve
#  deleted catalog items, use
#  [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
#  and set the `include_deleted_objects` attribute value to `true`.
    #
    # @param cursor [String] The pagination cursor returned in the previous response. Leave unset for an
#  initial request.
#  The page size is currently set to be 100.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param types [String] An optional case-insensitive, comma-separated list of object types to retrieve.
#  The valid values are defined in the
#  [CatalogObjectType](entity:CatalogObjectType) enum, for example,
#  `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,
#  `MODIFIER`, `MODIFIER_LIST`, `IMAGE`, etc.
#  If this is unspecified, the operation returns objects of all the top level types
#  at the version
#  of the Square API used to make the request. Object types that are nested onto
#  other object types
#  are not included in the defaults.
#  At the current API version the default object types are:
#  ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST,
#  PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
#  SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION,
#  QUICK_AMOUNT_SETTINGS.
    # @param catalog_version [Long] The specific version of the catalog objects to be included in the response.
#  This allows you to retrieve historical versions of objects. The specified
#  version value is matched against
#  the [CatalogObject](entity:CatalogObject)s' `version` attribute.  If not
#  included, results will be from the
#  current version of the catalog.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListCatalogResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.list
    def list(cursor: nil, types: nil, catalog_version: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "types": types, "catalog_version": catalog_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/list"
end
      SquareApiClient::ListCatalogResponse.from_json(json_object: response.body)
    end
# Searches for [CatalogObject](entity:CatalogObject) of any type by matching
#  supported search attribute values,
#  excluding custom attribute values on items or item variations, against one or
#  more of the specified query filters.
#  This (`SearchCatalogObjects`) endpoint differs from the
#  [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
#  endpoint in the following aspects:
#  - `SearchCatalogItems` can only search for items or item variations, whereas
#  `SearchCatalogObjects` can search for any type of catalog objects.
#  - `SearchCatalogItems` supports the custom attribute query filters to return
#  items or item variations that contain custom attribute values, where
#  `SearchCatalogObjects` does not.
#  - `SearchCatalogItems` does not support the `include_deleted_objects` filter to
#  search for deleted items or item variations, whereas `SearchCatalogObjects`
#  does.
#  - The both endpoints have different call conventions, including the query filter
#  formats.
    #
    # @param cursor [String] The pagination cursor returned in the previous response. Leave unset for an
#  initial request.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param object_types [Array<SquareApiClient::CatalogObjectType>] The desired set of object types to appear in the search results.
#  If this is unspecified, the operation returns objects of all the top level types
#  at the version
#  of the Square API used to make the request. Object types that are nested onto
#  other object types
#  are not included in the defaults.
#  At the current API version the default object types are:
#  ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST,
#  PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
#  SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION,
#  QUICK_AMOUNT_SETTINGS.
#  Note that if you wish for the query to return objects belonging to nested types
#  (i.e., COMPONENT, IMAGE,
#  ITEM_OPTION_VAL, ITEM_VARIATION, or MODIFIER), you must explicitly include all
#  the types of interest
#  in this field.
    # @param include_deleted_objects [Boolean] If `true`, deleted objects will be included in the results. Defaults to `false`.
#  Deleted objects will have their `is_deleted` field set to `true`. If
#  `include_deleted_objects` is `true`, then the `include_category_path_to_root`
#  request parameter must be `false`. Both properties cannot be `true` at the same
#  time.
    # @param include_related_objects [Boolean] If `true`, the response will include additional objects that are related to the
#  requested objects. Related objects are objects that are referenced by object ID
#  by the objects
#  in the response. This is helpful if the objects are being fetched for immediate
#  display to a user.
#  This process only goes one level deep. Objects referenced by the related objects
#  will not be included.
#  For example:
#  If the `objects` field of the response contains a CatalogItem, its associated
#  CatalogCategory objects, CatalogTax objects, CatalogImage objects and
#  CatalogModifierLists will be returned in the `related_objects` field of the
#  response. If the `objects` field of the response contains a
#  CatalogItemVariation,
#  its parent CatalogItem will be returned in the `related_objects` field of
#  the response.
#  Default value: `false`
    # @param begin_time [String] Return objects modified after this
#  timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates),
#  in RFC 3339
#  format, e.g., `2016-09-04T23:59:33.123Z`. The timestamp is exclusive - objects
#  with a
#  timestamp equal to `begin_time` will not be included in the response.
    # @param query [Hash] A query to be used to filter or sort the results. If no query is specified, the
#  entire catalog will be returned.Request of type SquareApiClient::CatalogQuery, as a Hash
    #   * :sorted_attribute_query (Hash)
    #     * :attribute_name (String) 
    #     * :initial_attribute_value (String) 
    #     * :sort_order (SquareApiClient::SortOrder) 
    #   * :exact_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_value (String) 
    #   * :set_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_values (Array<String>) 
    #   * :prefix_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_prefix (String) 
    #   * :range_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_min_value (Long) 
    #     * :attribute_max_value (Long) 
    #   * :text_query (Hash)
    #     * :keywords (Array<String>) 
    #   * :items_for_tax_query (Hash)
    #     * :tax_ids (Array<String>) 
    #   * :items_for_modifier_list_query (Hash)
    #     * :modifier_list_ids (Array<String>) 
    #   * :items_for_item_options_query (Hash)
    #     * :item_option_ids (Array<String>) 
    #   * :item_variations_for_item_option_values_query (Hash)
    #     * :item_option_value_ids (Array<String>) 
    # @param limit [Integer] A limit on the number of results to be returned in a single page. The limit is
#  advisory -
#  the implementation may return more or fewer results. If the supplied limit is
#  negative, zero, or
#  is higher than the maximum limit of 1,000, it will be ignored.
    # @param include_category_path_to_root [Boolean] Specifies whether or not to include the `path_to_root` list for each returned
#  category instance. The `path_to_root` list consists of `CategoryPathToRootNode`
#  objects and specifies the path that starts with the immediate parent category of
#  the returned category and ends with its root category. If the returned category
#  is a top-level category, the `path_to_root` list is empty and is not returned in
#  the response payload. If `include_category_path_to_root` is `true`, then the
#  `include_deleted_objects` request parameter must be `false`. Both properties
#  cannot be `true` at the same time.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.search(
#    object_types: [ITEM],
#    query: { prefix_query: { attribute_name: "name", attribute_prefix: "tea" } },
#    limit: 100
#  )
    def search(cursor: nil, object_types: nil, include_deleted_objects: nil, include_related_objects: nil, begin_time: nil, query: nil, limit: nil, include_category_path_to_root: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, object_types: object_types, include_deleted_objects: include_deleted_objects, include_related_objects: include_related_objects, begin_time: begin_time, query: query, limit: limit, include_category_path_to_root: include_category_path_to_root }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/search"
end
      SquareApiClient::SearchCatalogObjectsResponse.from_json(json_object: response.body)
    end
# Searches for catalog items or item variations by matching supported search
#  attribute values, including
#  custom attribute values, against one or more of the specified query filters.
#  This (`SearchCatalogItems`) endpoint differs from the
#  [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
#  endpoint in the following aspects:
#  - `SearchCatalogItems` can only search for items or item variations, whereas
#  `SearchCatalogObjects` can search for any type of catalog objects.
#  - `SearchCatalogItems` supports the custom attribute query filters to return
#  items or item variations that contain custom attribute values, where
#  `SearchCatalogObjects` does not.
#  - `SearchCatalogItems` does not support the `include_deleted_objects` filter to
#  search for deleted items or item variations, whereas `SearchCatalogObjects`
#  does.
#  - The both endpoints use different call conventions, including the query filter
#  formats.
    #
    # @param text_filter [String] The text filter expression to return items or item variations containing
#  specified text in
#  the `name`, `description`, or `abbreviation` attribute value of an item, or in
#  the `name`, `sku`, or `upc` attribute value of an item variation.
    # @param category_ids [Array<String>] The category id query expression to return items containing the specified
#  category IDs.
    # @param stock_levels [Array<SquareApiClient::SearchCatalogItemsRequestStockLevel>] The stock-level query expression to return item variations with the specified
#  stock levels.
#  See
#  [SearchCatalogItemsRequestStockLevel](#type-searchcatalogitemsrequeststocklevel)
#  for possible values
    # @param enabled_location_ids [Array<String>] The enabled-location query expression to return items and item variations having
#  specified enabled locations.
    # @param cursor [String] The pagination token, returned in the previous response, used to fetch the next
#  batch of pending results.
    # @param limit [Integer] The maximum number of results to return per page. The default value is 100.
    # @param sort_order [SquareApiClient::SortOrder] The order to sort the results by item names. The default sort order is ascending
#  (`ASC`).
#  See [SortOrder](#type-sortorder) for possible values
    # @param product_types [Array<SquareApiClient::CatalogItemProductType>] The product types query expression to return items or item variations having the
#  specified product types.
    # @param custom_attribute_filters [Array<Hash>] The customer-attribute filter to return items or item variations matching the
#  specified
#  custom attribute expressions. A maximum number of 10 custom attribute
#  expressions are supported in
#  a single call to the
#  [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint.Request of type Array<SquareApiClient::CustomAttributeFilter>, as a Hash
    #   * :custom_attribute_definition_id (String) 
    #   * :key (String) 
    #   * :string_filter (String) 
    #   * :number_filter (Hash)
    #     * :min (String) 
    #     * :max (String) 
    #   * :selection_uids_filter (Array<String>) 
    #   * :bool_filter (Boolean) 
    # @param archived_state [SquareApiClient::ArchivedState] The query filter to return not archived (`ARCHIVED_STATE_NOT_ARCHIVED`),
#  archived (`ARCHIVED_STATE_ARCHIVED`), or either type (`ARCHIVED_STATE_ALL`) of
#  items.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchCatalogItemsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.search_items(
#    text_filter: "red",
#    category_ids: ["WINE_CATEGORY_ID"],
#    stock_levels: [OUT, LOW],
#    enabled_location_ids: ["ATL_LOCATION_ID"],
#    limit: 100,
#    sort_order: ASC,
#    product_types: [REGULAR],
#    custom_attribute_filters: [{ custom_attribute_definition_id: "VEGAN_DEFINITION_ID", bool_filter: true }, { custom_attribute_definition_id: "BRAND_DEFINITION_ID", string_filter: "Dark Horse" }, { key: "VINTAGE", number_filter: { min: "min", max: "max" } }, { custom_attribute_definition_id: "VARIETAL_DEFINITION_ID" }]
#  )
    def search_items(text_filter: nil, category_ids: nil, stock_levels: nil, enabled_location_ids: nil, cursor: nil, limit: nil, sort_order: nil, product_types: nil, custom_attribute_filters: nil, archived_state: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), text_filter: text_filter, category_ids: category_ids, stock_levels: stock_levels, enabled_location_ids: enabled_location_ids, cursor: cursor, limit: limit, sort_order: sort_order, product_types: product_types, custom_attribute_filters: custom_attribute_filters, archived_state: archived_state }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/search-catalog-items"
end
      SquareApiClient::SearchCatalogItemsResponse.from_json(json_object: response.body)
    end
# Updates the [CatalogModifierList](entity:CatalogModifierList) objects
#  that apply to the targeted [CatalogItem](entity:CatalogItem) without having
#  to perform an upsert on the entire item.
    #
    # @param item_ids [Array<String>] The IDs of the catalog items associated with the CatalogModifierList objects
#  being updated.
    # @param modifier_lists_to_enable [Array<String>] The IDs of the CatalogModifierList objects to enable for the CatalogItem.
#  At least one of `modifier_lists_to_enable` or `modifier_lists_to_disable` must
#  be specified.
    # @param modifier_lists_to_disable [Array<String>] The IDs of the CatalogModifierList objects to disable for the CatalogItem.
#  At least one of `modifier_lists_to_enable` or `modifier_lists_to_disable` must
#  be specified.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateItemModifierListsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.update_item_modifier_lists(
#    item_ids: ["H42BRLUJ5KTZTTMPVSLFAACQ", "2JXOBJIHCWBQ4NZ3RIXQGJA6"],
#    modifier_lists_to_enable: ["H42BRLUJ5KTZTTMPVSLFAACQ", "2JXOBJIHCWBQ4NZ3RIXQGJA6"],
#    modifier_lists_to_disable: ["7WRC16CJZDVLSNDQ35PP6YAD"]
#  )
    def update_item_modifier_lists(item_ids:, modifier_lists_to_enable: nil, modifier_lists_to_disable: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), item_ids: item_ids, modifier_lists_to_enable: modifier_lists_to_enable, modifier_lists_to_disable: modifier_lists_to_disable }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/update-item-modifier-lists"
end
      SquareApiClient::UpdateItemModifierListsResponse.from_json(json_object: response.body)
    end
# Updates the [CatalogTax](entity:CatalogTax) objects that apply to the
#  targeted [CatalogItem](entity:CatalogItem) without having to perform an
#  upsert on the entire item.
    #
    # @param item_ids [Array<String>] IDs for the CatalogItems associated with the CatalogTax objects being updated.
#  No more than 1,000 IDs may be provided.
    # @param taxes_to_enable [Array<String>] IDs of the CatalogTax objects to enable.
#  At least one of `taxes_to_enable` or `taxes_to_disable` must be specified.
    # @param taxes_to_disable [Array<String>] IDs of the CatalogTax objects to disable.
#  At least one of `taxes_to_enable` or `taxes_to_disable` must be specified.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateItemTaxesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.update_item_taxes(
#    item_ids: ["H42BRLUJ5KTZTTMPVSLFAACQ", "2JXOBJIHCWBQ4NZ3RIXQGJA6"],
#    taxes_to_enable: ["4WRCNHCJZDVLSNDQ35PP6YAD"],
#    taxes_to_disable: ["AQCEGCEBBQONINDOHRGZISEX"]
#  )
    def update_item_taxes(item_ids:, taxes_to_enable: nil, taxes_to_disable: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), item_ids: item_ids, taxes_to_enable: taxes_to_enable, taxes_to_disable: taxes_to_disable }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/update-item-taxes"
end
      SquareApiClient::UpdateItemTaxesResponse.from_json(json_object: response.body)
    end
  end
  class AsyncCatalogClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Catalog::ImagesClient] 
    attr_reader :images
  # @return [SquareApiClient::Catalog::ObjectClient] 
    attr_reader :object


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncCatalogClient]
    def initialize(request_client:)
      @request_client = request_client
      @images = SquareApiClient::Catalog::AsyncImagesClient.new(request_client: request_client)
      @object = SquareApiClient::Catalog::AsyncObjectClient.new(request_client: request_client)
    end
# Deletes a set of [CatalogItem](entity:CatalogItem)s based on the
#  provided list of target IDs and returns a set of successfully deleted IDs in
#  the response. Deletion is a cascading event such that all children of the
#  targeted object are also deleted. For example, deleting a CatalogItem will
#  also delete all of its [CatalogItemVariation](entity:CatalogItemVariation)
#  children.
#  `BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted
#  IDs can be deleted. The response will only include IDs that were
#  actually deleted.
#  To ensure consistency, only one delete request is processed at a time per seller
#  account.
#  While one (batch or non-batch) delete request is being processed, other (batched
#  and non-batched)
#  delete requests are rejected with the `429` error code.
    #
    # @param object_ids [Array<String>] The IDs of the CatalogObjects to be deleted. When an object is deleted, other
#  objects
#  in the graph that depend on that object will be deleted as well (for example,
#  deleting a
#  CatalogItem will delete its CatalogItemVariation.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchDeleteCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.batch_delete(object_ids: ["W62UWFY35CWMYGVWK6TWJDNI", "AA27W3M2GGTF3H6AVPNB77CK"])
    def batch_delete(object_ids:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), object_ids: object_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/batch-delete"
end
        SquareApiClient::BatchDeleteCatalogObjectsResponse.from_json(json_object: response.body)
      end
    end
# Returns a set of objects based on the provided ID.
#  Each [CatalogItem](entity:CatalogItem) returned in the set includes all of its
#  child information including: all of its
#  [CatalogItemVariation](entity:CatalogItemVariation) objects, references to
#  its [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
#  any [CatalogTax](entity:CatalogTax) objects that apply to it.
    #
    # @param object_ids [Array<String>] The IDs of the CatalogObjects to be retrieved.
    # @param include_related_objects [Boolean] If `true`, the response will include additional objects that are related to the
#  requested objects. Related objects are defined as any objects referenced by ID
#  by the results in the `objects` field
#  of the response. These objects are put in the `related_objects` field. Setting
#  this to `true` is
#  helpful when the objects are needed for immediate display to a user.
#  This process only goes one level deep. Objects referenced by the related objects
#  will not be included. For example,
#  if the `objects` field of the response contains a CatalogItem, its associated
#  CatalogCategory objects, CatalogTax objects, CatalogImage objects and
#  CatalogModifierLists will be returned in the `related_objects` field of the
#  response. If the `objects` field of the response contains a
#  CatalogItemVariation,
#  its parent CatalogItem will be returned in the `related_objects` field of
#  the response.
#  Default value: `false`
    # @param catalog_version [Long] The specific version of the catalog objects to be included in the response.
#  This allows you to retrieve historical versions of objects. The specified
#  version value is matched against
#  the [CatalogObject](entity:CatalogObject)s' `version` attribute. If not
#  included, results will
#  be from the current version of the catalog.
    # @param include_deleted_objects [Boolean] Indicates whether to include (`true`) or not (`false`) in the response deleted
#  objects, namely, those with the `is_deleted` attribute set to `true`.
    # @param include_category_path_to_root [Boolean] Specifies whether or not to include the `path_to_root` list for each returned
#  category instance. The `path_to_root` list consists
#  of `CategoryPathToRootNode` objects and specifies the path that starts with the
#  immediate parent category of the returned category
#  and ends with its root category. If the returned category is a top-level
#  category, the `path_to_root` list is empty and is not returned
#  in the response payload.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchGetCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.batch_get(object_ids: ["W62UWFY35CWMYGVWK6TWJDNI", "AA27W3M2GGTF3H6AVPNB77CK"], include_related_objects: true)
    def batch_get(object_ids:, include_related_objects: nil, catalog_version: nil, include_deleted_objects: nil, include_category_path_to_root: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), object_ids: object_ids, include_related_objects: include_related_objects, catalog_version: catalog_version, include_deleted_objects: include_deleted_objects, include_category_path_to_root: include_category_path_to_root }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/batch-retrieve"
end
        SquareApiClient::BatchGetCatalogObjectsResponse.from_json(json_object: response.body)
      end
    end
# Creates or updates up to 10,000 target objects based on the provided
#  list of objects. The target objects are grouped into batches and each batch is
#  inserted/updated in an all-or-nothing manner. If an object within a batch is
#  malformed in some way, or violates a database constraint, the entire batch
#  containing that item will be disregarded. However, other batches in the same
#  request may still succeed. Each batch may contain up to 1,000 objects, and
#  batches will be processed in order as long as the total object count for the
#  request (items, variations, modifier lists, discounts, and taxes) is no more
#  than 10,000.
#  To ensure consistency, only one update request is processed at a time per seller
#  account.
#  While one (batch or non-batch) update request is being processed, other (batched
#  and non-batched)
#  update requests are rejected with the `429` error code.
    #
    # @param idempotency_key [String] A value you specify that uniquely identifies this
#  request among all your requests. A common way to create
#  a valid idempotency key is to use a Universally unique
#  identifier (UUID).
#  If you're unsure whether a particular request was successful,
#  you can reattempt it with the same idempotency key without
#  worrying about creating duplicate objects.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
    # @param batches [Array<Hash>] A batch of CatalogObjects to be inserted/updated atomically.
#  The objects within a batch will be inserted in an all-or-nothing fashion, i.e.,
#  if an error occurs
#  attempting to insert or update an object within a batch, the entire batch will
#  be rejected. However, an error
#  in one batch will not affect other batches within the same request.
#  For each object, its `updated_at` field is ignored and replaced with a current
#  timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates),
#  and its
#  `is_deleted` field must not be set to `true`.
#  To modify an existing object, supply its ID. To create a new object, use an ID
#  starting
#  with `#`. These IDs may be used to create relationships between an object and
#  attributes of
#  other objects that reference it. For example, you can create a CatalogItem with
#  ID `#ABC` and a CatalogItemVariation with its `item_id` attribute set to
#  `#ABC` in order to associate the CatalogItemVariation with its parent
#  CatalogItem.
#  Any `#`-prefixed IDs are valid only within a single atomic batch, and will be
#  replaced by server-generated IDs.
#  Each batch may contain up to 1,000 objects. The total number of objects across
#  all batches for a single request
#  may not exceed 10,000. If either of these limits is violated, an error will be
#  returned and no objects will
#  be inserted or updated.Request of type Array<SquareApiClient::CatalogObjectBatch>, as a Hash
    #   * :objects (Array<SquareApiClient::CatalogObject>) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchUpsertCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.batch_upsert(idempotency_key: "789ff020-f723-43a9-b4b5-43b5dc1fa3dc", batches: [{ objects: [{ type: "IMAGE", id: "#Tea", present_at_all_locations: true }, { type: "IMAGE", id: "#Coffee", present_at_all_locations: true }, { type: "ITEM", id: "#Beverages", present_at_all_locations: true }, { type: "TAX", id: "#SalesTax", present_at_all_locations: true, tax_data: { name: "Sales Tax", calculation_phase: TAX_SUBTOTAL_PHASE, inclusion_type: ADDITIVE, percentage: "5.0", applies_to_custom_amounts: true, enabled: true } }] }])
    def batch_upsert(idempotency_key:, batches:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, batches: batches }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/batch-upsert"
end
        SquareApiClient::BatchUpsertCatalogObjectsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves information about the Square Catalog API, such as batch size
#  limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
    #
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CatalogInfoResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.info
    def info(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/info"
end
        SquareApiClient::CatalogInfoResponse.from_json(json_object: response.body)
      end
    end
# Returns a list of all [CatalogObject](entity:CatalogObject)s of the specified
#  types in the catalog.
#  The `types` parameter is specified as a comma-separated list of the
#  [CatalogObjectType](entity:CatalogObjectType) values,
#  for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`,
#  `DISCOUNT`, `TAX`, `IMAGE`".
#  __Important:__ ListCatalog does not return deleted catalog items. To retrieve
#  deleted catalog items, use
#  [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
#  and set the `include_deleted_objects` attribute value to `true`.
    #
    # @param cursor [String] The pagination cursor returned in the previous response. Leave unset for an
#  initial request.
#  The page size is currently set to be 100.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param types [String] An optional case-insensitive, comma-separated list of object types to retrieve.
#  The valid values are defined in the
#  [CatalogObjectType](entity:CatalogObjectType) enum, for example,
#  `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,
#  `MODIFIER`, `MODIFIER_LIST`, `IMAGE`, etc.
#  If this is unspecified, the operation returns objects of all the top level types
#  at the version
#  of the Square API used to make the request. Object types that are nested onto
#  other object types
#  are not included in the defaults.
#  At the current API version the default object types are:
#  ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST,
#  PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
#  SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION,
#  QUICK_AMOUNT_SETTINGS.
    # @param catalog_version [Long] The specific version of the catalog objects to be included in the response.
#  This allows you to retrieve historical versions of objects. The specified
#  version value is matched against
#  the [CatalogObject](entity:CatalogObject)s' `version` attribute.  If not
#  included, results will be from the
#  current version of the catalog.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListCatalogResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.list
    def list(cursor: nil, types: nil, catalog_version: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "types": types, "catalog_version": catalog_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/list"
end
        SquareApiClient::ListCatalogResponse.from_json(json_object: response.body)
      end
    end
# Searches for [CatalogObject](entity:CatalogObject) of any type by matching
#  supported search attribute values,
#  excluding custom attribute values on items or item variations, against one or
#  more of the specified query filters.
#  This (`SearchCatalogObjects`) endpoint differs from the
#  [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
#  endpoint in the following aspects:
#  - `SearchCatalogItems` can only search for items or item variations, whereas
#  `SearchCatalogObjects` can search for any type of catalog objects.
#  - `SearchCatalogItems` supports the custom attribute query filters to return
#  items or item variations that contain custom attribute values, where
#  `SearchCatalogObjects` does not.
#  - `SearchCatalogItems` does not support the `include_deleted_objects` filter to
#  search for deleted items or item variations, whereas `SearchCatalogObjects`
#  does.
#  - The both endpoints have different call conventions, including the query filter
#  formats.
    #
    # @param cursor [String] The pagination cursor returned in the previous response. Leave unset for an
#  initial request.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param object_types [Array<SquareApiClient::CatalogObjectType>] The desired set of object types to appear in the search results.
#  If this is unspecified, the operation returns objects of all the top level types
#  at the version
#  of the Square API used to make the request. Object types that are nested onto
#  other object types
#  are not included in the defaults.
#  At the current API version the default object types are:
#  ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST,
#  PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
#  SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION,
#  QUICK_AMOUNT_SETTINGS.
#  Note that if you wish for the query to return objects belonging to nested types
#  (i.e., COMPONENT, IMAGE,
#  ITEM_OPTION_VAL, ITEM_VARIATION, or MODIFIER), you must explicitly include all
#  the types of interest
#  in this field.
    # @param include_deleted_objects [Boolean] If `true`, deleted objects will be included in the results. Defaults to `false`.
#  Deleted objects will have their `is_deleted` field set to `true`. If
#  `include_deleted_objects` is `true`, then the `include_category_path_to_root`
#  request parameter must be `false`. Both properties cannot be `true` at the same
#  time.
    # @param include_related_objects [Boolean] If `true`, the response will include additional objects that are related to the
#  requested objects. Related objects are objects that are referenced by object ID
#  by the objects
#  in the response. This is helpful if the objects are being fetched for immediate
#  display to a user.
#  This process only goes one level deep. Objects referenced by the related objects
#  will not be included.
#  For example:
#  If the `objects` field of the response contains a CatalogItem, its associated
#  CatalogCategory objects, CatalogTax objects, CatalogImage objects and
#  CatalogModifierLists will be returned in the `related_objects` field of the
#  response. If the `objects` field of the response contains a
#  CatalogItemVariation,
#  its parent CatalogItem will be returned in the `related_objects` field of
#  the response.
#  Default value: `false`
    # @param begin_time [String] Return objects modified after this
#  timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates),
#  in RFC 3339
#  format, e.g., `2016-09-04T23:59:33.123Z`. The timestamp is exclusive - objects
#  with a
#  timestamp equal to `begin_time` will not be included in the response.
    # @param query [Hash] A query to be used to filter or sort the results. If no query is specified, the
#  entire catalog will be returned.Request of type SquareApiClient::CatalogQuery, as a Hash
    #   * :sorted_attribute_query (Hash)
    #     * :attribute_name (String) 
    #     * :initial_attribute_value (String) 
    #     * :sort_order (SquareApiClient::SortOrder) 
    #   * :exact_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_value (String) 
    #   * :set_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_values (Array<String>) 
    #   * :prefix_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_prefix (String) 
    #   * :range_query (Hash)
    #     * :attribute_name (String) 
    #     * :attribute_min_value (Long) 
    #     * :attribute_max_value (Long) 
    #   * :text_query (Hash)
    #     * :keywords (Array<String>) 
    #   * :items_for_tax_query (Hash)
    #     * :tax_ids (Array<String>) 
    #   * :items_for_modifier_list_query (Hash)
    #     * :modifier_list_ids (Array<String>) 
    #   * :items_for_item_options_query (Hash)
    #     * :item_option_ids (Array<String>) 
    #   * :item_variations_for_item_option_values_query (Hash)
    #     * :item_option_value_ids (Array<String>) 
    # @param limit [Integer] A limit on the number of results to be returned in a single page. The limit is
#  advisory -
#  the implementation may return more or fewer results. If the supplied limit is
#  negative, zero, or
#  is higher than the maximum limit of 1,000, it will be ignored.
    # @param include_category_path_to_root [Boolean] Specifies whether or not to include the `path_to_root` list for each returned
#  category instance. The `path_to_root` list consists of `CategoryPathToRootNode`
#  objects and specifies the path that starts with the immediate parent category of
#  the returned category and ends with its root category. If the returned category
#  is a top-level category, the `path_to_root` list is empty and is not returned in
#  the response payload. If `include_category_path_to_root` is `true`, then the
#  `include_deleted_objects` request parameter must be `false`. Both properties
#  cannot be `true` at the same time.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchCatalogObjectsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.search(
#    object_types: [ITEM],
#    query: { prefix_query: { attribute_name: "name", attribute_prefix: "tea" } },
#    limit: 100
#  )
    def search(cursor: nil, object_types: nil, include_deleted_objects: nil, include_related_objects: nil, begin_time: nil, query: nil, limit: nil, include_category_path_to_root: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, object_types: object_types, include_deleted_objects: include_deleted_objects, include_related_objects: include_related_objects, begin_time: begin_time, query: query, limit: limit, include_category_path_to_root: include_category_path_to_root }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/search"
end
        SquareApiClient::SearchCatalogObjectsResponse.from_json(json_object: response.body)
      end
    end
# Searches for catalog items or item variations by matching supported search
#  attribute values, including
#  custom attribute values, against one or more of the specified query filters.
#  This (`SearchCatalogItems`) endpoint differs from the
#  [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
#  endpoint in the following aspects:
#  - `SearchCatalogItems` can only search for items or item variations, whereas
#  `SearchCatalogObjects` can search for any type of catalog objects.
#  - `SearchCatalogItems` supports the custom attribute query filters to return
#  items or item variations that contain custom attribute values, where
#  `SearchCatalogObjects` does not.
#  - `SearchCatalogItems` does not support the `include_deleted_objects` filter to
#  search for deleted items or item variations, whereas `SearchCatalogObjects`
#  does.
#  - The both endpoints use different call conventions, including the query filter
#  formats.
    #
    # @param text_filter [String] The text filter expression to return items or item variations containing
#  specified text in
#  the `name`, `description`, or `abbreviation` attribute value of an item, or in
#  the `name`, `sku`, or `upc` attribute value of an item variation.
    # @param category_ids [Array<String>] The category id query expression to return items containing the specified
#  category IDs.
    # @param stock_levels [Array<SquareApiClient::SearchCatalogItemsRequestStockLevel>] The stock-level query expression to return item variations with the specified
#  stock levels.
#  See
#  [SearchCatalogItemsRequestStockLevel](#type-searchcatalogitemsrequeststocklevel)
#  for possible values
    # @param enabled_location_ids [Array<String>] The enabled-location query expression to return items and item variations having
#  specified enabled locations.
    # @param cursor [String] The pagination token, returned in the previous response, used to fetch the next
#  batch of pending results.
    # @param limit [Integer] The maximum number of results to return per page. The default value is 100.
    # @param sort_order [SquareApiClient::SortOrder] The order to sort the results by item names. The default sort order is ascending
#  (`ASC`).
#  See [SortOrder](#type-sortorder) for possible values
    # @param product_types [Array<SquareApiClient::CatalogItemProductType>] The product types query expression to return items or item variations having the
#  specified product types.
    # @param custom_attribute_filters [Array<Hash>] The customer-attribute filter to return items or item variations matching the
#  specified
#  custom attribute expressions. A maximum number of 10 custom attribute
#  expressions are supported in
#  a single call to the
#  [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint.Request of type Array<SquareApiClient::CustomAttributeFilter>, as a Hash
    #   * :custom_attribute_definition_id (String) 
    #   * :key (String) 
    #   * :string_filter (String) 
    #   * :number_filter (Hash)
    #     * :min (String) 
    #     * :max (String) 
    #   * :selection_uids_filter (Array<String>) 
    #   * :bool_filter (Boolean) 
    # @param archived_state [SquareApiClient::ArchivedState] The query filter to return not archived (`ARCHIVED_STATE_NOT_ARCHIVED`),
#  archived (`ARCHIVED_STATE_ARCHIVED`), or either type (`ARCHIVED_STATE_ALL`) of
#  items.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchCatalogItemsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.search_items(
#    text_filter: "red",
#    category_ids: ["WINE_CATEGORY_ID"],
#    stock_levels: [OUT, LOW],
#    enabled_location_ids: ["ATL_LOCATION_ID"],
#    limit: 100,
#    sort_order: ASC,
#    product_types: [REGULAR],
#    custom_attribute_filters: [{ custom_attribute_definition_id: "VEGAN_DEFINITION_ID", bool_filter: true }, { custom_attribute_definition_id: "BRAND_DEFINITION_ID", string_filter: "Dark Horse" }, { key: "VINTAGE", number_filter: { min: "min", max: "max" } }, { custom_attribute_definition_id: "VARIETAL_DEFINITION_ID" }]
#  )
    def search_items(text_filter: nil, category_ids: nil, stock_levels: nil, enabled_location_ids: nil, cursor: nil, limit: nil, sort_order: nil, product_types: nil, custom_attribute_filters: nil, archived_state: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), text_filter: text_filter, category_ids: category_ids, stock_levels: stock_levels, enabled_location_ids: enabled_location_ids, cursor: cursor, limit: limit, sort_order: sort_order, product_types: product_types, custom_attribute_filters: custom_attribute_filters, archived_state: archived_state }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/search-catalog-items"
end
        SquareApiClient::SearchCatalogItemsResponse.from_json(json_object: response.body)
      end
    end
# Updates the [CatalogModifierList](entity:CatalogModifierList) objects
#  that apply to the targeted [CatalogItem](entity:CatalogItem) without having
#  to perform an upsert on the entire item.
    #
    # @param item_ids [Array<String>] The IDs of the catalog items associated with the CatalogModifierList objects
#  being updated.
    # @param modifier_lists_to_enable [Array<String>] The IDs of the CatalogModifierList objects to enable for the CatalogItem.
#  At least one of `modifier_lists_to_enable` or `modifier_lists_to_disable` must
#  be specified.
    # @param modifier_lists_to_disable [Array<String>] The IDs of the CatalogModifierList objects to disable for the CatalogItem.
#  At least one of `modifier_lists_to_enable` or `modifier_lists_to_disable` must
#  be specified.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateItemModifierListsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.update_item_modifier_lists(
#    item_ids: ["H42BRLUJ5KTZTTMPVSLFAACQ", "2JXOBJIHCWBQ4NZ3RIXQGJA6"],
#    modifier_lists_to_enable: ["H42BRLUJ5KTZTTMPVSLFAACQ", "2JXOBJIHCWBQ4NZ3RIXQGJA6"],
#    modifier_lists_to_disable: ["7WRC16CJZDVLSNDQ35PP6YAD"]
#  )
    def update_item_modifier_lists(item_ids:, modifier_lists_to_enable: nil, modifier_lists_to_disable: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), item_ids: item_ids, modifier_lists_to_enable: modifier_lists_to_enable, modifier_lists_to_disable: modifier_lists_to_disable }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/update-item-modifier-lists"
end
        SquareApiClient::UpdateItemModifierListsResponse.from_json(json_object: response.body)
      end
    end
# Updates the [CatalogTax](entity:CatalogTax) objects that apply to the
#  targeted [CatalogItem](entity:CatalogItem) without having to perform an
#  upsert on the entire item.
    #
    # @param item_ids [Array<String>] IDs for the CatalogItems associated with the CatalogTax objects being updated.
#  No more than 1,000 IDs may be provided.
    # @param taxes_to_enable [Array<String>] IDs of the CatalogTax objects to enable.
#  At least one of `taxes_to_enable` or `taxes_to_disable` must be specified.
    # @param taxes_to_disable [Array<String>] IDs of the CatalogTax objects to disable.
#  At least one of `taxes_to_enable` or `taxes_to_disable` must be specified.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateItemTaxesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.update_item_taxes(
#    item_ids: ["H42BRLUJ5KTZTTMPVSLFAACQ", "2JXOBJIHCWBQ4NZ3RIXQGJA6"],
#    taxes_to_enable: ["4WRCNHCJZDVLSNDQ35PP6YAD"],
#    taxes_to_disable: ["AQCEGCEBBQONINDOHRGZISEX"]
#  )
    def update_item_taxes(item_ids:, taxes_to_enable: nil, taxes_to_disable: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), item_ids: item_ids, taxes_to_enable: taxes_to_enable, taxes_to_disable: taxes_to_disable }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/update-item-taxes"
end
        SquareApiClient::UpdateItemTaxesResponse.from_json(json_object: response.body)
      end
    end
  end
end