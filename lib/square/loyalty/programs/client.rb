# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns a list of loyalty programs in the seller's account.
        # Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only
        # one loyalty program, which is created and managed from the Seller Dashboard. For more information, see
        # [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
        #
        #
        # Replaced with [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when used with the keyword
        # `main`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Square::Types::ListLoyaltyProgramsResponse]
        def list(request_options: {}, **params)
          Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/loyalty/programs",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListLoyaltyProgramsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`.
        #
        # Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only
        # one loyalty program, which is created and managed from the Seller Dashboard. For more information, see
        # [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :program_id
        #
        # @return [Square::Types::GetLoyaltyProgramResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/loyalty/programs/#{params[:program_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetLoyaltyProgramResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Calculates the number of points a buyer can earn from a purchase. Applications might call this endpoint
        # to display the points to the buyer.
        #
        # - If you are using the Orders API to manage orders, provide the `order_id` and (optional)
        # `loyalty_account_id`.
        # Square reads the order to compute the points earned from the base loyalty program and an associated
        # [loyalty promotion](entity:LoyaltyPromotion).
        #
        # - If you are not using the Orders API to manage orders, provide `transaction_amount_money` with the
        # purchase amount. Square uses this amount to calculate the points earned from the base loyalty program,
        # but not points earned from a loyalty promotion. For spend-based and visit-based programs, the `tax_mode`
        # setting of the accrual rule indicates how taxes should be treated for loyalty points accrual.
        # If the purchase qualifies for program points, call
        # [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) and perform a client-side computation
        # to calculate whether the purchase also qualifies for promotion points. For more information, see
        # [Calculating promotion
        # points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Programs::Types::CalculateLoyaltyPointsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :program_id
        #
        # @return [Square::Types::CalculateLoyaltyPointsResponse]
        def calculate(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Loyalty::Programs::Types::CalculateLoyaltyPointsRequest.new(params).to_h
          non_body_param_names = ["program_id"]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/programs/#{params[:program_id]}/calculate",
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
            Square::Types::CalculateLoyaltyPointsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @return [Square::Promotions::Client]
        def promotions
          @promotions ||= Square::Loyalty::Programs::Promotions::Client.new(client: @client)
        end
      end
    end
  end
end
