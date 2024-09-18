module Square
  # CatalogApi
  class CatalogApi < BaseApi
    # Deletes a set of [CatalogItem]($m/CatalogItem)s based on the
    # provided list of target IDs and returns a set of successfully deleted IDs
    # in
    # the response. Deletion is a cascading event such that all children of the
    # targeted object are also deleted. For example, deleting a CatalogItem will
    # also delete all of its [CatalogItemVariation]($m/CatalogItemVariation)
    # children.
    # `BatchDeleteCatalogObjects` succeeds even if only a portion of the
    # targeted
    # IDs can be deleted. The response will only include IDs that were
    # actually deleted.
    # To ensure consistency, only one delete request is processed at a time per
    # seller account.
    # While one (batch or non-batch) delete request is being processed, other
    # (batched and non-batched)
    # delete requests are rejected with the `429` error code.
    # @param [BatchDeleteCatalogObjectsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_delete_catalog_objects(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/batch-delete',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a set of objects based on the provided ID.
    # Each [CatalogItem]($m/CatalogItem) returned in the set includes all of its
    # child information including: all of its
    # [CatalogItemVariation]($m/CatalogItemVariation) objects, references to
    # its [CatalogModifierList]($m/CatalogModifierList) objects, and the ids of
    # any [CatalogTax]($m/CatalogTax) objects that apply to it.
    # @param [BatchRetrieveCatalogObjectsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_retrieve_catalog_objects(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/batch-retrieve',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates or updates up to 10,000 target objects based on the provided
    # list of objects. The target objects are grouped into batches and each
    # batch is
    # inserted/updated in an all-or-nothing manner. If an object within a batch
    # is
    # malformed in some way, or violates a database constraint, the entire batch
    # containing that item will be disregarded. However, other batches in the
    # same
    # request may still succeed. Each batch may contain up to 1,000 objects, and
    # batches will be processed in order as long as the total object count for
    # the
    # request (items, variations, modifier lists, discounts, and taxes) is no
    # more
    # than 10,000.
    # To ensure consistency, only one update request is processed at a time per
    # seller account.
    # While one (batch or non-batch) update request is being processed, other
    # (batched and non-batched)
    # update requests are rejected with the `429` error code.
    # @param [BatchUpsertCatalogObjectsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_upsert_catalog_objects(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/batch-upsert',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Uploads an image file to be represented by a
    # [CatalogImage]($m/CatalogImage) object that can be linked to an existing
    # [CatalogObject]($m/CatalogObject) instance. The resulting `CatalogImage`
    # is unattached to any `CatalogObject` if the `object_id`
    # is not specified.
    # This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data
    # requests with a JSON part and an image file part in
    # JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
    # @param [CreateCatalogImageRequest] request Optional parameter: Example:
    # @param [File | UploadIO] image_file Optional parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_catalog_image(request: nil,
                             image_file: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/images',
                                     'default')
                   .multipart_param(new_parameter(StringIO.new(request.to_json), key: 'request')
                                     .default_content_type('application/json; charset=utf-8'))
                   .multipart_param(new_parameter(image_file, key: 'image_file')
                                     .default_content_type('image/jpeg'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Uploads a new image file to replace the existing one in the specified
    # [CatalogImage]($m/CatalogImage) object.
    # This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data
    # requests with a JSON part and an image file part in
    # JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
    # @param [String] image_id Required parameter: The ID of the `CatalogImage`
    # object to update the encapsulated image file.
    # @param [UpdateCatalogImageRequest] request Optional parameter: Example:
    # @param [File | UploadIO] image_file Optional parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_catalog_image(image_id:,
                             request: nil,
                             image_file: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/catalog/images/{image_id}',
                                     'default')
                   .template_param(new_parameter(image_id, key: 'image_id')
                                    .should_encode(true))
                   .multipart_param(new_parameter(StringIO.new(request.to_json), key: 'request')
                                     .default_content_type('application/json; charset=utf-8'))
                   .multipart_param(new_parameter(image_file, key: 'image_file')
                                     .default_content_type('image/jpeg'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves information about the Square Catalog API, such as batch size
    # limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def catalog_info
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/catalog/info',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a list of all [CatalogObject]($m/CatalogObject)s of the specified
    # types in the catalog.
    # The `types` parameter is specified as a comma-separated list of the
    # [CatalogObjectType]($m/CatalogObjectType) values,
    # for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`,
    # `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".
    # __Important:__ ListCatalog does not return deleted catalog items. To
    # retrieve
    # deleted catalog items, use
    # [SearchCatalogObjects]($e/Catalog/SearchCatalogObjects)
    # and set the `include_deleted_objects` attribute value to `true`.
    # @param [String] cursor Optional parameter: The pagination cursor returned
    # in the previous response. Leave unset for an initial request. The page
    # size is currently set to be 100. See
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination) for more information.
    # @param [String] types Optional parameter: An optional case-insensitive,
    # comma-separated list of object types to retrieve.  The valid values are
    # defined in the [CatalogObjectType](entity:CatalogObjectType) enum, for
    # example, `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,
    # `MODIFIER`, `MODIFIER_LIST`, `IMAGE`, etc.  If this is unspecified, the
    # operation returns objects of all the top level types at the version of the
    # Square API used to make the request. Object types that are nested onto
    # other object types are not included in the defaults.  At the current API
    # version the default object types are: ITEM, CATEGORY, TAX, DISCOUNT,
    # MODIFIER_LIST,  PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
    # SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION,
    # QUICK_AMOUNT_SETTINGS.
    # @param [Integer] catalog_version Optional parameter: The specific version
    # of the catalog objects to be included in the response. This allows you to
    # retrieve historical versions of objects. The specified version value is
    # matched against the [CatalogObject]($m/CatalogObject)s' `version`
    # attribute.  If not included, results will be from the current version of
    # the catalog.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_catalog(cursor: nil,
                     types: nil,
                     catalog_version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/catalog/list',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(types, key: 'types'))
                   .query_param(new_parameter(catalog_version, key: 'catalog_version'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a new or updates the specified [CatalogObject]($m/CatalogObject).
    # To ensure consistency, only one update request is processed at a time per
    # seller account.
    # While one (batch or non-batch) update request is being processed, other
    # (batched and non-batched)
    # update requests are rejected with the `429` error code.
    # @param [UpsertCatalogObjectRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def upsert_catalog_object(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/object',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deletes a single [CatalogObject]($m/CatalogObject) based on the
    # provided ID and returns the set of successfully deleted IDs in the
    # response.
    # Deletion is a cascading event such that all children of the targeted
    # object
    # are also deleted. For example, deleting a [CatalogItem]($m/CatalogItem)
    # will also delete all of its
    # [CatalogItemVariation]($m/CatalogItemVariation) children.
    # To ensure consistency, only one delete request is processed at a time per
    # seller account.
    # While one (batch or non-batch) delete request is being processed, other
    # (batched and non-batched)
    # delete requests are rejected with the `429` error code.
    # @param [String] object_id Required parameter: The ID of the catalog object
    # to be deleted. When an object is deleted, other objects in the graph that
    # depend on that object will be deleted as well (for example, deleting a
    # catalog item will delete its catalog item variations).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_catalog_object(object_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/catalog/object/{object_id}',
                                     'default')
                   .template_param(new_parameter(object_id, key: 'object_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a single [CatalogItem]($m/CatalogItem) as a
    # [CatalogObject]($m/CatalogObject) based on the provided ID. The returned
    # object includes all of the relevant [CatalogItem]($m/CatalogItem)
    # information including: [CatalogItemVariation]($m/CatalogItemVariation)
    # children, references to its
    # [CatalogModifierList]($m/CatalogModifierList) objects, and the ids of
    # any [CatalogTax]($m/CatalogTax) objects that apply to it.
    # @param [String] object_id Required parameter: The object ID of any type of
    # catalog objects to be retrieved.
    # @param [TrueClass | FalseClass] include_related_objects Optional
    # parameter: If `true`, the response will include additional objects that
    # are related to the requested objects. Related objects are defined as any
    # objects referenced by ID by the results in the `objects` field of the
    # response. These objects are put in the `related_objects` field. Setting
    # this to `true` is helpful when the objects are needed for immediate
    # display to a user. This process only goes one level deep. Objects
    # referenced by the related objects will not be included. For example,  if
    # the `objects` field of the response contains a CatalogItem, its associated
    # CatalogCategory objects, CatalogTax objects, CatalogImage objects and
    # CatalogModifierLists will be returned in the `related_objects` field of
    # the response. If the `objects` field of the response contains a
    # CatalogItemVariation, its parent CatalogItem will be returned in the
    # `related_objects` field of the response.  Default value: `false`
    # @param [Integer] catalog_version Optional parameter: Requests objects as
    # of a specific version of the catalog. This allows you to retrieve
    # historical versions of objects. The value to retrieve a specific version
    # of an object can be found in the version field of
    # [CatalogObject]($m/CatalogObject)s. If not included, results will be from
    # the current version of the catalog.
    # @param [TrueClass | FalseClass] include_category_path_to_root Optional
    # parameter: Specifies whether or not to include the `path_to_root` list for
    # each returned category instance. The `path_to_root` list consists of
    # `CategoryPathToRootNode` objects and specifies the path that starts with
    # the immediate parent category of the returned category and ends with its
    # root category. If the returned category is a top-level category, the
    # `path_to_root` list is empty and is not returned in the response
    # payload.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_catalog_object(object_id:,
                                include_related_objects: false,
                                catalog_version: nil,
                                include_category_path_to_root: false)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/catalog/object/{object_id}',
                                     'default')
                   .template_param(new_parameter(object_id, key: 'object_id')
                                    .should_encode(true))
                   .query_param(new_parameter(include_related_objects, key: 'include_related_objects'))
                   .query_param(new_parameter(catalog_version, key: 'catalog_version'))
                   .query_param(new_parameter(include_category_path_to_root, key: 'include_category_path_to_root'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Searches for [CatalogObject]($m/CatalogObject) of any type by matching
    # supported search attribute values,
    # excluding custom attribute values on items or item variations, against one
    # or more of the specified query filters.
    # This (`SearchCatalogObjects`) endpoint differs from the
    # [SearchCatalogItems]($e/Catalog/SearchCatalogItems)
    # endpoint in the following aspects:
    # - `SearchCatalogItems` can only search for items or item variations,
    # whereas `SearchCatalogObjects` can search for any type of catalog objects.
    # - `SearchCatalogItems` supports the custom attribute query filters to
    # return items or item variations that contain custom attribute values,
    # where `SearchCatalogObjects` does not.
    # - `SearchCatalogItems` does not support the `include_deleted_objects`
    # filter to search for deleted items or item variations, whereas
    # `SearchCatalogObjects` does.
    # - The both endpoints have different call conventions, including the query
    # filter formats.
    # @param [SearchCatalogObjectsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_catalog_objects(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Searches for catalog items or item variations by matching supported search
    # attribute values, including
    # custom attribute values, against one or more of the specified query
    # filters.
    # This (`SearchCatalogItems`) endpoint differs from the
    # [SearchCatalogObjects]($e/Catalog/SearchCatalogObjects)
    # endpoint in the following aspects:
    # - `SearchCatalogItems` can only search for items or item variations,
    # whereas `SearchCatalogObjects` can search for any type of catalog objects.
    # - `SearchCatalogItems` supports the custom attribute query filters to
    # return items or item variations that contain custom attribute values,
    # where `SearchCatalogObjects` does not.
    # - `SearchCatalogItems` does not support the `include_deleted_objects`
    # filter to search for deleted items or item variations, whereas
    # `SearchCatalogObjects` does.
    # - The both endpoints use different call conventions, including the query
    # filter formats.
    # @param [SearchCatalogItemsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_catalog_items(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/search-catalog-items',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates the [CatalogModifierList]($m/CatalogModifierList) objects
    # that apply to the targeted [CatalogItem]($m/CatalogItem) without having
    # to perform an upsert on the entire item.
    # @param [UpdateItemModifierListsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_item_modifier_lists(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/update-item-modifier-lists',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates the [CatalogTax]($m/CatalogTax) objects that apply to the
    # targeted [CatalogItem]($m/CatalogItem) without having to perform an
    # upsert on the entire item.
    # @param [UpdateItemTaxesRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_item_taxes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/catalog/update-item-taxes',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
