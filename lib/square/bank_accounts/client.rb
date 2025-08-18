
module Square
  module BankAccounts
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::BankAccounts::Client]
      def initialize(client)
        @client = client
      end

      # Returns a list of [BankAccount](entity:BankAccount) objects linked to a Square account.
      #
      # @return [Square::Types::ListBankAccountsResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListBankAccountsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank account ID.
      #
      # @return [Square::Types::GetBankAccountByV1IdResponse]
      def get_by_v_1_id(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetBankAccountByV1IdResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Returns details of a [BankAccount](entity:BankAccount)
      # linked to a Square account.
      #
      # @return [Square::Types::GetBankAccountResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetBankAccountResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
