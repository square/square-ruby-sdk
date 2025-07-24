# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/list_bank_accounts_response"
require_relative "../types/get_bank_account_by_v_1_id_response"
require_relative "../types/get_bank_account_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class BankAccountsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::BankAccountsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of [BankAccount](entity:BankAccount) objects linked to a Square
#  account.
    #
    # @param cursor [String] The pagination cursor returned by a previous call to this endpoint.
#  Use it in the next `ListBankAccounts` request to retrieve the next set
#  of results.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param limit [Integer] Upper limit on the number of bank accounts to return in the response.
#  Currently, 1000 is the largest supported limit. You can specify a limit
#  of up to 1000 bank accounts. This is also the default limit.
    # @param location_id [String] Location ID. You can specify this optional filter
#  to retrieve only the linked bank accounts belonging to a specific location.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListBankAccountsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bank_accounts.list
    def list(cursor: nil, limit: nil, location_id: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bank-accounts"
end
      square.rb::ListBankAccountsResponse.from_json(json_object: response.body)
    end
# Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank
#  account ID.
    #
    # @param v_1_bank_account_id [String] Connect V1 ID of the desired `BankAccount`. For more information, see
#  [Retrieve a bank account by using an ID issued by V1 Bank Accounts
#  unts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBankAccountByV1IdResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bank_accounts.get_by_v_1_id(v_1_bank_account_id: "v1_bank_account_id")
    def get_by_v_1_id(v_1_bank_account_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bank-accounts/by-v1-id/#{v_1_bank_account_id}"
end
      square.rb::GetBankAccountByV1IdResponse.from_json(json_object: response.body)
    end
# Returns details of a [BankAccount](entity:BankAccount)
#  linked to a Square account.
    #
    # @param bank_account_id [String] Square-issued ID of the desired `BankAccount`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBankAccountResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bank_accounts.get(bank_account_id: "bank_account_id")
    def get(bank_account_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bank-accounts/#{bank_account_id}"
end
      square.rb::GetBankAccountResponse.from_json(json_object: response.body)
    end
  end
  class AsyncBankAccountsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncBankAccountsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of [BankAccount](entity:BankAccount) objects linked to a Square
#  account.
    #
    # @param cursor [String] The pagination cursor returned by a previous call to this endpoint.
#  Use it in the next `ListBankAccounts` request to retrieve the next set
#  of results.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param limit [Integer] Upper limit on the number of bank accounts to return in the response.
#  Currently, 1000 is the largest supported limit. You can specify a limit
#  of up to 1000 bank accounts. This is also the default limit.
    # @param location_id [String] Location ID. You can specify this optional filter
#  to retrieve only the linked bank accounts belonging to a specific location.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListBankAccountsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bank_accounts.list
    def list(cursor: nil, limit: nil, location_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bank-accounts"
end
        square.rb::ListBankAccountsResponse.from_json(json_object: response.body)
      end
    end
# Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank
#  account ID.
    #
    # @param v_1_bank_account_id [String] Connect V1 ID of the desired `BankAccount`. For more information, see
#  [Retrieve a bank account by using an ID issued by V1 Bank Accounts
#  unts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBankAccountByV1IdResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bank_accounts.get_by_v_1_id(v_1_bank_account_id: "v1_bank_account_id")
    def get_by_v_1_id(v_1_bank_account_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bank-accounts/by-v1-id/#{v_1_bank_account_id}"
end
        square.rb::GetBankAccountByV1IdResponse.from_json(json_object: response.body)
      end
    end
# Returns details of a [BankAccount](entity:BankAccount)
#  linked to a Square account.
    #
    # @param bank_account_id [String] Square-issued ID of the desired `BankAccount`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBankAccountResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bank_accounts.get(bank_account_id: "bank_account_id")
    def get(bank_account_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bank-accounts/#{bank_account_id}"
end
        square.rb::GetBankAccountResponse.from_json(json_object: response.body)
      end
    end
  end
end