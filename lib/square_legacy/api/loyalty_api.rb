module SquareLegacy
  # LoyaltyApi
  class LoyaltyApi < BaseApi
    # Creates a loyalty account. To create a loyalty account, you must provide
    # the `program_id` and a `mapping` with the `phone_number` of the buyer.
    # @param [CreateLoyaltyAccountRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_loyalty_account(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/accounts',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Searches for loyalty accounts in a loyalty program.
    # You can search for a loyalty account using the phone number or customer ID
    # associated with the account. To return all loyalty accounts, specify an
    # empty `query` object or omit it entirely.
    # Search results are sorted by `created_at` in ascending order.
    # @param [SearchLoyaltyAccountsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_loyalty_accounts(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/accounts/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a loyalty account.
    # @param [String] account_id Required parameter: The ID of the [loyalty
    # account](entity:LoyaltyAccount) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_loyalty_account(account_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/loyalty/accounts/{account_id}',
                                     'default')
                   .template_param(new_parameter(account_id, key: 'account_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # [loyalty account](entity:LoyaltyAccount).
    # @param [AccumulateLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def accumulate_loyalty_points(account_id:,
                                  body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/accounts/{account_id}/accumulate',
                                     'default')
                   .template_param(new_parameter(account_id, key: 'account_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Adds points to or subtracts points from a buyer's account.
    # Use this endpoint only when you need to manually adjust points. Otherwise,
    # in your application flow, you call
    # [AccumulateLoyaltyPoints]($e/Loyalty/AccumulateLoyaltyPoints)
    # to add points when a buyer pays for the purchase.
    # @param [String] account_id Required parameter: The ID of the target
    # [loyalty account](entity:LoyaltyAccount).
    # @param [AdjustLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def adjust_loyalty_points(account_id:,
                              body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/accounts/{account_id}/adjust',
                                     'default')
                   .template_param(new_parameter(account_id, key: 'account_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_loyalty_events(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/events/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a list of loyalty programs in the seller's account.
    # Loyalty programs define how buyers can earn points and redeem points for
    # rewards. Square sellers can have only one loyalty program, which is
    # created and managed from the Seller Dashboard. For more information, see
    # [Loyalty Program
    # Overview](https://developer.squareup.com/docs/loyalty/overview).
    # Replaced with
    # [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when
    # used with the keyword `main`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_loyalty_programs
      warn 'Endpoint list_loyalty_programs in LoyaltyApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/loyalty/programs',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_loyalty_program(program_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/loyalty/programs/{program_id}',
                                     'default')
                   .template_param(new_parameter(program_id, key: 'program_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # program](entity:LoyaltyProgram), which defines the rules for accruing
    # points.
    # @param [CalculateLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def calculate_loyalty_points(program_id:,
                                 body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/programs/{program_id}/calculate',
                                     'default')
                   .template_param(new_parameter(program_id, key: 'program_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Lists the loyalty promotions associated with a [loyalty
    # program]($m/LoyaltyProgram).
    # Results are sorted by the `created_at` date in descending order (newest to
    # oldest).
    # @param [String] program_id Required parameter: The ID of the base [loyalty
    # program](entity:LoyaltyProgram). To get the program ID, call
    # [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram)
    # using the `main` keyword.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_loyalty_promotions(program_id:,
                                status: nil,
                                cursor: nil,
                                limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/loyalty/programs/{program_id}/promotions',
                                     'default')
                   .template_param(new_parameter(program_id, key: 'program_id')
                                    .should_encode(true))
                   .query_param(new_parameter(status, key: 'status'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # program](entity:LoyaltyProgram) to associate with the promotion. To get
    # the program ID, call
    # [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram)
    # using the `main` keyword.
    # @param [CreateLoyaltyPromotionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_loyalty_promotion(program_id:,
                                 body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/programs/{program_id}/promotions',
                                     'default')
                   .template_param(new_parameter(program_id, key: 'program_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a loyalty promotion.
    # @param [String] promotion_id Required parameter: The ID of the [loyalty
    # promotion](entity:LoyaltyPromotion) to retrieve.
    # @param [String] program_id Required parameter: The ID of the base [loyalty
    # program](entity:LoyaltyProgram). To get the program ID, call
    # [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram)
    # using the `main` keyword.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_loyalty_promotion(promotion_id:,
                                   program_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/loyalty/programs/{program_id}/promotions/{promotion_id}',
                                     'default')
                   .template_param(new_parameter(promotion_id, key: 'promotion_id')
                                    .should_encode(true))
                   .template_param(new_parameter(program_id, key: 'program_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # promotion](entity:LoyaltyPromotion) to cancel. You can cancel a promotion
    # that has an `ACTIVE` or `SCHEDULED` status.
    # @param [String] program_id Required parameter: The ID of the base [loyalty
    # program](entity:LoyaltyProgram).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_loyalty_promotion(promotion_id:,
                                 program_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/programs/{program_id}/promotions/{promotion_id}/cancel',
                                     'default')
                   .template_param(new_parameter(promotion_id, key: 'promotion_id')
                                    .should_encode(true))
                   .template_param(new_parameter(program_id, key: 'program_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_loyalty_reward(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/rewards',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_loyalty_rewards(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/rewards/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deletes a loyalty reward by doing the following:
    # - Returns the loyalty points back to the loyalty account.
    # - If an order ID was specified when the reward was created
    # (see [CreateLoyaltyReward]($e/Loyalty/CreateLoyaltyReward)),
    # it updates the order by removing the reward and related
    # discounts.
    # You cannot delete a reward that has reached the terminal state (REDEEMED).
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward](entity:LoyaltyReward) to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_loyalty_reward(reward_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/loyalty/rewards/{reward_id}',
                                     'default')
                   .template_param(new_parameter(reward_id, key: 'reward_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a loyalty reward.
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward](entity:LoyaltyReward) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_loyalty_reward(reward_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/loyalty/rewards/{reward_id}',
                                     'default')
                   .template_param(new_parameter(reward_id, key: 'reward_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # reward](entity:LoyaltyReward) to redeem.
    # @param [RedeemLoyaltyRewardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def redeem_loyalty_reward(reward_id:,
                              body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/loyalty/rewards/{reward_id}/redeem',
                                     'default')
                   .template_param(new_parameter(reward_id, key: 'reward_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
