module Square
  # TerminalApi
  class TerminalApi < BaseApi
    # Creates a Terminal action request and sends it to the specified device.
    # @param [CreateTerminalActionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_terminal_action(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/actions',
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

    # Retrieves a filtered list of Terminal action requests created by the
    # account making the request. Terminal action requests are available for 30
    # days.
    # @param [SearchTerminalActionsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_terminal_actions(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/actions/search',
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

    # Retrieves a Terminal action request by `action_id`. Terminal action
    # requests are available for 30 days.
    # @param [String] action_id Required parameter: Unique ID for the desired
    # `TerminalAction`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_terminal_action(action_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/terminals/actions/{action_id}',
                                     'default')
                   .template_param(new_parameter(action_id, key: 'action_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Cancels a Terminal action request if the status of the request permits it.
    # @param [String] action_id Required parameter: Unique ID for the desired
    # `TerminalAction`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_terminal_action(action_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/actions/{action_id}/cancel',
                                     'default')
                   .template_param(new_parameter(action_id, key: 'action_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Dismisses a Terminal action request if the status and type of the request
    # permits it.
    # See [Link and Dismiss
    # Actions](https://developer.squareup.com/docs/terminal-api/advanced-feature
    # s/custom-workflows/link-and-dismiss-actions) for more details.
    # @param [String] action_id Required parameter: Unique ID for the
    # `TerminalAction` associated with the action to be dismissed.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def dismiss_terminal_action(action_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/actions/{action_id}/dismiss',
                                     'default')
                   .template_param(new_parameter(action_id, key: 'action_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a Terminal checkout request and sends it to the specified device
    # to take a payment
    # for the requested amount.
    # @param [CreateTerminalCheckoutRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_terminal_checkout(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/checkouts',
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

    # Returns a filtered list of Terminal checkout requests created by the
    # application making the request. Only Terminal checkout requests created
    # for the merchant scoped to the OAuth token are returned. Terminal checkout
    # requests are available for 30 days.
    # @param [SearchTerminalCheckoutsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_terminal_checkouts(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/checkouts/search',
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

    # Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout
    # requests are available for 30 days.
    # @param [String] checkout_id Required parameter: The unique ID for the
    # desired `TerminalCheckout`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_terminal_checkout(checkout_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/terminals/checkouts/{checkout_id}',
                                     'default')
                   .template_param(new_parameter(checkout_id, key: 'checkout_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Cancels a Terminal checkout request if the status of the request permits
    # it.
    # @param [String] checkout_id Required parameter: The unique ID for the
    # desired `TerminalCheckout`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_terminal_checkout(checkout_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/checkouts/{checkout_id}/cancel',
                                     'default')
                   .template_param(new_parameter(checkout_id, key: 'checkout_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Dismisses a Terminal checkout request if the status and type of the
    # request permits it.
    # @param [String] checkout_id Required parameter: Unique ID for the
    # `TerminalCheckout` associated with the checkout to be dismissed.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def dismiss_terminal_checkout(checkout_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/checkouts/{checkout_id}/dismiss',
                                     'default')
                   .template_param(new_parameter(checkout_id, key: 'checkout_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a request to refund an Interac payment completed on a Square
    # Terminal. Refunds for Interac payments on a Square Terminal are supported
    # only for Interac debit cards in Canada. Other refunds for Terminal
    # payments should use the Refunds API. For more information, see [Refunds
    # API]($e/Refunds).
    # @param [CreateTerminalRefundRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_terminal_refund(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/refunds',
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

    # Retrieves a filtered list of Interac Terminal refund requests created by
    # the seller making the request. Terminal refund requests are available for
    # 30 days.
    # @param [SearchTerminalRefundsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_terminal_refunds(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/refunds/search',
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

    # Retrieves an Interac Terminal refund object by ID. Terminal refund objects
    # are available for 30 days.
    # @param [String] terminal_refund_id Required parameter: The unique ID for
    # the desired `TerminalRefund`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_terminal_refund(terminal_refund_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/terminals/refunds/{terminal_refund_id}',
                                     'default')
                   .template_param(new_parameter(terminal_refund_id, key: 'terminal_refund_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Cancels an Interac Terminal refund request by refund request ID if the
    # status of the request permits it.
    # @param [String] terminal_refund_id Required parameter: The unique ID for
    # the desired `TerminalRefund`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_terminal_refund(terminal_refund_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/refunds/{terminal_refund_id}/cancel',
                                     'default')
                   .template_param(new_parameter(terminal_refund_id, key: 'terminal_refund_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Dismisses a Terminal refund request if the status and type of the request
    # permits it.
    # @param [String] terminal_refund_id Required parameter: Unique ID for the
    # `TerminalRefund` associated with the refund to be dismissed.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def dismiss_terminal_refund(terminal_refund_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/terminals/refunds/{terminal_refund_id}/dismiss',
                                     'default')
                   .template_param(new_parameter(terminal_refund_id, key: 'terminal_refund_id')
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
