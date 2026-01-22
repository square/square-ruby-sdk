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
        # @return [Square::Types::CreateLoyaltyRewardResponse]
        def create(request_options: {}, **params)
          body_prop_names = %i[reward idempotency_key]
          body_bag = params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/rewards",
            body: Square::Loyalty::Rewards::Types::CreateLoyaltyRewardRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateLoyaltyRewardResponse.load(response.body)
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
        # @return [Square::Types::SearchLoyaltyRewardsResponse]
        def search(request_options: {}, **params)
          body_prop_names = %i[query limit cursor]
          body_bag = params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/rewards/search",
            body: Square::Loyalty::Rewards::Types::SearchLoyaltyRewardsRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::SearchLoyaltyRewardsResponse.load(response.body)
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
        # @return [Square::Types::GetLoyaltyRewardResponse]
        def get(request_options: {}, **params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/loyalty/rewards/#{params[:reward_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetLoyaltyRewardResponse.load(response.body)
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
        # @return [Square::Types::DeleteLoyaltyRewardResponse]
        def delete(request_options: {}, **params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/loyalty/rewards/#{params[:reward_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteLoyaltyRewardResponse.load(response.body)
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
        # @return [Square::Types::RedeemLoyaltyRewardResponse]
        def redeem(request_options: {}, **params)
          path_param_names = %i[reward_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[idempotency_key location_id]
          body_bag = body_params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/loyalty/rewards/#{params[:reward_id]}/redeem",
            body: Square::Loyalty::Rewards::Types::RedeemLoyaltyRewardRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::RedeemLoyaltyRewardResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
