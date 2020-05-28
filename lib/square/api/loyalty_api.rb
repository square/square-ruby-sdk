module Square
  # LoyaltyApi
  class LoyaltyApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a loyalty account. For more information, see
    # [Create a loyalty
    # account](https://developer.squareup.com/docs/docs/loyalty-api/overview/#lo
    # yalty-overview-create-account).
    # @param [CreateLoyaltyAccountRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateLoyaltyAccountResponse Hash] response from the API call
    def create_loyalty_account(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Searches for loyalty accounts.
    # In the current implementation, you can search for a loyalty account using
    # the phone number associated with the account.
    # If no phone number is provided, all loyalty accounts are returned.
    # @param [SearchLoyaltyAccountsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchLoyaltyAccountsResponse Hash] response from the API call
    def search_loyalty_accounts(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves a loyalty account.
    # @param [String] account_id Required parameter: The ID of the [loyalty
    # account](#type-LoyaltyAccount) to retrieve.
    # @return [RetrieveLoyaltyAccountResponse Hash] response from the API call
    def retrieve_loyalty_account(account_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => account_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Adds points to a loyalty account.
    # - If you are using the Orders API to manage orders, you only provide the
    # `order_id`.
    # The endpoint reads the order to compute points to add to the buyer's
    # account.
    # - If you are not using the Orders API to manage orders,
    # you first perform a client-side computation to compute the points.
    # For spend-based and visit-based programs, you can call
    # `CalculateLoyaltyPoints` to compute the points. For more information,
    # see [Loyalty Program
    # Overview](https://developer.squareup.com/docs/docs/loyalty/overview).
    # You then provide the points in a request to this endpoint.
    # For more information, see [Accumulate
    # points](https://developer.squareup.com/docs/docs/loyalty-api/overview/#acc
    # umulate-points).
    # @param [String] account_id Required parameter: The [loyalty
    # account](#type-LoyaltyAccount) ID to which to add the points.
    # @param [AccumulateLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [AccumulateLoyaltyPointsResponse Hash] response from the API call
    def accumulate_loyalty_points(account_id:,
                                  body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}/accumulate'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => account_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Adds points to or subtracts points from a buyer's account.
    # Use this endpoint only when you need to manually adjust points. Otherwise,
    # in your application flow, you call
    # [AccumulateLoyaltyPoints](https://developer.squareup.com/docs/reference/sq
    # uare/loyalty-api/accumulate-loyalty-points)
    # to add points when a buyer pays for the purchase.
    # @param [String] account_id Required parameter: The ID of the [loyalty
    # account](#type-LoyaltyAccount) in which to adjust the points.
    # @param [AdjustLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [AdjustLoyaltyPointsResponse Hash] response from the API call
    def adjust_loyalty_points(account_id:,
                              body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}/adjust'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => account_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Searches for loyalty events.
    # A Square loyalty program maintains a ledger of events that occur during
    # the lifetime of a
    # buyer's loyalty account. Each change in the point balance
    # (for example, points earned, points redeemed, and points expired) is
    # recorded in the ledger. Using this endpoint, you can search the ledger for
    # events.
    # For more information, see
    # [Loyalty
    # events](https://developer.squareup.com/docs/docs/loyalty-api/overview/#loy
    # alty-events).
    # @param [SearchLoyaltyEventsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchLoyaltyEventsResponse Hash] response from the API call
    def search_loyalty_events(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/events/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a list of loyalty programs in the seller's account.
    # Currently, a seller can only have one loyalty program. For more
    # information, see
    # [Loyalty
    # Overview](https://developer.squareup.com/docs/docs/loyalty/overview).
    # .
    # @return [ListLoyaltyProgramsResponse Hash] response from the API call
    def list_loyalty_programs
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Calculates the points a purchase earns.
    # - If you are using the Orders API to manage orders, you provide `order_id`
    # in the request. The
    # endpoint calculates the points by reading the order.
    # - If you are not using the Orders API to manage orders, you provide the
    # purchase amount in
    # the request for the endpoint to calculate the points.
    # An application might call this endpoint to show the points that a buyer
    # can earn with the
    # specific purchase.
    # @param [String] program_id Required parameter: The [loyalty
    # program](#type-LoyaltyProgram) ID, which defines the rules for accruing
    # points.
    # @param [CalculateLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CalculateLoyaltyPointsResponse Hash] response from the API call
    def calculate_loyalty_points(program_id:,
                                 body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}/calculate'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'program_id' => program_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Creates a loyalty reward. In the process, the endpoint does following:
    # - Uses the `reward_tier_id` in the request to determine the number of
    # points
    # to lock for this reward.
    # - If the request includes `order_id`, it adds the reward and related
    # discount to the order.
    # After a reward is created, the points are locked and
    # not available for the buyer to redeem another reward.
    # For more information, see
    # [Loyalty
    # rewards](https://developer.squareup.com/docs/docs/loyalty-api/overview/#lo
    # yalty-overview-loyalty-rewards).
    # @param [CreateLoyaltyRewardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateLoyaltyRewardResponse Hash] response from the API call
    def create_loyalty_reward(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Searches for loyalty rewards in a loyalty account.
    # In the current implementation, the endpoint supports search by the reward
    # `status`.
    # If you know a reward ID, use the
    # [RetrieveLoyaltyReward](https://developer.squareup.com/docs/reference/squa
    # re/loyalty-api/retrieve-loyalty-reward) endpoint.
    # For more information about loyalty rewards, see
    # [Loyalty
    # Rewards](https://developer.squareup.com/docs/docs/loyalty-api/overview/#lo
    # yalty-rewards).
    # @param [SearchLoyaltyRewardsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchLoyaltyRewardsResponse Hash] response from the API call
    def search_loyalty_rewards(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Deletes a loyalty reward by doing the following:
    # - Returns the loyalty points back to the loyalty account.
    # - If an order ID was specified when the reward was created
    # (see
    # [CreateLoyaltyReward](https://developer.squareup.com/docs/reference/square
    # /loyalty-api/create-loyalty-reward)),
    # it updates the order by removing the reward and related
    # discounts.
    # You cannot delete a reward that has reached the terminal state (REDEEMED).
    # For more information, see
    # [Loyalty
    # rewards](https://developer.squareup.com/docs/docs/loyalty-api/overview/#lo
    # yalty-overview-loyalty-rewards).
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward](#type-LoyaltyReward) to delete.
    # @return [DeleteLoyaltyRewardResponse Hash] response from the API call
    def delete_loyalty_reward(reward_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => reward_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves a loyalty reward.
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward](#type-LoyaltyReward) to retrieve.
    # @return [RetrieveLoyaltyRewardResponse Hash] response from the API call
    def retrieve_loyalty_reward(reward_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => reward_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Redeems a loyalty reward.
    # The endpoint sets the reward to the terminal state (`REDEEMED`).
    # If you are using your own order processing system (not using the
    # Orders API), you call this endpoint after the buyer paid for the
    # purchase.
    # After the reward reaches the terminal state, it cannot be deleted.
    # In other words, points used for the reward cannot be returned
    # to the account.
    # For more information, see
    # [Loyalty
    # rewards](https://developer.squareup.com/docs/docs/loyalty-api/overview/#lo
    # yalty-overview-loyalty-rewards).
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward](#type-LoyaltyReward) to redeem.
    # @param [RedeemLoyaltyRewardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [RedeemLoyaltyRewardResponse Hash] response from the API call
    def redeem_loyalty_reward(reward_id:,
                              body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}/redeem'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => reward_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
