module Square
  # CheckoutApi
  class CheckoutApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Links a `checkoutId` to a `checkout_page_url` that customers are
    # directed to in order to provide their payment information using a
    # payment processing workflow hosted on connect.squareup.com.
    # NOTE: The Checkout API has been updated with new features.
    # For more information, see [Checkout API
    # highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-
    # highlights).
    # We recommend that you use the
    # new [CreatePaymentLink]($e/Checkout/CreatePaymentLink)
    # endpoint in place of this previously released endpoint.
    # @param [String] location_id Required parameter: The ID of the business
    # location to associate the checkout with.
    # @param [CreateCheckoutRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateCheckoutResponse Hash] response from the API call
    def create_checkout(location_id:,
                        body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/checkouts'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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

    # Lists all payment links.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint.  Provide this cursor to retrieve the
    # next set of results for the original query.  If a cursor is not provided,
    # the endpoint returns the first page of the results.  For more 
    # information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [Integer] limit Optional parameter: A limit on the number of
    # results to return per page. The limit is advisory and  the implementation
    # might return more or less results. If the supplied limit is negative,
    # zero, or greater than the maximum limit of 1000, it is ignored.  Default
    # value: `100`
    # @return [ListPaymentLinksResponse Hash] response from the API call
    def list_payment_links(cursor: nil,
                           limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/online-checkout/payment-links'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'limit' => limit
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

    # Creates a Square-hosted checkout page. Applications can share the
    # resulting payment link with their buyer to pay for goods and services.
    # @param [CreatePaymentLinkRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreatePaymentLinkResponse Hash] response from the API call
    def create_payment_link(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/online-checkout/payment-links'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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

    # Deletes a payment link.
    # @param [String] id Required parameter: The ID of the payment link to
    # delete.
    # @return [DeletePaymentLinkResponse Hash] response from the API call
    def delete_payment_link(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/online-checkout/payment-links/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => { 'value' => id, 'encode' => true }
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

    # Retrieves a payment link.
    # @param [String] id Required parameter: The ID of link to retrieve.
    # @return [RetrievePaymentLinkResponse Hash] response from the API call
    def retrieve_payment_link(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/online-checkout/payment-links/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => { 'value' => id, 'encode' => true }
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

    # Updates a payment link. You can update the `payment_link` fields such as
    # `description`, `checkout_options`, and  `pre_populated_data`.
    # You cannot update other fields such as the `order_id`, `version`, `URL`,
    # or `timestamp` field.
    # @param [String] id Required parameter: The ID of the payment link to
    # update.
    # @param [UpdatePaymentLinkRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdatePaymentLinkResponse Hash] response from the API call
    def update_payment_link(id:,
                            body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/online-checkout/payment-links/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => { 'value' => id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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
  end
end
