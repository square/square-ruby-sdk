# frozen_string_literal: true

module Square
  module Loyalty
    module Accounts
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Creates a loyalty account. To create a loyalty account, you must provide the `program_id` and a `mapping` with
        # the `phone_number` of the buyer.
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Accounts::Types::CreateLoyaltyAccountRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::CreateLoyaltyAccountResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/accounts",
            body: Square::Loyalty::Accounts::Types::CreateLoyaltyAccountRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateLoyaltyAccountResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Searches for loyalty accounts in a loyalty program.
        #
        # You can search for a loyalty account using the phone number or customer ID associated with the account. To
        # return all loyalty accounts, specify an empty `query` object or omit it entirely.
        #
        # Search results are sorted by `created_at` in ascending order.
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Accounts::Types::SearchLoyaltyAccountsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::SearchLoyaltyAccountsResponse]
        def search(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/accounts/search",
            body: Square::Loyalty::Accounts::Types::SearchLoyaltyAccountsRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::SearchLoyaltyAccountsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a loyalty account.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :account_id
        #
        # @return [Square::Types::GetLoyaltyAccountResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/loyalty/accounts/#{params[:account_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetLoyaltyAccountResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Adds points earned from a purchase to a [loyalty account](entity:LoyaltyAccount).
        #
        # - If you are using the Orders API to manage orders, provide the `order_id`. Square reads the order
        # to compute the points earned from both the base loyalty program and an associated
        # [loyalty promotion](entity:LoyaltyPromotion). For purchases that qualify for multiple accrual
        # rules, Square computes points based on the accrual rule that grants the most points.
        # For purchases that qualify for multiple promotions, Square computes points based on the most
        # recently created promotion. A purchase must first qualify for program points to be eligible for promotion
        # points.
        #
        # - If you are not using the Orders API to manage orders, provide `points` with the number of points to add.
        # You must first perform a client-side computation of the points earned from the loyalty program and
        # loyalty promotion. For spend-based and visit-based programs, you can call
        # [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints)
        # to compute the points earned from the base loyalty program. For information about computing points earned from
        # a loyalty promotion, see
        # [Calculating promotion
        # points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Accounts::Types::AccumulateLoyaltyPointsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :account_id
        #
        # @return [Square::Types::AccumulateLoyaltyPointsResponse]
        def accumulate_points(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Loyalty::Accounts::Types::AccumulateLoyaltyPointsRequest.new(params).to_h
          non_body_param_names = ["account_id"]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/accounts/#{params[:account_id]}/accumulate",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::AccumulateLoyaltyPointsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Adds points to or subtracts points from a buyer's account.
        #
        # Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call
        # [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints)
        # to add points when a buyer pays for the purchase.
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Accounts::Types::AdjustLoyaltyPointsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :account_id
        #
        # @return [Square::Types::AdjustLoyaltyPointsResponse]
        def adjust(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Loyalty::Accounts::Types::AdjustLoyaltyPointsRequest.new(params).to_h
          non_body_param_names = ["account_id"]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/accounts/#{params[:account_id]}/adjust",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::AdjustLoyaltyPointsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
