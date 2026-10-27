# frozen_string_literal: true

module Square
  module Loyalty
    module Rewards
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Creates a loyalty reward. In the process, the endpoint does following:
        #
        # - Uses the `reward_tier_id` in the request to determine the number of points
        # to lock for this reward.
        # - If the request includes `order_id`, it adds the reward and related discount to the order.
        #
        # After a reward is created, the points are locked and
        # not available for the buyer to redeem another reward.
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Rewards::Types::CreateLoyaltyRewardRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.loyalty.rewards.create(
        #     reward: {
        #       loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd",
        #       reward_tier_id: "e1b39225-9da5-43d1-a5db-782cdd8ad94f",
        #       order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY"
        #     },
        #     idempotency_key: "18c2e5ea-a620-4b1f-ad60-7b167285e451"
        #   )
        #
        # @return [Square::Types::CreateLoyaltyRewardResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/rewards",
            body: Square::Loyalty::Rewards::Types::CreateLoyaltyRewardRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateLoyaltyRewardResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Searches for loyalty rewards. This endpoint accepts a request with no query filters and returns results for
        # all loyalty accounts.
        # If you include a `query` object, `loyalty_account_id` is required and `status` is  optional.
        #
        # If you know a reward ID, use the
        # [RetrieveLoyaltyReward](api-endpoint:Loyalty-RetrieveLoyaltyReward) endpoint.
        #
        # Search results are sorted by `updated_at` in descending order.
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Rewards::Types::SearchLoyaltyRewardsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.loyalty.rewards.search(
        #     query: {
        #       loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd"
        #     },
        #     limit: 10
        #   )
        #
        # @return [Square::Types::SearchLoyaltyRewardsResponse]
        def search(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/rewards/search",
            body: Square::Loyalty::Rewards::Types::SearchLoyaltyRewardsRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::SearchLoyaltyRewardsResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a loyalty reward.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :reward_id
        #
        # @example
        #   client.loyalty.rewards.get(reward_id: "reward_id")
        #
        # @return [Square::Types::GetLoyaltyRewardResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/loyalty/rewards/#{URI.encode_uri_component(params[:reward_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetLoyaltyRewardResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a loyalty reward by doing the following:
        #
        # - Returns the loyalty points back to the loyalty account.
        # - If an order ID was specified when the reward was created
        # (see [CreateLoyaltyReward](api-endpoint:Loyalty-CreateLoyaltyReward)),
        # it updates the order by removing the reward and related
        # discounts.
        #
        # You cannot delete a reward that has reached the terminal state (REDEEMED).
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :reward_id
        #
        # @example
        #   client.loyalty.rewards.delete(reward_id: "reward_id")
        #
        # @return [Square::Types::DeleteLoyaltyRewardResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/loyalty/rewards/#{URI.encode_uri_component(params[:reward_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteLoyaltyRewardResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Redeems a loyalty reward.
        #
        # The endpoint sets the reward to the `REDEEMED` terminal state.
        #
        # If you are using your own order processing system (not using the
        # Orders API), you call this endpoint after the buyer paid for the
        # purchase.
        #
        # After the reward reaches the terminal state, it cannot be deleted.
        # In other words, points used for the reward cannot be returned
        # to the account.
        #
        # @param request_options [Hash]
        # @param params [Square::Loyalty::Rewards::Types::RedeemLoyaltyRewardRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :reward_id
        #
        # @example
        #   client.loyalty.rewards.redeem(
        #     reward_id: "reward_id",
        #     idempotency_key: "98adc7f7-6963-473b-b29c-f3c9cdd7d994",
        #     location_id: "P034NEENMD09F"
        #   )
        #
        # @return [Square::Types::RedeemLoyaltyRewardResponse]
        def redeem(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Loyalty::Rewards::Types::RedeemLoyaltyRewardRequest.new(params).to_h
          non_body_param_names = %w[reward_id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/rewards/#{URI.encode_uri_component(params[:reward_id].to_s)}/redeem",
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
            (response.body.to_s.empty? ? nil : Square::Types::RedeemLoyaltyRewardResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
