module Square
  # PaymentsApi
  class PaymentsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves a list of payments taken by the account making the request.
    # Results are eventually consistent, and new payments or changes to payments
    # might take several
    # seconds to appear.
    # The maximum results per page is 100.
    # @param [String] begin_time Optional parameter: The timestamp for the
    # beginning of the reporting period, in RFC 3339 format. Inclusive. Default:
    # The current time minus one year.
    # @param [String] end_time Optional parameter: The timestamp for the end of
    # the reporting period, in RFC 3339 format.  Default: The current time.
    # @param [String] sort_order Optional parameter: The order in which results
    # are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest
    # (default).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [String] location_id Optional parameter: Limit results to the
    # location supplied. By default, results are returned for the default (main)
    # location associated with the seller.
    # @param [Long] total Optional parameter: The exact amount in the
    # `total_money` for a payment.
    # @param [String] last_4 Optional parameter: The last four digits of a
    # payment card.
    # @param [String] card_brand Optional parameter: The brand of the payment
    # card (for example, VISA).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page.  The default value of 100 is
    # also the maximum allowed value. If the provided value is  greater than
    # 100, it is ignored and the default value is used instead.  Default:
    # `100`
    # @return [ListPaymentsResponse Hash] response from the API call
    def list_payments(begin_time: nil,
                      end_time: nil,
                      sort_order: nil,
                      cursor: nil,
                      location_id: nil,
                      total: nil,
                      last_4: nil,
                      card_brand: nil,
                      limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'begin_time' => begin_time,
        'end_time' => end_time,
        'sort_order' => sort_order,
        'cursor' => cursor,
        'location_id' => location_id,
        'total' => total,
        'last_4' => last_4,
        'card_brand' => card_brand,
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

    # Creates a payment using the provided source. You can use this endpoint
    # to charge a card (credit/debit card or
    # Square gift card) or record a payment that the seller received outside of
    # Square
    # (cash payment from a buyer or a payment that an external entity
    # processed on behalf of the seller).
    # The endpoint creates a
    # `Payment` object and returns it in the response.
    # @param [CreatePaymentRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreatePaymentResponse Hash] response from the API call
    def create_payment(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments'
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

    # Cancels (voids) a payment identified by the idempotency key that is
    # specified in the
    # request.
    # Use this method when the status of a `CreatePayment` request is unknown
    # (for example, after you send a
    # `CreatePayment` request, a network error occurs and you do not get a
    # response). In this case, you can
    # direct Square to cancel the payment using this endpoint. In the request,
    # you provide the same
    # idempotency key that you provided in your `CreatePayment` request that you
    # want to cancel. After
    # canceling the payment, you can submit your `CreatePayment` request again.
    # Note that if no payment with the specified idempotency key is found, no
    # action is taken and the endpoint
    # returns successfully.
    # @param [CancelPaymentByIdempotencyKeyRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [CancelPaymentByIdempotencyKeyResponse Hash] response from the API call
    def cancel_payment_by_idempotency_key(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/cancel'
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

    # Retrieves details for a specific payment.
    # @param [String] payment_id Required parameter: A unique ID for the desired
    # payment.
    # @return [GetPaymentResponse Hash] response from the API call
    def get_payment(payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => { 'value' => payment_id, 'encode' => true }
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

    # Updates a payment with the APPROVED status.
    # You can update the `amount_money` and `tip_money` using this endpoint.
    # @param [String] payment_id Required parameter: The ID of the payment to
    # update.
    # @param [UpdatePaymentRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdatePaymentResponse Hash] response from the API call
    def update_payment(payment_id:,
                       body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => { 'value' => payment_id, 'encode' => true }
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

    # Cancels (voids) a payment. You can use this endpoint to cancel a payment
    # with
    # the APPROVED `status`.
    # @param [String] payment_id Required parameter: The ID of the payment to
    # cancel.
    # @return [CancelPaymentResponse Hash] response from the API call
    def cancel_payment(payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => { 'value' => payment_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
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

    # Completes (captures) a payment.
    # By default, payments are set to complete immediately after they are
    # created.
    # You can use this endpoint to complete a payment with the APPROVED
    # `status`.
    # @param [String] payment_id Required parameter: The unique ID identifying
    # the payment to be completed.
    # @return [CompletePaymentResponse Hash] response from the API call
    def complete_payment(payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}/complete'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => { 'value' => payment_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
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
