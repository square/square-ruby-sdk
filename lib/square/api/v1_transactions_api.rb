module Square
  # V1TransactionsApi
  class V1TransactionsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Provides non-confidential details for all of a location's associated bank
    # accounts. This endpoint does not provide full bank account numbers, and
    # there is no way to obtain a full bank account number with the Connect API.
    # @param [String] location_id Required parameter: The ID of the location to
    # list bank accounts for.
    # @return [List of V1BankAccount Hash] response from the API call
    def list_bank_accounts(location_id:)
      warn 'Endpoint list_bank_accounts in V1TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/bank-accounts'
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

    # Provides non-confidential details for a merchant's associated bank
    # account. This endpoint does not provide full bank account numbers, and
    # there is no way to obtain a full bank account number with the Connect API.
    # @param [String] location_id Required parameter: The ID of the bank
    # account's associated location.
    # @param [String] bank_account_id Required parameter: The bank account's
    # Square-issued ID. You obtain this value from Settlement objects
    # returned.
    # @return [V1BankAccount Hash] response from the API call
    def retrieve_bank_account(location_id:,
                              bank_account_id:)
      warn 'Endpoint retrieve_bank_account in V1TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/bank-accounts/{bank_account_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'bank_account_id' => bank_account_id
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

    # Provides summary information for a merchant's online store orders.
    # @param [String] location_id Required parameter: The ID of the location to
    # list online store orders for.
    # @param [SortOrder] order Optional parameter: TThe order in which payments
    # are listed in the response.
    # @param [Integer] limit Optional parameter: The maximum number of payments
    # to return in a single response. This value cannot exceed 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Order Hash] response from the API call
    def list_orders(location_id:,
                    order: nil,
                    limit: nil,
                    batch_token: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/orders'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
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

    # Provides comprehensive information for a single online store order,
    # including the order's history.
    # @param [String] location_id Required parameter: The ID of the order's
    # associated location.
    # @param [String] order_id Required parameter: The order's Square-issued ID.
    # You obtain this value from Order objects returned by the List Orders
    # endpoint
    # @return [V1Order Hash] response from the API call
    def retrieve_order(location_id:,
                       order_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/orders/{order_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'order_id' => order_id
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

    # Updates the details of an online store order. Every update you perform on
    # an order corresponds to one of three actions:
    # @param [String] location_id Required parameter: The ID of the order's
    # associated location.
    # @param [String] order_id Required parameter: The order's Square-issued ID.
    # You obtain this value from Order objects returned by the List Orders
    # endpoint
    # @param [V1UpdateOrderRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [V1Order Hash] response from the API call
    def update_order(location_id:,
                     order_id:,
                     body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/orders/{order_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'order_id' => order_id
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

    # Provides summary information for all payments taken for a given
    # Square account during a date range. Date ranges cannot exceed 1 year in
    # length. See Date ranges for details of inclusive and exclusive dates.
    # *Note**: Details for payments processed with Square Point of Sale while
    # in offline mode may not be transmitted to Square for up to 72 hours.
    # Offline payments have a `created_at` value that reflects the time the
    # payment was originally processed, not the time it was subsequently
    # transmitted to Square. Consequently, the ListPayments endpoint might
    # list an offline payment chronologically between online payments that
    # were seen in a previous request.
    # @param [String] location_id Required parameter: The ID of the location to
    # list payments for. If you specify me, this endpoint returns payments
    # aggregated from all of the business's locations.
    # @param [SortOrder] order Optional parameter: The order in which payments
    # are listed in the response.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. If this value is before
    # January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error.
    # Default value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in ISO 8601 format. If this value is more than one year
    # greater than begin_time, this endpoint returns an error. Default value:
    # The current time.
    # @param [Integer] limit Optional parameter: The maximum number of payments
    # to return in a single response. This value cannot exceed 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @param [Boolean] include_partial Optional parameter: Indicates whether or
    # not to include partial payments in the response. Partial payments will
    # have the tenders collected so far, but the itemizations will be empty
    # until the payment is completed.
    # @return [List of V1Payment Hash] response from the API call
    def list_payments(location_id:,
                      order: nil,
                      begin_time: nil,
                      end_time: nil,
                      limit: nil,
                      batch_token: nil,
                      include_partial: false)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/payments'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'begin_time' => begin_time,
        'end_time' => end_time,
        'limit' => limit,
        'batch_token' => batch_token,
        'include_partial' => include_partial
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

    # Provides comprehensive information for a single payment.
    # @param [String] location_id Required parameter: The ID of the payment's
    # associated location.
    # @param [String] payment_id Required parameter: The Square-issued payment
    # ID. payment_id comes from Payment objects returned by the List Payments
    # endpoint, Settlement objects returned by the List Settlements endpoint, or
    # Refund objects returned by the List Refunds endpoint.
    # @return [V1Payment Hash] response from the API call
    def retrieve_payment(location_id:,
                         payment_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/payments/{payment_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
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

    # Provides the details for all refunds initiated by a merchant or any of the
    # merchant's mobile staff during a date range. Date ranges cannot exceed one
    # year in length.
    # @param [String] location_id Required parameter: The ID of the location to
    # list refunds for.
    # @param [SortOrder] order Optional parameter: TThe order in which payments
    # are listed in the response.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. If this value is before
    # January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error.
    # Default value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in ISO 8601 format. If this value is more than one year
    # greater than begin_time, this endpoint returns an error. Default value:
    # The current time.
    # @param [Integer] limit Optional parameter: The approximate number of
    # refunds to return in a single response. Default: 100. Max: 200. Response
    # may contain more results than the prescribed limit when refunds are made
    # simultaneously to multiple tenders in a payment or when refunds are
    # generated in an exchange to account for the value of returned goods.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Refund Hash] response from the API call
    def list_refunds(location_id:,
                     order: nil,
                     begin_time: nil,
                     end_time: nil,
                     limit: nil,
                     batch_token: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/refunds'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'begin_time' => begin_time,
        'end_time' => end_time,
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

    # Issues a refund for a previously processed payment. You must issue
    # a refund within 60 days of the associated payment.
    # You cannot issue a partial refund for a split tender payment. You must
    # instead issue a full or partial refund for a particular tender, by
    # providing the applicable tender id to the V1CreateRefund endpoint.
    # Issuing a full refund for a split tender payment refunds all tenders
    # associated with the payment.
    # Issuing a refund for a card payment is not reversible. For development
    # purposes, you can create fake cash payments in Square Point of Sale and
    # refund them.
    # @param [String] location_id Required parameter: The ID of the original
    # payment's associated location.
    # @param [V1CreateRefundRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [V1Refund Hash] response from the API call
    def create_refund(location_id:,
                      body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/refunds'
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

    # Provides summary information for all deposits and withdrawals
    # initiated by Square to a linked bank account during a date range. Date
    # ranges cannot exceed one year in length.
    # *Note**: the ListSettlements endpoint does not provide entry
    # information.
    # @param [String] location_id Required parameter: The ID of the location to
    # list settlements for. If you specify me, this endpoint returns settlements
    # aggregated from all of the business's locations.
    # @param [SortOrder] order Optional parameter: The order in which
    # settlements are listed in the response.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. If this value is before
    # January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error.
    # Default value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in ISO 8601 format. If this value is more than one year
    # greater than begin_time, this endpoint returns an error. Default value:
    # The current time.
    # @param [Integer] limit Optional parameter: The maximum number of
    # settlements to return in a single response. This value cannot exceed
    # 200.
    # @param [V1ListSettlementsRequestStatus] status Optional parameter: Provide
    # this parameter to retrieve only settlements with a particular status (SENT
    # or FAILED).
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Settlement Hash] response from the API call
    def list_settlements(location_id:,
                         order: nil,
                         begin_time: nil,
                         end_time: nil,
                         limit: nil,
                         status: nil,
                         batch_token: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/settlements'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'begin_time' => begin_time,
        'end_time' => end_time,
        'limit' => limit,
        'status' => status,
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

    # Provides comprehensive information for a single settlement.
    # The returned `Settlement` objects include an `entries` field that lists
    # the transactions that contribute to the settlement total. Most
    # settlement entries correspond to a payment payout, but settlement
    # entries are also generated for less common events, like refunds, manual
    # adjustments, or chargeback holds.
    # Square initiates its regular deposits as indicated in the
    # [Deposit Options with
    # Square](https://squareup.com/help/us/en/article/3807)
    # help article. Details for a regular deposit are usually not available
    # from Connect API endpoints before 10 p.m. PST the same day.
    # Square does not know when an initiated settlement **completes**, only
    # whether it has failed. A completed settlement is typically reflected in
    # a bank account within 3 business days, but in exceptional cases it may
    # take longer.
    # @param [String] location_id Required parameter: The ID of the
    # settlements's associated location.
    # @param [String] settlement_id Required parameter: The settlement's
    # Square-issued ID. You obtain this value from Settlement objects returned
    # by the List Settlements endpoint.
    # @return [V1Settlement Hash] response from the API call
    def retrieve_settlement(location_id:,
                            settlement_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/settlements/{settlement_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'settlement_id' => settlement_id
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
