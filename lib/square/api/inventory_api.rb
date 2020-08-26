module Square
  # InventoryApi
  class InventoryApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Returns the [InventoryAdjustment](#type-inventoryadjustment) object
    # with the provided `adjustment_id`.
    # @param [String] adjustment_id Required parameter: ID of the
    # [InventoryAdjustment](#type-inventoryadjustment) to retrieve.
    # @return [RetrieveInventoryAdjustmentResponse Hash] response from the API call
    def retrieve_inventory_adjustment(adjustment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/adjustment/{adjustment_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'adjustment_id' => adjustment_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Applies adjustments and counts to the provided item quantities.
    # On success: returns the current calculated counts for all objects
    # referenced in the request.
    # On failure: returns a list of related errors.
    # @param [BatchChangeInventoryRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BatchChangeInventoryResponse Hash] response from the API call
    def batch_change_inventory(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/batch-change'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
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
    # @return [BatchRetrieveInventoryChangesResponse Hash] response from the API call
    def batch_retrieve_inventory_changes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/batch-retrieve-changes'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns current counts for the provided
    # [CatalogObject](#type-catalogobject)s at the requested
    # [Location](#type-location)s.
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
    # @return [BatchRetrieveInventoryCountsResponse Hash] response from the API call
    def batch_retrieve_inventory_counts(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/batch-retrieve-counts'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns the [InventoryPhysicalCount](#type-inventoryphysicalcount)
    # object with the provided `physical_count_id`.
    # @param [String] physical_count_id Required parameter: ID of the
    # [InventoryPhysicalCount](#type-inventoryphysicalcount) to retrieve.
    # @return [RetrieveInventoryPhysicalCountResponse Hash] response from the API call
    def retrieve_inventory_physical_count(physical_count_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/physical-count/{physical_count_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'physical_count_id' => physical_count_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves the current calculated stock count for a given
    # [CatalogObject](#type-catalogobject) at a given set of
    # [Location](#type-location)s. Responses are paginated and unsorted.
    # For more sophisticated queries, use a batch endpoint.
    # @param [String] catalog_object_id Required parameter: ID of the
    # [CatalogObject](#type-catalogobject) to retrieve.
    # @param [String] location_ids Optional parameter: The
    # [Location](#type-location) IDs to look up as a comma-separated list. An
    # empty list queries all locations.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  See the
    # [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pa
    # gination) guide for more information.
    # @return [RetrieveInventoryCountResponse Hash] response from the API call
    def retrieve_inventory_count(catalog_object_id:,
                                 location_ids: nil,
                                 cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/{catalog_object_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'catalog_object_id' => catalog_object_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_ids' => location_ids,
        'cursor' => cursor
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a set of physical counts and inventory adjustments for the
    # provided [CatalogObject](#type-catalogobject) at the requested
    # [Location](#type-location)s.
    # Results are paginated and sorted in descending order according to their
    # `occurred_at` timestamp (newest first).
    # There are no limits on how far back the caller can page. This endpoint can
    # be
    # used to display recent changes for a specific item. For more
    # sophisticated queries, use a batch endpoint.
    # @param [String] catalog_object_id Required parameter: ID of the
    # [CatalogObject](#type-catalogobject) to retrieve.
    # @param [String] location_ids Optional parameter: The
    # [Location](#type-location) IDs to look up as a comma-separated list. An
    # empty list queries all locations.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  See the
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion) guide for more information.
    # @return [RetrieveInventoryChangesResponse Hash] response from the API call
    def retrieve_inventory_changes(catalog_object_id:,
                                   location_ids: nil,
                                   cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/inventory/{catalog_object_id}/changes'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'catalog_object_id' => catalog_object_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_ids' => location_ids,
        'cursor' => cursor
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
