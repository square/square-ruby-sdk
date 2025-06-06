module Square
  # MerchantsApi
  class MerchantsApi < BaseApi
    # Provides details about the merchant associated with a given access token.
    # The access token used to connect your application to a Square seller is
    # associated
    # with a single merchant. That means that `ListMerchants` returns a list
    # with a single `Merchant` object. You can specify your personal access
    # token
    # to get your own merchant information or specify an OAuth token to get the
    # information for the merchant that granted your application access.
    # If you know the merchant ID, you can also use the
    # [RetrieveMerchant]($e/Merchants/RetrieveMerchant)
    # endpoint to retrieve the merchant information.
    # @param [Integer] cursor Optional parameter: The cursor generated by the
    # previous response.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_merchants(cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/merchants',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves the `Merchant` object for the given `merchant_id`.
    # @param [String] merchant_id Required parameter: The ID of the merchant to
    # retrieve. If the string "me" is supplied as the ID, then retrieve the
    # merchant that is currently accessible to this call.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_merchant(merchant_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/merchants/{merchant_id}',
                                     'default')
                   .template_param(new_parameter(merchant_id, key: 'merchant_id')
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
