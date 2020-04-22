module Square
  # CustomerGroupsApi
  class CustomerGroupsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves the list of customer groups of a business.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See the [Pagination
    # guide](https://developer.squareup.com/docs/working-with-apis/pagination)
    # for more information.
    # @return [ListCustomerGroupsResponse Hash] response from the API call
    def list_customer_groups(cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/groups'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
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

    # Creates a new customer group for a business.
    # The request must include the `name` value of the group.
    # @param [CreateCustomerGroupRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateCustomerGroupResponse Hash] response from the API call
    def create_customer_group(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/groups'
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

    # Deletes a customer group as identified by the `group_id` value.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to delete.
    # @return [DeleteCustomerGroupResponse Hash] response from the API call
    def delete_customer_group(group_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/groups/{group_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'group_id' => group_id
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

    # Retrieves a specific customer group as identified by the `group_id` value.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to retrieve.
    # @return [RetrieveCustomerGroupResponse Hash] response from the API call
    def retrieve_customer_group(group_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/groups/{group_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'group_id' => group_id
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

    # Updates a customer group as identified by the `group_id` value.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to update.
    # @param [UpdateCustomerGroupRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateCustomerGroupResponse Hash] response from the API call
    def update_customer_group(group_id:,
                              body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/groups/{group_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'group_id' => group_id
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
