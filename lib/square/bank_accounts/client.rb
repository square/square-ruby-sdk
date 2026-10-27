# frozen_string_literal: true

module Square
  module BankAccounts
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns a list of [BankAccount](entity:BankAccount) objects linked to a Square account.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::BankAccount` in the
      # `bank_accounts` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as
      # a `Square::Types::ListBankAccountsResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :location_id
      # @option params [String, nil] :customer_id
      #
      # @example
      #   client.bank_accounts.list(
      #     cursor: "cursor",
      #     limit: 1,
      #     location_id: "location_id",
      #     customer_id: "customer_id"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["customer_id"] = params[:customer_id] if params.key?(:customer_id)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :bank_accounts,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/bank-accounts",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListBankAccountsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Store a bank account on file for a square account
      #
      # @param request_options [Hash]
      # @param params [Square::BankAccounts::Types::CreateBankAccountRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.bank_accounts.create_bank_account(
      #     idempotency_key: "4e43559a-f0fd-47d3-9da2-7ea1f97d94be",
      #     source_id: "bnon:CA4SEHsQwr0rx6DbWLD5BQaqMnoYAQ",
      #     customer_id: "HM3B2D5JKGZ69359BTEHXM2V8M"
      #   )
      #
      # @return [Square::Types::CreateBankAccountResponse]
      def create_bank_account(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bank-accounts",
          body: Square::BankAccounts::Types::CreateBankAccountRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateBankAccountResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank account ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :v_1_bank_account_id
      #
      # @example
      #   client.bank_accounts.get_by_v_1_id(v_1_bank_account_id: "v1_bank_account_id")
      #
      # @return [Square::Types::GetBankAccountByV1IdResponse]
      def get_by_v_1_id(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/bank-accounts/by-v1-id/#{URI.encode_uri_component(params[:v_1_bank_account_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetBankAccountByV1IdResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve details of a [BankAccount](entity:BankAccount) bank account linked to a Square account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :bank_account_id
      #
      # @example
      #   client.bank_accounts.get(bank_account_id: "bank_account_id")
      #
      # @return [Square::Types::GetBankAccountResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/bank-accounts/#{URI.encode_uri_component(params[:bank_account_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetBankAccountResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Disable a bank account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :bank_account_id
      #
      # @example
      #   client.bank_accounts.disable_bank_account(bank_account_id: "bank_account_id")
      #
      # @return [Square::Types::DisableBankAccountResponse]
      def disable_bank_account(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bank-accounts/#{URI.encode_uri_component(params[:bank_account_id].to_s)}/disable",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DisableBankAccountResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
