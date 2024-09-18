module Square
  # InventoryApi
  class InventoryApi < BaseApi
    # Deprecated version of
    # [RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdju
    # stment) after the endpoint URL
    # is updated to conform to the standard convention.
    # @param [String] adjustment_id Required parameter: ID of the
    # [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def deprecated_retrieve_inventory_adjustment(adjustment_id:)
      warn 'Endpoint deprecated_retrieve_inventory_adjustment in InventoryApi '\
           'is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/adjustment/{adjustment_id}',
                                     'default')
                   .template_param(new_parameter(adjustment_id, key: 'adjustment_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns the [InventoryAdjustment]($m/InventoryAdjustment) object
    # with the provided `adjustment_id`.
    # @param [String] adjustment_id Required parameter: ID of the
    # [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_inventory_adjustment(adjustment_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/adjustments/{adjustment_id}',
                                     'default')
                   .template_param(new_parameter(adjustment_id, key: 'adjustment_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deprecated version of
    # [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after
    # the endpoint URL
    # is updated to conform to the standard convention.
    # @param [BatchChangeInventoryRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def deprecated_batch_change_inventory(body:)
      warn 'Endpoint deprecated_batch_change_inventory in InventoryApi is depr'\
           'ecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/inventory/batch-change',
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

    # Deprecated version of
    # [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInvent
    # oryChanges) after the endpoint URL
    # is updated to conform to the standard convention.
    # @param [BatchRetrieveInventoryChangesRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def deprecated_batch_retrieve_inventory_changes(body:)
      warn 'Endpoint deprecated_batch_retrieve_inventory_changes in InventoryA'\
           'pi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/inventory/batch-retrieve-changes',
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

    # Deprecated version of
    # [BatchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInvento
    # ryCounts) after the endpoint URL
    # is updated to conform to the standard convention.
    # @param [BatchRetrieveInventoryCountsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def deprecated_batch_retrieve_inventory_counts(body:)
      warn 'Endpoint deprecated_batch_retrieve_inventory_counts in InventoryAp'\
           'i is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/inventory/batch-retrieve-counts',
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

    # Applies adjustments and counts to the provided item quantities.
    # On success: returns the current calculated counts for all objects
    # referenced in the request.
    # On failure: returns a list of related errors.
    # @param [BatchChangeInventoryRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_change_inventory(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/inventory/changes/batch-create',
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

    # Returns historical physical counts and adjustments based on the
    # provided filter criteria.
    # Results are paginated and sorted in ascending order according their
    # `occurred_at` timestamp (oldest first).
    # BatchRetrieveInventoryChanges is a catch-all query endpoint for queries
    # that cannot be handled by other, simpler endpoints.
    # @param [BatchRetrieveInventoryChangesRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_retrieve_inventory_changes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/inventory/changes/batch-retrieve',
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

    # Returns current counts for the provided
    # [CatalogObject]($m/CatalogObject)s at the requested
    # [Location]($m/Location)s.
    # Results are paginated and sorted in descending order according to their
    # `calculated_at` timestamp (newest first).
    # When `updated_after` is specified, only counts that have changed since
    # that
    # time (based on the server timestamp for the most recent change) are
    # returned. This allows clients to perform a "sync" operation, for example
    # in response to receiving a Webhook notification.
    # @param [BatchRetrieveInventoryCountsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_retrieve_inventory_counts(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/inventory/counts/batch-retrieve',
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

    # Deprecated version of
    # [RetrieveInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryP
    # hysicalCount) after the endpoint URL
    # is updated to conform to the standard convention.
    # @param [String] physical_count_id Required parameter: ID of the
    # [InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def deprecated_retrieve_inventory_physical_count(physical_count_id:)
      warn 'Endpoint deprecated_retrieve_inventory_physical_count in Inventory'\
           'Api is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/physical-count/{physical_count_id}',
                                     'default')
                   .template_param(new_parameter(physical_count_id, key: 'physical_count_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns the [InventoryPhysicalCount]($m/InventoryPhysicalCount)
    # object with the provided `physical_count_id`.
    # @param [String] physical_count_id Required parameter: ID of the
    # [InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_inventory_physical_count(physical_count_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/physical-counts/{physical_count_id}',
                                     'default')
                   .template_param(new_parameter(physical_count_id, key: 'physical_count_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns the [InventoryTransfer]($m/InventoryTransfer) object
    # with the provided `transfer_id`.
    # @param [String] transfer_id Required parameter: ID of the
    # [InventoryTransfer](entity:InventoryTransfer) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_inventory_transfer(transfer_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/transfers/{transfer_id}',
                                     'default')
                   .template_param(new_parameter(transfer_id, key: 'transfer_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves the current calculated stock count for a given
    # [CatalogObject]($m/CatalogObject) at a given set of
    # [Location]($m/Location)s. Responses are paginated and unsorted.
    # For more sophisticated queries, use a batch endpoint.
    # @param [String] catalog_object_id Required parameter: ID of the
    # [CatalogObject](entity:CatalogObject) to retrieve.
    # @param [String] location_ids Optional parameter: The
    # [Location](entity:Location) IDs to look up as a comma-separated list. An
    # empty list queries all locations.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  See the
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion) guide for more information.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_inventory_count(catalog_object_id:,
                                 location_ids: nil,
                                 cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/{catalog_object_id}',
                                     'default')
                   .template_param(new_parameter(catalog_object_id, key: 'catalog_object_id')
                                    .should_encode(true))
                   .query_param(new_parameter(location_ids, key: 'location_ids'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a set of physical counts and inventory adjustments for the
    # provided [CatalogObject](entity:CatalogObject) at the requested
    # [Location](entity:Location)s.
    # You can achieve the same result by calling
    # [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInvent
    # oryChanges)
    # and having the `catalog_object_ids` list contain a single element of the
    # `CatalogObject` ID.
    # Results are paginated and sorted in descending order according to their
    # `occurred_at` timestamp (newest first).
    # There are no limits on how far back the caller can page. This endpoint can
    # be
    # used to display recent changes for a specific item. For more
    # sophisticated queries, use a batch endpoint.
    # @param [String] catalog_object_id Required parameter: ID of the
    # [CatalogObject](entity:CatalogObject) to retrieve.
    # @param [String] location_ids Optional parameter: The
    # [Location](entity:Location) IDs to look up as a comma-separated list. An
    # empty list queries all locations.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  See the
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion) guide for more information.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_inventory_changes(catalog_object_id:,
                                   location_ids: nil,
                                   cursor: nil)
      warn 'Endpoint retrieve_inventory_changes in InventoryApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/inventory/{catalog_object_id}/changes',
                                     'default')
                   .template_param(new_parameter(catalog_object_id, key: 'catalog_object_id')
                                    .should_encode(true))
                   .query_param(new_parameter(location_ids, key: 'location_ids'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
