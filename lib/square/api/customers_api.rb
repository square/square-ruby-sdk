module Square
  # CustomersApi
  class CustomersApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists customer profiles associated with a Square account.
    # Under normal operating conditions, newly created or updated customer
    # profiles become available
    # for the listing operation in well under 30 seconds. Occasionally,
    # propagation of the new or updated
    # profiles can take closer to one minute or longer, especially during
    # network incidents and outages.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for your original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [CustomerSortField] sort_field Optional parameter: Indicates how
    # customers should be sorted.  Default: `DEFAULT`.
    # @param [SortOrder] sort_order Optional parameter: Indicates whether
    # customers should be sorted in ascending (`ASC`) or descending (`DESC`)
    # order.  Default: `ASC`.
    # @return [ListCustomersResponse Hash] response from the API call
    def list_customers(cursor: nil,
                       sort_field: nil,
                       sort_order: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'sort_field' => sort_field,
        'sort_order' => sort_order
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates a new customer for a business, which can have associated cards on
    # file.
    # You must provide at least one of the following values in your request to
    # this
    # endpoint:
    # - `given_name`
    # - `family_name`
    # - `company_name`
    # - `email_address`
    # - `phone_number`
    # @param [CreateCustomerRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateCustomerResponse Hash] response from the API call
    def create_customer(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches the customer profiles associated with a Square account using a
    # supported query filter.
    # Calling `SearchCustomers` without any explicit query filter returns all
    # customer profiles ordered alphabetically based on `given_name` and
    # `family_name`.
    # Under normal operating conditions, newly created or updated customer
    # profiles become available
    # for the search operation in well under 30 seconds. Occasionally,
    # propagation of the new or updated
    # profiles can take closer to one minute or longer, especially during
    # network incidents and outages.
    # @param [SearchCustomersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchCustomersResponse Hash] response from the API call
    def search_customers(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/search'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Deletes a customer profile from a business, including any linked cards on
    # file.
    # As a best practice, you should include the `version` field in the request
    # to enable [optimistic
    # concurrency](https://developer.squareup.com/docs/working-with-apis/optimis
    # tic-concurrency) control. The value must be set to the current version of
    # the customer profile.
    # To delete a customer profile that was created by merging existing
    # profiles, you must use the ID of the newly created profile.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # delete.
    # @param [Long] version Optional parameter: The current version of the
    # customer profile.   As a best practice, you should include this parameter
    # to enable [optimistic
    # concurrency](https://developer.squareup.com/docs/working-with-apis/optimis
    # tic-concurrency) control.  For more information, see [Delete a customer
    # profile](https://developer.squareup.com/docs/customers-api/use-the-api/kee
    # p-records#delete-customer-profile).
    # @return [DeleteCustomerResponse Hash] response from the API call
    def delete_customer(customer_id:,
                        version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'version' => version
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns details for a single customer.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # retrieve.
    # @return [RetrieveCustomerResponse Hash] response from the API call
    def retrieve_customer(customer_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Updates a customer profile. To change an attribute, specify the new value.
    # To remove an attribute, specify the value as an empty string or empty
    # object.
    # As a best practice, you should include the `version` field in the request
    # to enable [optimistic
    # concurrency](https://developer.squareup.com/docs/working-with-apis/optimis
    # tic-concurrency) control. The value must be set to the current version of
    # the customer profile.
    # To update a customer profile that was created by merging existing
    # profiles, you must use the ID of the newly created profile.
    # You cannot use this endpoint to change cards on file. To change a card on
    # file, call [DeleteCustomerCard]($e/Customers/DeleteCustomerCard) to delete
    # the existing card and then call
    # [CreateCustomerCard]($e/Customers/CreateCustomerCard) to create a new
    # card.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # update.
    # @param [UpdateCustomerRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateCustomerResponse Hash] response from the API call
    def update_customer(customer_id:,
                        body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Adds a card on file to an existing customer.
    # As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
    # calls with the same card nonce return the same card record that was
    # created
    # with the provided nonce during the _first_ call.
    # @param [String] customer_id Required parameter: The Square ID of the
    # customer profile the card is linked to.
    # @param [CreateCustomerCardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateCustomerCardResponse Hash] response from the API call
    def create_customer_card(customer_id:,
                             body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/cards'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Removes a card on file from a customer.
    # @param [String] customer_id Required parameter: The ID of the customer
    # that the card on file belongs to.
    # @param [String] card_id Required parameter: The ID of the card on file to
    # delete.
    # @return [DeleteCustomerCardResponse Hash] response from the API call
    def delete_customer_card(customer_id:,
                             card_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/cards/{card_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true },
        'card_id' => { 'value' => card_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Removes a group membership from a customer.
    # The customer is identified by the `customer_id` value
    # and the customer group is identified by the `group_id` value.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # remove from the group.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to remove the customer from.
    # @return [RemoveGroupFromCustomerResponse Hash] response from the API call
    def remove_group_from_customer(customer_id:,
                                   group_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/groups/{group_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true },
        'group_id' => { 'value' => group_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Adds a group membership to a customer.
    # The customer is identified by the `customer_id` value
    # and the customer group is identified by the `group_id` value.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # add to a group.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to add the customer to.
    # @return [AddGroupToCustomerResponse Hash] response from the API call
    def add_group_to_customer(customer_id:,
                              group_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/groups/{group_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true },
        'group_id' => { 'value' => group_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
