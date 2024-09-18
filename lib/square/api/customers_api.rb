module Square
  # CustomersApi
  class CustomersApi < BaseApi
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
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single page. This limit is advisory. The response might
    # contain more or fewer results. If the specified limit is less than 1 or
    # greater than 100, Square returns a `400 VALUE_TOO_LOW` or `400
    # VALUE_TOO_HIGH` error. The default value is 100.  For more information,
    # see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [CustomerSortField] sort_field Optional parameter: Indicates how
    # customers should be sorted.  The default value is `DEFAULT`.
    # @param [SortOrder] sort_order Optional parameter: Indicates whether
    # customers should be sorted in ascending (`ASC`) or descending (`DESC`)
    # order.  The default value is `ASC`.
    # @param [TrueClass | FalseClass] count Optional parameter: Indicates
    # whether to return the total count of customers in the `count` field of the
    # response.  The default value is `false`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_customers(cursor: nil,
                       limit: nil,
                       sort_field: nil,
                       sort_order: nil,
                       count: false)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/customers',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(sort_field, key: 'sort_field'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(count, key: 'count'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a new customer for a business.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_customer(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers',
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

    # Creates multiple [customer profiles]($m/Customer) for a business.
    # This endpoint takes a map of individual create requests and returns a map
    # of responses.
    # You must provide at least one of the following values in each create
    # request:
    # - `given_name`
    # - `family_name`
    # - `company_name`
    # - `email_address`
    # - `phone_number`
    # @param [BulkCreateCustomersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_create_customers(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/bulk-create',
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

    # Deletes multiple customer profiles.
    # The endpoint takes a list of customer IDs and returns a map of responses.
    # @param [BulkDeleteCustomersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_delete_customers(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/bulk-delete',
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

    # Retrieves multiple customer profiles.
    # This endpoint takes a list of customer IDs and returns a map of responses.
    # @param [BulkRetrieveCustomersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_retrieve_customers(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/bulk-retrieve',
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

    # Updates multiple customer profiles.
    # This endpoint takes a map of individual update requests and returns a map
    # of responses.
    # You cannot use this endpoint to change cards on file. To make changes, use
    # the [Cards API]($e/Cards) or [Gift Cards API]($e/GiftCards).
    # @param [BulkUpdateCustomersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_update_customers(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/bulk-update',
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

    # Searches the customer profiles associated with a Square account using one
    # or more supported query filters.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_customers(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/search',
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

    # Deletes a customer profile from a business. This operation also unlinks
    # any associated cards on file.
    # To delete a customer profile that was created by merging existing
    # profiles, you must use the ID of the newly created profile.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # delete.
    # @param [Integer] version Optional parameter: The current version of the
    # customer profile.  As a best practice, you should include this parameter
    # to enable [optimistic
    # concurrency](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/optimistic-concurrency) control.  For more information, see
    # [Delete a customer
    # profile](https://developer.squareup.com/docs/customers-api/use-the-api/kee
    # p-records#delete-customer-profile).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_customer(customer_id:,
                        version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/customers/{customer_id}',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
                   .query_param(new_parameter(version, key: 'version'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns details for a single customer.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_customer(customer_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/customers/{customer_id}',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a customer profile. This endpoint supports sparse updates, so only
    # new or changed fields are required in the request.
    # To add or update a field, specify the new value. To remove a field,
    # specify `null`.
    # To update a customer profile that was created by merging existing
    # profiles, you must use the ID of the newly created profile.
    # You cannot use this endpoint to change cards on file. To make changes, use
    # the [Cards API]($e/Cards) or [Gift Cards API]($e/GiftCards).
    # @param [String] customer_id Required parameter: The ID of the customer to
    # update.
    # @param [UpdateCustomerRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_customer(customer_id:,
                        body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/customers/{customer_id}',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_customer_card(customer_id:,
                             body:)
      warn 'Endpoint create_customer_card in CustomersApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/{customer_id}/cards',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
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

    # Removes a card on file from a customer.
    # @param [String] customer_id Required parameter: The ID of the customer
    # that the card on file belongs to.
    # @param [String] card_id Required parameter: The ID of the card on file to
    # delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_customer_card(customer_id:,
                             card_id:)
      warn 'Endpoint delete_customer_card in CustomersApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/customers/{customer_id}/cards/{card_id}',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
                   .template_param(new_parameter(card_id, key: 'card_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Removes a group membership from a customer.
    # The customer is identified by the `customer_id` value
    # and the customer group is identified by the `group_id` value.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # remove from the group.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to remove the customer from.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def remove_group_from_customer(customer_id:,
                                   group_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/customers/{customer_id}/groups/{group_id}',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
                   .template_param(new_parameter(group_id, key: 'group_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Adds a group membership to a customer.
    # The customer is identified by the `customer_id` value
    # and the customer group is identified by the `group_id` value.
    # @param [String] customer_id Required parameter: The ID of the customer to
    # add to a group.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to add the customer to.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def add_group_to_customer(customer_id:,
                              group_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/customers/{customer_id}/groups/{group_id}',
                                     'default')
                   .template_param(new_parameter(customer_id, key: 'customer_id')
                                    .should_encode(true))
                   .template_param(new_parameter(group_id, key: 'group_id')
                                    .should_encode(true))
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
