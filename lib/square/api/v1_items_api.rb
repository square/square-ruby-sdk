module Square
  # V1ItemsApi
  class V1ItemsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists all the item categories for a given location.
    # @param [String] location_id Required parameter: The ID of the location to
    # list categories for.
    # @return [List of V1Category Hash] response from the API call
    def list_categories(location_id:)
      warn 'Endpoint list_categories in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/categories'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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

    # Creates an item category.
    # @param [String] location_id Required parameter: The ID of the location to
    # create an item for.
    # @param [V1Category] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Category Hash] response from the API call
    def create_category(location_id:,
                        body:)
      warn 'Endpoint create_category in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/categories'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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

    # Deletes an existing item category.
    # __DeleteCategory__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeleteCategoryRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] category_id Required parameter: The ID of the category to
    # delete.
    # @return [V1Category Hash] response from the API call
    def delete_category(location_id:,
                        category_id:)
      warn 'Endpoint delete_category in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/categories/{category_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'category_id' => category_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies the details of an existing item category.
    # @param [String] location_id Required parameter: The ID of the category's
    # associated location.
    # @param [String] category_id Required parameter: The ID of the category to
    # edit.
    # @param [V1Category] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Category Hash] response from the API call
    def update_category(location_id:,
                        category_id:,
                        body:)
      warn 'Endpoint update_category in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/categories/{category_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'category_id' => category_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Lists all the discounts for a given location.
    # @param [String] location_id Required parameter: The ID of the location to
    # list categories for.
    # @return [List of V1Discount Hash] response from the API call
    def list_discounts(location_id:)
      warn 'Endpoint list_discounts in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/discounts'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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

    # Creates a discount.
    # @param [String] location_id Required parameter: The ID of the location to
    # create an item for.
    # @param [V1Discount] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Discount Hash] response from the API call
    def create_discount(location_id:,
                        body:)
      warn 'Endpoint create_discount in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/discounts'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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

    # Deletes an existing discount.
    # __DeleteDiscount__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeleteDiscountRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] discount_id Required parameter: The ID of the discount to
    # delete.
    # @return [V1Discount Hash] response from the API call
    def delete_discount(location_id:,
                        discount_id:)
      warn 'Endpoint delete_discount in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/discounts/{discount_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'discount_id' => discount_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies the details of an existing discount.
    # @param [String] location_id Required parameter: The ID of the category's
    # associated location.
    # @param [String] discount_id Required parameter: The ID of the discount to
    # edit.
    # @param [V1Discount] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Discount Hash] response from the API call
    def update_discount(location_id:,
                        discount_id:,
                        body:)
      warn 'Endpoint update_discount in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/discounts/{discount_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'discount_id' => discount_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Lists all the fees (taxes) for a given location.
    # @param [String] location_id Required parameter: The ID of the location to
    # list fees for.
    # @return [List of V1Fee Hash] response from the API call
    def list_fees(location_id:)
      warn 'Endpoint list_fees in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/fees'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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

    # Creates a fee (tax).
    # @param [String] location_id Required parameter: The ID of the location to
    # create a fee for.
    # @param [V1Fee] body Required parameter: An object containing the fields to
    # POST for the request.  See the corresponding object definition for field
    # details.
    # @return [V1Fee Hash] response from the API call
    def create_fee(location_id:,
                   body:)
      warn 'Endpoint create_fee in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/fees'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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

    # Deletes an existing fee (tax).
    # __DeleteFee__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeleteFeeRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the fee's
    # associated location.
    # @param [String] fee_id Required parameter: The ID of the fee to delete.
    # @return [V1Fee Hash] response from the API call
    def delete_fee(location_id:,
                   fee_id:)
      warn 'Endpoint delete_fee in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/fees/{fee_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'fee_id' => fee_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies the details of an existing fee (tax).
    # @param [String] location_id Required parameter: The ID of the fee's
    # associated location.
    # @param [String] fee_id Required parameter: The ID of the fee to edit.
    # @param [V1Fee] body Required parameter: An object containing the fields to
    # POST for the request.  See the corresponding object definition for field
    # details.
    # @return [V1Fee Hash] response from the API call
    def update_fee(location_id:,
                   fee_id:,
                   body:)
      warn 'Endpoint update_fee in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/fees/{fee_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'fee_id' => fee_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Provides inventory information for all inventory-enabled item
    # variations.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [Integer] limit Optional parameter: The maximum number of inventory
    # entries to return in a single response. This value cannot exceed 1000.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1InventoryEntry Hash] response from the API call
    def list_inventory(location_id:,
                       limit: nil,
                       batch_token: nil)
      warn 'Endpoint list_inventory in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/inventory'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'limit' => limit,
        'batch_token' => batch_token
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

    # Adjusts the current available inventory of an item variation.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] variation_id Required parameter: The ID of the variation
    # to adjust inventory information for.
    # @param [V1AdjustInventoryRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [V1InventoryEntry Hash] response from the API call
    def adjust_inventory(location_id:,
                         variation_id:,
                         body:)
      warn 'Endpoint adjust_inventory in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/inventory/{variation_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'variation_id' => variation_id
      )
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

    # Provides summary information of all items for a given location.
    # @param [String] location_id Required parameter: The ID of the location to
    # list items for.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Item Hash] response from the API call
    def list_items(location_id:,
                   batch_token: nil)
      warn 'Endpoint list_items in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'batch_token' => batch_token
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

    # Creates an item and at least one variation for it.
    # Item-related entities include fields you can use to associate them with
    # entities in a non-Square system.
    # When you create an item-related entity, you can optionally specify `id`.
    # This value must be unique among all IDs ever specified for the account,
    # including those specified by other applications. You can never reuse an
    # entity ID. If you do not specify an ID, Square generates one for the
    # entity.
    # Item variations have a `user_data` string that lets you associate
    # arbitrary
    # metadata with the variation. The string cannot exceed 255 characters.
    # @param [String] location_id Required parameter: The ID of the location to
    # create an item for.
    # @param [V1Item] body Required parameter: An object containing the fields
    # to POST for the request.  See the corresponding object definition for
    # field details.
    # @return [V1Item Hash] response from the API call
    def create_item(location_id:,
                    body:)
      warn 'Endpoint create_item in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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

    # Deletes an existing item and all item variations associated with it.
    # __DeleteItem__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeleteItemRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] item_id Required parameter: The ID of the item to
    # modify.
    # @return [V1Item Hash] response from the API call
    def delete_item(location_id:,
                    item_id:)
      warn 'Endpoint delete_item in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Provides the details for a single item, including associated modifier
    # lists and fees.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] item_id Required parameter: The item's ID.
    # @return [V1Item Hash] response from the API call
    def retrieve_item(location_id:,
                      item_id:)
      warn 'Endpoint retrieve_item in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id
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

    # Modifies the core details of an existing item.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] item_id Required parameter: The ID of the item to
    # modify.
    # @param [V1Item] body Required parameter: An object containing the fields
    # to POST for the request.  See the corresponding object definition for
    # field details.
    # @return [V1Item Hash] response from the API call
    def update_item(location_id:,
                    item_id:,
                    body:)
      warn 'Endpoint update_item in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Removes a fee assocation from an item so the fee is no longer
    # automatically applied to the item in Square Point of Sale.
    # @param [String] location_id Required parameter: The ID of the fee's
    # associated location.
    # @param [String] item_id Required parameter: The ID of the item to add the
    # fee to.
    # @param [String] fee_id Required parameter: The ID of the fee to apply.
    # @return [V1Item Hash] response from the API call
    def remove_fee(location_id:,
                   item_id:,
                   fee_id:)
      warn 'Endpoint remove_fee in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/fees/{fee_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id,
        'fee_id' => fee_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Associates a fee with an item so the fee is automatically applied to
    # the item in Square Point of Sale.
    # @param [String] location_id Required parameter: The ID of the fee's
    # associated location.
    # @param [String] item_id Required parameter: The ID of the item to add the
    # fee to.
    # @param [String] fee_id Required parameter: The ID of the fee to apply.
    # @return [V1Item Hash] response from the API call
    def apply_fee(location_id:,
                  item_id:,
                  fee_id:)
      warn 'Endpoint apply_fee in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/fees/{fee_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id,
        'fee_id' => fee_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Removes a modifier list association from an item so the modifier
    # options from the list can no longer be applied to the item.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to remove.
    # @param [String] item_id Required parameter: The ID of the item to remove
    # the modifier list from.
    # @return [V1Item Hash] response from the API call
    def remove_modifier_list(location_id:,
                             modifier_list_id:,
                             item_id:)
      warn 'Endpoint remove_modifier_list in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/modifier-lists/{modifier_list_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id,
        'item_id' => item_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Associates a modifier list with an item so the associated modifier
    # options can be applied to the item.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to apply.
    # @param [String] item_id Required parameter: The ID of the item to add the
    # modifier list to.
    # @return [V1Item Hash] response from the API call
    def apply_modifier_list(location_id:,
                            modifier_list_id:,
                            item_id:)
      warn 'Endpoint apply_modifier_list in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/modifier-lists/{modifier_list_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id,
        'item_id' => item_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Creates an item variation for an existing item.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] item_id Required parameter: The item's ID.
    # @param [V1Variation] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Variation Hash] response from the API call
    def create_variation(location_id:,
                         item_id:,
                         body:)
      warn 'Endpoint create_variation in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/variations'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id
      )
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

    # Deletes an existing item variation from an item.
    # __DeleteVariation__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeleteVariationRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] item_id Required parameter: The ID of the item to
    # delete.
    # @param [String] variation_id Required parameter: The ID of the variation
    # to delete.
    # @return [V1Variation Hash] response from the API call
    def delete_variation(location_id:,
                         item_id:,
                         variation_id:)
      warn 'Endpoint delete_variation in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/variations/{variation_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id,
        'variation_id' => variation_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies the details of an existing item variation.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] item_id Required parameter: The ID of the item to
    # modify.
    # @param [String] variation_id Required parameter: The ID of the variation
    # to modify.
    # @param [V1Variation] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Variation Hash] response from the API call
    def update_variation(location_id:,
                         item_id:,
                         variation_id:,
                         body:)
      warn 'Endpoint update_variation in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/items/{item_id}/variations/{variation_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'item_id' => item_id,
        'variation_id' => variation_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Lists all the modifier lists for a given location.
    # @param [String] location_id Required parameter: The ID of the location to
    # list modifier lists for.
    # @return [List of V1ModifierList Hash] response from the API call
    def list_modifier_lists(location_id:)
      warn 'Endpoint list_modifier_lists in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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

    # Creates an item modifier list and at least 1 modifier option for it.
    # @param [String] location_id Required parameter: The ID of the location to
    # create a modifier list for.
    # @param [V1ModifierList] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1ModifierList Hash] response from the API call
    def create_modifier_list(location_id:,
                             body:)
      warn 'Endpoint create_modifier_list in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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

    # Deletes an existing item modifier list and all modifier options
    # associated with it.
    # __DeleteModifierList__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeleteModifierListRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to delete.
    # @return [V1ModifierList Hash] response from the API call
    def delete_modifier_list(location_id:,
                             modifier_list_id:)
      warn 'Endpoint delete_modifier_list in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists/{modifier_list_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Provides the details for a single modifier list.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The modifier list's
    # ID.
    # @return [V1ModifierList Hash] response from the API call
    def retrieve_modifier_list(location_id:,
                               modifier_list_id:)
      warn 'Endpoint retrieve_modifier_list in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists/{modifier_list_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id
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

    # Modifies the details of an existing item modifier list.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to edit.
    # @param [V1UpdateModifierListRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [V1ModifierList Hash] response from the API call
    def update_modifier_list(location_id:,
                             modifier_list_id:,
                             body:)
      warn 'Endpoint update_modifier_list in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists/{modifier_list_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Creates an item modifier option and adds it to a modifier list.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to edit.
    # @param [V1ModifierOption] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [V1ModifierOption Hash] response from the API call
    def create_modifier_option(location_id:,
                               modifier_list_id:,
                               body:)
      warn 'Endpoint create_modifier_option in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists/{modifier_list_id}/modifier-options'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id
      )
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

    # Deletes an existing item modifier option from a modifier list.
    # __DeleteModifierOption__ returns nothing on success but Connect
    # SDKs map the empty response to an empty `V1DeleteModifierOptionRequest`
    # object.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to delete.
    # @param [String] modifier_option_id Required parameter: The ID of the
    # modifier list to edit.
    # @return [V1ModifierOption Hash] response from the API call
    def delete_modifier_option(location_id:,
                               modifier_list_id:,
                               modifier_option_id:)
      warn 'Endpoint delete_modifier_option in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists/{modifier_list_id}/modifier-options/{modifier_option_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id,
        'modifier_option_id' => modifier_option_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies the details of an existing item modifier option.
    # @param [String] location_id Required parameter: The ID of the item's
    # associated location.
    # @param [String] modifier_list_id Required parameter: The ID of the
    # modifier list to edit.
    # @param [String] modifier_option_id Required parameter: The ID of the
    # modifier list to edit.
    # @param [V1ModifierOption] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [V1ModifierOption Hash] response from the API call
    def update_modifier_option(location_id:,
                               modifier_list_id:,
                               modifier_option_id:,
                               body:)
      warn 'Endpoint update_modifier_option in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/modifier-lists/{modifier_list_id}/modifier-options/{modifier_option_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'modifier_list_id' => modifier_list_id,
        'modifier_option_id' => modifier_option_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Lists all Favorites pages (in Square Point of Sale) for a given
    # location.
    # @param [String] location_id Required parameter: The ID of the location to
    # list Favorites pages for.
    # @return [List of V1Page Hash] response from the API call
    def list_pages(location_id:)
      warn 'Endpoint list_pages in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/pages'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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

    # Creates a Favorites page in Square Point of Sale.
    # @param [String] location_id Required parameter: The ID of the location to
    # create an item for.
    # @param [V1Page] body Required parameter: An object containing the fields
    # to POST for the request.  See the corresponding object definition for
    # field details.
    # @return [V1Page Hash] response from the API call
    def create_page(location_id:,
                    body:)
      warn 'Endpoint create_page in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/pages'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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

    # Deletes an existing Favorites page and all of its cells.
    # __DeletePage__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeletePageRequest` object.
    # @param [String] location_id Required parameter: The ID of the Favorites
    # page's associated location.
    # @param [String] page_id Required parameter: The ID of the page to
    # delete.
    # @return [V1Page Hash] response from the API call
    def delete_page(location_id:,
                    page_id:)
      warn 'Endpoint delete_page in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/pages/{page_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'page_id' => page_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies the details of a Favorites page in Square Point of Sale.
    # @param [String] location_id Required parameter: The ID of the Favorites
    # page's associated location
    # @param [String] page_id Required parameter: The ID of the page to
    # modify.
    # @param [V1Page] body Required parameter: An object containing the fields
    # to POST for the request.  See the corresponding object definition for
    # field details.
    # @return [V1Page Hash] response from the API call
    def update_page(location_id:,
                    page_id:,
                    body:)
      warn 'Endpoint update_page in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/pages/{page_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'page_id' => page_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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

    # Deletes a cell from a Favorites page in Square Point of Sale.
    # __DeletePageCell__ returns nothing on success but Connect SDKs
    # map the empty response to an empty `V1DeletePageCellRequest` object
    # as documented below.
    # @param [String] location_id Required parameter: The ID of the Favorites
    # page's associated location.
    # @param [String] page_id Required parameter: The ID of the page to
    # delete.
    # @param [String] row Optional parameter: The row of the cell to clear.
    # Always an integer between 0 and 4, inclusive. Row 0 is the top row.
    # @param [String] column Optional parameter: The column of the cell to
    # clear. Always an integer between 0 and 4, inclusive. Column 0 is the
    # leftmost column.
    # @return [V1Page Hash] response from the API call
    def delete_page_cell(location_id:,
                         page_id:,
                         row: nil,
                         column: nil)
      warn 'Endpoint delete_page_cell in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/pages/{page_id}/cells'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'page_id' => page_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'row' => row,
        'column' => column
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Modifies a cell of a Favorites page in Square Point of Sale.
    # @param [String] location_id Required parameter: The ID of the Favorites
    # page's associated location.
    # @param [String] page_id Required parameter: The ID of the page the cell
    # belongs to.
    # @param [V1PageCell] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Page Hash] response from the API call
    def update_page_cell(location_id:,
                         page_id:,
                         body:)
      warn 'Endpoint update_page_cell in V1ItemsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/pages/{page_id}/cells'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'page_id' => page_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
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
  end
end
