module Square
  # PaymentsApi
  class PaymentsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves a list of payments taken by the account making the request.
    # Max results per page: 100
    # @param [String] begin_time Optional parameter: Timestamp for the beginning
    # of the reporting period, in RFC 3339 format. Inclusive. Default: The
    # current time minus one year.
    # @param [String] end_time Optional parameter: Timestamp for the end of the
    # requested reporting period, in RFC 3339 format.  Default: The current
    # time.
    # @param [String] sort_order Optional parameter: The order in which results
    # are listed. - `ASC` - oldest to newest - `DESC` - newest to oldest
    # (default).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  See
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # for more information.
    # @param [String] location_id Optional parameter: Limit results to the
    # location supplied. By default, results are returned for all locations
    # associated with the merchant.
    # @param [Long] total Optional parameter: The exact amount in the
    # total_money for a `Payment`.
    # @param [String] last_4 Optional parameter: The last 4 digits of `Payment`
    # card.
    # @param [String] card_brand Optional parameter: The brand of `Payment`
    # card. For example, `VISA`
    # @return [ListPaymentsResponse Hash] response from the API call
    def list_payments(begin_time: nil,
                      end_time: nil,
                      sort_order: nil,
                      cursor: nil,
                      location_id: nil,
                      total: nil,
                      last_4: nil,
                      card_brand: nil)
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
        'card_brand' => card_brand
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

    # Charges a payment source, for example, a card
    # represented by customer's card on file or a card nonce. In addition
    # to the payment source, the request must also include the
    # amount to accept for the payment.
    # There are several optional parameters that you can include in the request.
    # For example, tip money, whether to autocomplete the payment, or a
    # reference ID
    # to correlate this payment with another system.
    # For more information about these
    # payment options, see [Take
    # Payments](https://developer.squareup.com/docs/payments-api/take-payments).
    # The `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required
    # to enable application fees.
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Cancels (voids) a payment identified by the idempotency key that is
    # specified in the
    # request.
    # Use this method when status of a CreatePayment request is unknown. For
    # example, after you send a
    # CreatePayment request a network error occurs and you don't get a response.
    # In this case, you can
    # direct Square to cancel the payment using this endpoint. In the request,
    # you provide the same
    # idempotency key that you provided in your CreatePayment request you want
    # to cancel. After
    # cancelling the payment, you can submit your CreatePayment request again.
    # Note that if no payment with the specified idempotency key is found, no
    # action is taken, the end
    # point returns successfully.
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves details for a specific Payment.
    # @param [String] payment_id Required parameter: Unique ID for the desired
    # `Payment`.
    # @return [GetPaymentResponse Hash] response from the API call
    def get_payment(payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => payment_id
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

    # Cancels (voids) a payment. If you set `autocomplete` to false when
    # creating a payment,
    # you can cancel the payment using this endpoint. For more information, see
    # [Delayed
    # Payments](https://developer.squareup.com/docs/payments-api/take-payments#d
    # elayed-payments).
    # @param [String] payment_id Required parameter: `payment_id` identifying
    # the payment to be canceled.
    # @return [CancelPaymentResponse Hash] response from the API call
    def cancel_payment(payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => payment_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Completes (captures) a payment.
    # By default, payments are set to complete immediately after they are
    # created.
    # If you set autocomplete to false when creating a payment, you can complete
    # (capture)
    # the payment using this endpoint. For more information, see
    # [Delayed
    # Payments](https://developer.squareup.com/docs/payments-api/take-payments#d
    # elayed-payments).
    # @param [String] payment_id Required parameter: Unique ID identifying the
    # payment to be completed.
    # @return [CompletePaymentResponse Hash] response from the API call
    def complete_payment(payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payments/{payment_id}/complete'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payment_id' => payment_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
