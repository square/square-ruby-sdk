module Square
  # BankAccountsApi
  class BankAccountsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Returns a list of [BankAccount](#type-bankaccount) objects linked to a
    # Square account.
    # For more information, see
    # [Bank Accounts
    # API](https://developer.squareup.com/docs/docs/bank-accounts-api).
    # @param [String] cursor Optional parameter: The pagination cursor returned
    # by a previous call to this endpoint. Use it in the next `ListBankAccounts`
    # request to retrieve the next set  of results.  See the
    # [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pa
    # gination) guide for more information.
    # @param [Integer] limit Optional parameter: Upper limit on the number of
    # bank accounts to return in the response.  Currently, 1000 is the largest
    # supported limit. You can specify a limit  of up to 1000 bank accounts.
    # This is also the default limit.
    # @param [String] location_id Optional parameter: Location ID. You can
    # specify this optional filter  to retrieve only the linked bank accounts
    # belonging to a specific location.
    # @return [ListBankAccountsResponse Hash] response from the API call
    def list_bank_accounts(cursor: nil,
                           limit: nil,
                           location_id: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bank-accounts'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'limit' => limit,
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

    # Returns details of a [BankAccount](#type-bankaccount) identified by V1
    # bank account ID.
    # For more information, see
    # [Retrieve a bank account by using an ID issued by V1 Bank Accounts
    # API](https://developer.squareup.com/docs/docs/bank-accounts-api#retrieve-a
    # -bank-account-by-using-an-id-issued-by-the-v1-bank-accounts-api).
    # @param [String] v1_bank_account_id Required parameter: Connect V1 ID of
    # the desired `BankAccount`. For more information, see  [Retrieve a bank
    # account by using an ID issued by V1 Bank Accounts
    # API](https://developer.squareup.com/docs/docs/bank-accounts-api#retrieve-a
    # -bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
    # @return [GetBankAccountByV1IdResponse Hash] response from the API call
    def get_bank_account_by_v1_id(v1_bank_account_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bank-accounts/by-v1-id/{v1_bank_account_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'v1_bank_account_id' => v1_bank_account_id
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

    # Returns details of a [BankAccount](#type-bankaccount)
    # linked to a Square account. For more information, see
    # [Bank Accounts
    # API](https://developer.squareup.com/docs/docs/bank-accounts-api).
    # @param [String] bank_account_id Required parameter: Square-issued ID of
    # the desired `BankAccount`.
    # @return [GetBankAccountResponse Hash] response from the API call
    def get_bank_account(bank_account_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bank-accounts/{bank_account_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
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
  end
end
