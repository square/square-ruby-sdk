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
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[cursor limit location_id]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :bank_accounts,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/bank-accounts",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListBankAccountsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end

      # Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank account ID.
      #
      # @return [Square::Types::GetBankAccountByV1IdResponse]
      def get_by_v_1_id(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/bank-accounts/by-v1-id/#{params[:v1_bank_account_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetBankAccountByV1IdResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns details of a [BankAccount](entity:BankAccount)
      # linked to a Square account.
      #
      # @return [Square::Types::GetBankAccountResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/bank-accounts/#{params[:bank_account_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetBankAccountResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
