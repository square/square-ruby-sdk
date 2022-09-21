module Square
  # LoyaltyApi
  class LoyaltyApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a loyalty account. To create a loyalty account, you must provide
    # the `program_id` and a `mapping` with the `phone_number` of the buyer.
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
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for loyalty accounts in a loyalty program.
    # You can search for a loyalty account using the phone number or customer ID
    # associated with the account. To return all loyalty accounts, specify an
    # empty `query` object or omit it entirely.
    # Search results are sorted by `created_at` in ascending order.
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
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a loyalty account.
    # @param [String] account_id Required parameter: The ID of the [loyalty
    # account]($m/LoyaltyAccount) to retrieve.
    # @return [RetrieveLoyaltyAccountResponse Hash] response from the API call
    def retrieve_loyalty_account(account_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => { 'value' => account_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Adds points earned from a purchase to a [loyalty
    # account]($m/LoyaltyAccount).
    # - If you are using the Orders API to manage orders, provide the
    # `order_id`. Square reads the order
    # to compute the points earned from both the base loyalty program and an
    # associated
    # [loyalty promotion]($m/LoyaltyPromotion). For purchases that qualify for
    # multiple accrual
    # rules, Square computes points based on the accrual rule that grants the
    # most points.
    # For purchases that qualify for multiple promotions, Square computes points
    # based on the most
    # recently created promotion. A purchase must first qualify for program
    # points to be eligible for promotion points.
    # - If you are not using the Orders API to manage orders, provide `points`
    # with the number of points to add.
    # You must first perform a client-side computation of the points earned from
    # the loyalty program and
    # loyalty promotion. For spend-based and visit-based programs, you can call
    # [CalculateLoyaltyPoints]($e/Loyalty/CalculateLoyaltyPoints)
    # to compute the points earned from the base loyalty program. For
    # information about computing points earned from a loyalty promotion, see
    # [Calculating promotion
    # points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions
    # #calculate-promotion-points).
    # @param [String] account_id Required parameter: The ID of the target
    # [loyalty account]($m/LoyaltyAccount).
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
        'account_id' => { 'value' => account_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Adds points to or subtracts points from a buyer's account.
    # Use this endpoint only when you need to manually adjust points. Otherwise,
    # in your application flow, you call
    # [AccumulateLoyaltyPoints]($e/Loyalty/AccumulateLoyaltyPoints)
    # to add points when a buyer pays for the purchase.
    # @param [String] account_id Required parameter: The ID of the target
    # [loyalty account]($m/LoyaltyAccount).
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
        'account_id' => { 'value' => account_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for loyalty events.
    # A Square loyalty program maintains a ledger of events that occur during
    # the lifetime of a
    # buyer's loyalty account. Each change in the point balance
    # (for example, points earned, points redeemed, and points expired) is
    # recorded in the ledger. Using this endpoint, you can search the ledger for
    # events.
    # Search results are sorted by `created_at` in descending order.
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
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns a list of loyalty programs in the seller's account.
    # Loyalty programs define how buyers can earn points and redeem points for
    # rewards. Square sellers can have only one loyalty program, which is
    # created and managed from the Seller Dashboard. For more information, see
    # [Loyalty Program
    # Overview](https://developer.squareup.com/docs/loyalty/overview).
    # Replaced with [RetrieveLoyaltyProgram]($e/Loyalty/RetrieveLoyaltyProgram)
    # when used with the keyword `main`.
    # @return [ListLoyaltyProgramsResponse Hash] response from the API call
    def list_loyalty_programs
      warn 'Endpoint list_loyalty_programs in LoyaltyApi is deprecated'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves the loyalty program in a seller's account, specified by the
    # program ID or the keyword `main`.
    # Loyalty programs define how buyers can earn points and redeem points for
    # rewards. Square sellers can have only one loyalty program, which is
    # created and managed from the Seller Dashboard. For more information, see
    # [Loyalty Program
    # Overview](https://developer.squareup.com/docs/loyalty/overview).
    # @param [String] program_id Required parameter: The ID of the loyalty
    # program or the keyword `main`. Either value can be used to retrieve the
    # single loyalty program that belongs to the seller.
    # @return [RetrieveLoyaltyProgramResponse Hash] response from the API call
    def retrieve_loyalty_program(program_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'program_id' => { 'value' => program_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Calculates the number of points a buyer can earn from a purchase.
    # Applications might call this endpoint
    # to display the points to the buyer.
    # - If you are using the Orders API to manage orders, provide the `order_id`
    # and (optional) `loyalty_account_id`.
    # Square reads the order to compute the points earned from the base loyalty
    # program and an associated
    # [loyalty promotion]($m/LoyaltyPromotion).
    # - If you are not using the Orders API to manage orders, provide
    # `transaction_amount_money` with the
    # purchase amount. Square uses this amount to calculate the points earned
    # from the base loyalty program,
    # but not points earned from a loyalty promotion. For spend-based and
    # visit-based programs, the `tax_mode`
    # setting of the accrual rule indicates how taxes should be treated for
    # loyalty points accrual.
    # If the purchase qualifies for program points, call
    # [ListLoyaltyPromotions]($e/Loyalty/ListLoyaltyPromotions) and perform a
    # client-side computation
    # to calculate whether the purchase also qualifies for promotion points. For
    # more information, see
    # [Calculating promotion
    # points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions
    # #calculate-promotion-points).
    # @param [String] program_id Required parameter: The ID of the [loyalty
    # program]($m/LoyaltyProgram), which defines the rules for accruing
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
        'program_id' => { 'value' => program_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Lists the loyalty promotions associated with a [loyalty
    # program]($m/LoyaltyProgram).
    # Results are sorted by the `created_at` date in descending order (newest to
    # oldest).
    # @param [String] program_id Required parameter: The ID of the base [loyalty
    # program]($m/LoyaltyProgram). To get the program ID, call
    # [RetrieveLoyaltyProgram]($e/Loyalty/RetrieveLoyaltyProgram) using the
    # `main` keyword.
    # @param [LoyaltyPromotionStatus] status Optional parameter: The status to
    # filter the results by. If a status is provided, only loyalty promotions
    # with the specified status are returned. Otherwise, all loyalty promotions
    # associated with the loyalty program are returned.
    # @param [String] cursor Optional parameter: The cursor returned in the
    # paged response from the previous call to this endpoint. Provide this
    # cursor to retrieve the next page of results for your original request. For
    # more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single paged response. The minimum value is 1 and the
    # maximum value is 30. The default value is 30. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ListLoyaltyPromotionsResponse Hash] response from the API call
    def list_loyalty_promotions(program_id:,
                                status: nil,
                                cursor: nil,
                                limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}/promotions'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'program_id' => { 'value' => program_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'status' => status,
        'cursor' => cursor,
        'limit' => limit
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates a loyalty promotion for a [loyalty program]($m/LoyaltyProgram). A
    # loyalty promotion
    # enables buyers to earn points in addition to those earned from the base
    # loyalty program.
    # This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED`
    # status, depending on the
    # `available_time` setting. A loyalty program can have a maximum of 10
    # loyalty promotions with an
    # `ACTIVE` or `SCHEDULED` status.
    # @param [String] program_id Required parameter: The ID of the [loyalty
    # program]($m/LoyaltyProgram) to associate with the promotion. To get the
    # program ID, call
    # [RetrieveLoyaltyProgram]($e/Loyalty/RetrieveLoyaltyProgram) using the
    # `main` keyword.
    # @param [CreateLoyaltyPromotionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateLoyaltyPromotionResponse Hash] response from the API call
    def create_loyalty_promotion(program_id:,
                                 body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}/promotions'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'program_id' => { 'value' => program_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a loyalty promotion.
    # @param [String] promotion_id Required parameter: The ID of the [loyalty
    # promotion]($m/LoyaltyPromotion) to retrieve.
    # @param [String] program_id Required parameter: The ID of the base [loyalty
    # program]($m/LoyaltyProgram). To get the program ID, call
    # [RetrieveLoyaltyProgram]($e/Loyalty/RetrieveLoyaltyProgram) using the
    # `main` keyword.
    # @return [RetrieveLoyaltyPromotionResponse Hash] response from the API call
    def retrieve_loyalty_promotion(promotion_id:,
                                   program_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}/promotions/{promotion_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'promotion_id' => { 'value' => promotion_id, 'encode' => true },
        'program_id' => { 'value' => program_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE`
    # promotion earlier than the
    # end date, cancel an `ACTIVE` promotion when an end date is not specified,
    # or cancel a `SCHEDULED` promotion.
    # Because updating a promotion is not supported, you can also use this
    # endpoint to cancel a promotion before
    # you create a new one.
    # This endpoint sets the loyalty promotion to the `CANCELED` state
    # @param [String] promotion_id Required parameter: The ID of the [loyalty
    # promotion]($m/LoyaltyPromotion) to cancel. You can cancel a promotion that
    # has an `ACTIVE` or `SCHEDULED` status.
    # @param [String] program_id Required parameter: The ID of the base [loyalty
    # program]($m/LoyaltyProgram).
    # @return [CancelLoyaltyPromotionResponse Hash] response from the API call
    def cancel_loyalty_promotion(promotion_id:,
                                 program_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}/promotions/{promotion_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'promotion_id' => { 'value' => promotion_id, 'encode' => true },
        'program_id' => { 'value' => program_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates a loyalty reward. In the process, the endpoint does following:
    # - Uses the `reward_tier_id` in the request to determine the number of
    # points
    # to lock for this reward.
    # - If the request includes `order_id`, it adds the reward and related
    # discount to the order.
    # After a reward is created, the points are locked and
    # not available for the buyer to redeem another reward.
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
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for loyalty rewards. This endpoint accepts a request with no
    # query filters and returns results for all loyalty accounts.
    # If you include a `query` object, `loyalty_account_id` is required and
    # `status` is  optional.
    # If you know a reward ID, use the
    # [RetrieveLoyaltyReward]($e/Loyalty/RetrieveLoyaltyReward) endpoint.
    # Search results are sorted by `updated_at` in descending order.
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
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Deletes a loyalty reward by doing the following:
    # - Returns the loyalty points back to the loyalty account.
    # - If an order ID was specified when the reward was created
    # (see [CreateLoyaltyReward]($e/Loyalty/CreateLoyaltyReward)),
    # it updates the order by removing the reward and related
    # discounts.
    # You cannot delete a reward that has reached the terminal state (REDEEMED).
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward]($m/LoyaltyReward) to delete.
    # @return [DeleteLoyaltyRewardResponse Hash] response from the API call
    def delete_loyalty_reward(reward_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => { 'value' => reward_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a loyalty reward.
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward]($m/LoyaltyReward) to retrieve.
    # @return [RetrieveLoyaltyRewardResponse Hash] response from the API call
    def retrieve_loyalty_reward(reward_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => { 'value' => reward_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Redeems a loyalty reward.
    # The endpoint sets the reward to the `REDEEMED` terminal state.
    # If you are using your own order processing system (not using the
    # Orders API), you call this endpoint after the buyer paid for the
    # purchase.
    # After the reward reaches the terminal state, it cannot be deleted.
    # In other words, points used for the reward cannot be returned
    # to the account.
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward]($m/LoyaltyReward) to redeem.
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
        'reward_id' => { 'value' => reward_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
