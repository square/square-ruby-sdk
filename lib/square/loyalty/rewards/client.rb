# frozen_string_literal: true

module Square
  module Loyalty
    module Rewards
      class Client
        # @return [Square::Loyalty::Rewards::Client]
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
        # @return [Square::Types::CreateLoyaltyRewardResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/rewards",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
        end

        # Searches for loyalty rewards. This endpoint accepts a request with no query filters and returns results for all loyalty accounts.
        # If you include a `query` object, `loyalty_account_id` is required and `status` is  optional.
        #
        # If you know a reward ID, use the
        # [RetrieveLoyaltyReward](api-endpoint:Loyalty-RetrieveLoyaltyReward) endpoint.
        #
        # Search results are sorted by `updated_at` in descending order.
        #
        # @return [Square::Types::SearchLoyaltyRewardsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/rewards/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchLoyaltyRewardsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a loyalty reward.
        #
        # @return [Square::Types::GetLoyaltyRewardResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/loyalty/rewards/#{params[:reward_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
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
        # @return [Square::Types::DeleteLoyaltyRewardResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/loyalty/rewards/#{params[:reward_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
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
        # @return [Square::Types::RedeemLoyaltyRewardResponse]
        def redeem(request_options: {}, **params)
          _path_param_names = ["reward_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/rewards/#{params[:reward_id]}/redeem",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RedeemLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
