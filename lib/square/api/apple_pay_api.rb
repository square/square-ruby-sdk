module Square
  # ApplePayApi
  class ApplePayApi < BaseApi
    # Activates a domain for use with Apple Pay on the Web and Square. A
    # validation
    # is performed on this domain by Apple to ensure that it is properly set up
    # as
    # an Apple Pay enabled domain.
    # This endpoint provides an easy way for platform developers to bulk
    # activate
    # Apple Pay on the Web with Square for merchants using their platform.
    # Note: The SqPaymentForm library is deprecated as of May 13, 2021, and will
    # only receive critical security updates until it is retired on October 31,
    # 2022.
    # You must migrate your payment form code to the Web Payments SDK to
    # continue using your domain for Apple Pay. For more information on
    # migrating to the Web Payments SDK, see [Migrate to the Web Payments
    # SDK](https://developer.squareup.com/docs/web-payments/migrate).
    # To learn more about the Web Payments SDK and how to add Apple Pay, see
    # [Take an Apple Pay
    # Payment](https://developer.squareup.com/docs/web-payments/apple-pay).
    # @param [RegisterDomainRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [RegisterDomainResponse Hash] response from the API call
    def register_domain(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/apple-pay/domains',
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
  end
end
