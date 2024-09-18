module Square
  # BankAccountsApi
  class BankAccountsApi < BaseApi
    # Returns a list of [BankAccount]($m/BankAccount) objects linked to a Square
    # account.
    # @param [String] cursor Optional parameter: The pagination cursor returned
    # by a previous call to this endpoint. Use it in the next `ListBankAccounts`
    # request to retrieve the next set  of results.  See the
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion) guide for more information.
    # @param [Integer] limit Optional parameter: Upper limit on the number of
    # bank accounts to return in the response.  Currently, 1000 is the largest
    # supported limit. You can specify a limit  of up to 1000 bank accounts.
    # This is also the default limit.
    # @param [String] location_id Optional parameter: Location ID. You can
    # specify this optional filter  to retrieve only the linked bank accounts
    # belonging to a specific location.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_bank_accounts(cursor: nil,
                           limit: nil,
                           location_id: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bank-accounts',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns details of a [BankAccount]($m/BankAccount) identified by V1 bank
    # account ID.
    # @param [String] v1_bank_account_id Required parameter: Connect V1 ID of
    # the desired `BankAccount`. For more information, see  [Retrieve a bank
    # account by using an ID issued by V1 Bank Accounts
    # API](https://developer.squareup.com/docs/bank-accounts-api#retrieve-a-bank
    # -account-by-using-an-id-issued-by-v1-bank-accounts-api).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_bank_account_by_v1_id(v1_bank_account_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bank-accounts/by-v1-id/{v1_bank_account_id}',
                                     'default')
                   .template_param(new_parameter(v1_bank_account_id, key: 'v1_bank_account_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns details of a [BankAccount]($m/BankAccount)
    # linked to a Square account.
    # @param [String] bank_account_id Required parameter: Square-issued ID of
    # the desired `BankAccount`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_bank_account(bank_account_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bank-accounts/{bank_account_id}',
                                     'default')
                   .template_param(new_parameter(bank_account_id, key: 'bank_account_id')
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
