# frozen_string_literal: true

module Square
  module BankAccounts
    class Client
      # @return [Square::BankAccounts::Client]
      def initialize(client:)
        @client = client
      end

      # Returns a list of [BankAccount](entity:BankAccount) objects linked to a Square account.
      #
      # @return [Square::Types::ListBankAccountsResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[cursor limit location_id]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bank-accounts",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListBankAccountsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank account ID.
      #
      # @return [Square::Types::GetBankAccountByV1IdResponse]
      def get_by_v_1_id(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bank-accounts/by-v1-id/#{params[:v1_bank_account_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetBankAccountByV1IdResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns details of a [BankAccount](entity:BankAccount)
      # linked to a Square account.
      #
      # @return [Square::Types::GetBankAccountResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bank-accounts/#{params[:bank_account_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetBankAccountResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
