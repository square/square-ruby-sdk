# frozen_string_literal: true
require_relative "../../../../requests"
require_relative "../../../types/loyalty_promotion_status"
require_relative "../../../types/list_loyalty_promotions_response"
require_relative "../../../types/loyalty_promotion"
require_relative "../../../types/create_loyalty_promotion_response"
require_relative "../../../types/get_loyalty_promotion_response"
require_relative "../../../types/cancel_loyalty_promotion_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../../requests"

module SquareApiClient
  module Loyalty
    module Programs
      class PromotionsClient
      # @return [SquareApiClient::RequestClient] 
        attr_reader :request_client


        # @param request_client [SquareApiClient::RequestClient] 
        # @return [SquareApiClient::Loyalty::Programs::PromotionsClient]
        def initialize(request_client:)
          @request_client = request_client
        end
# Lists the loyalty promotions associated with a [loyalty
#  program](entity:LoyaltyProgram).
#  Results are sorted by the `created_at` date in descending order (newest to
#  oldest).
        #
        # @param program_id [String] The ID of the base [loyalty program](entity:LoyaltyProgram). To get the program
#  ID,
#  call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using
#  the `main` keyword.
        # @param status [SquareApiClient::LoyaltyPromotionStatus] The status to filter the results by. If a status is provided, only loyalty
#  promotions
#  with the specified status are returned. Otherwise, all loyalty promotions
#  associated with
#  the loyalty program are returned.
        # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
        # @param limit [Integer] The maximum number of results to return in a single paged response.
#  The minimum value is 1 and the maximum value is 30. The default value is 30.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::ListLoyaltyPromotionsResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.list(program_id: "program_id")
        def list(program_id:, status: nil, cursor: nil, limit: nil, request_options: nil)
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "status": status, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}/promotions"
end
          SquareApiClient::ListLoyaltyPromotionsResponse.from_json(json_object: response.body)
        end
# Creates a loyalty promotion for a [loyalty program](entity:LoyaltyProgram). A
#  loyalty promotion
#  enables buyers to earn points in addition to those earned from the base loyalty
#  program.
#  This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status,
#  depending on the
#  `available_time` setting. A loyalty program can have a maximum of 10 loyalty
#  promotions with an
#  `ACTIVE` or `SCHEDULED` status.
        #
        # @param program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram) to associate with the
#  promotion.
#  To get the program ID, call
#  [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram)
#  using the `main` keyword.
        # @param loyalty_promotion [Hash] The loyalty promotion to create.Request of type SquareApiClient::LoyaltyPromotion, as a Hash
        #   * :id (String) 
        #   * :name (String) 
        #   * :incentive (Hash)
        #     * :type (SquareApiClient::LoyaltyPromotionIncentiveType) 
        #     * :points_multiplier_data (Hash)
        #       * :points_multiplier (Integer) 
        #       * :multiplier (String) 
        #     * :points_addition_data (Hash)
        #       * :points_addition (Integer) 
        #   * :available_time (Hash)
        #     * :start_date (String) 
        #     * :end_date (String) 
        #     * :time_periods (Array<String>) 
        #   * :trigger_limit (Hash)
        #     * :times (Integer) 
        #     * :interval (SquareApiClient::LoyaltyPromotionTriggerLimitInterval) 
        #   * :status (SquareApiClient::LoyaltyPromotionStatus) 
        #   * :created_at (String) 
        #   * :canceled_at (String) 
        #   * :updated_at (String) 
        #   * :loyalty_program_id (String) 
        #   * :minimum_spend_amount_money (Hash)
        #     * :amount (Long) 
        #     * :currency (SquareApiClient::Currency) 
        #   * :qualifying_item_variation_ids (Array<String>) 
        #   * :qualifying_category_ids (Array<String>) 
        # @param idempotency_key [String] A unique identifier for this request, which is used to ensure idempotency. For
#  more information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::CreateLoyaltyPromotionResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.create(
#    program_id: "program_id",
#    loyalty_promotion: { name: "Tuesday Happy Hour Promo", incentive: { type: POINTS_MULTIPLIER, points_multiplier_data: { multiplier: "3.0" } }, available_time: { time_periods: ["BEGIN:VEVENT
#  DTSTART:20220816T160000
#  DURATION:PT2H
#  RRULE:FREQ=WEEKLY;BYDAY=TU
#  END:VEVENT"] }, trigger_limit: { times: 1, interval: DAY }, minimum_spend_amount_money: { amount: 2000, currency: USD }, qualifying_category_ids: ["XTQPYLR3IIU9C44VRCB3XD12"] },
#    idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996"
#  )
        def create(program_id:, loyalty_promotion:, idempotency_key:, request_options: nil)
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), loyalty_promotion: loyalty_promotion, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}/promotions"
end
          SquareApiClient::CreateLoyaltyPromotionResponse.from_json(json_object: response.body)
        end
# Retrieves a loyalty promotion.
        #
        # @param promotion_id [String] The ID of the [loyalty promotion](entity:LoyaltyPromotion) to retrieve.
        # @param program_id [String] The ID of the base [loyalty program](entity:LoyaltyProgram). To get the program
#  ID,
#  call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using
#  the `main` keyword.
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::GetLoyaltyPromotionResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.get(promotion_id: "promotion_id", program_id: "program_id")
        def get(promotion_id:, program_id:, request_options: nil)
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{promotion_id}/promotions/#{program_id}"
end
          SquareApiClient::GetLoyaltyPromotionResponse.from_json(json_object: response.body)
        end
# Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion
#  earlier than the
#  end date, cancel an `ACTIVE` promotion when an end date is not specified, or
#  cancel a `SCHEDULED` promotion.
#  Because updating a promotion is not supported, you can also use this endpoint to
#  cancel a promotion before
#  you create a new one.
#  This endpoint sets the loyalty promotion to the `CANCELED` state
        #
        # @param promotion_id [String] The ID of the [loyalty promotion](entity:LoyaltyPromotion) to cancel. You can
#  cancel a
#  promotion that has an `ACTIVE` or `SCHEDULED` status.
        # @param program_id [String] The ID of the base [loyalty program](entity:LoyaltyProgram).
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::CancelLoyaltyPromotionResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.cancel(promotion_id: "promotion_id", program_id: "program_id")
        def cancel(promotion_id:, program_id:, request_options: nil)
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{promotion_id}/promotions/#{program_id}/cancel"
end
          SquareApiClient::CancelLoyaltyPromotionResponse.from_json(json_object: response.body)
        end
      end
      class AsyncPromotionsClient
      # @return [SquareApiClient::AsyncRequestClient] 
        attr_reader :request_client


        # @param request_client [SquareApiClient::RequestClient] 
        # @return [SquareApiClient::Loyalty::Programs::AsyncPromotionsClient]
        def initialize(request_client:)
          @request_client = request_client
        end
# Lists the loyalty promotions associated with a [loyalty
#  program](entity:LoyaltyProgram).
#  Results are sorted by the `created_at` date in descending order (newest to
#  oldest).
        #
        # @param program_id [String] The ID of the base [loyalty program](entity:LoyaltyProgram). To get the program
#  ID,
#  call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using
#  the `main` keyword.
        # @param status [SquareApiClient::LoyaltyPromotionStatus] The status to filter the results by. If a status is provided, only loyalty
#  promotions
#  with the specified status are returned. Otherwise, all loyalty promotions
#  associated with
#  the loyalty program are returned.
        # @param cursor [String] The cursor returned in the paged response from the previous call to this
#  endpoint.
#  Provide this cursor to retrieve the next page of results for your original
#  request.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
        # @param limit [Integer] The maximum number of results to return in a single paged response.
#  The minimum value is 1 and the maximum value is 30. The default value is 30.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::ListLoyaltyPromotionsResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.list(program_id: "program_id")
        def list(program_id:, status: nil, cursor: nil, limit: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "status": status, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}/promotions"
end
            SquareApiClient::ListLoyaltyPromotionsResponse.from_json(json_object: response.body)
          end
        end
# Creates a loyalty promotion for a [loyalty program](entity:LoyaltyProgram). A
#  loyalty promotion
#  enables buyers to earn points in addition to those earned from the base loyalty
#  program.
#  This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status,
#  depending on the
#  `available_time` setting. A loyalty program can have a maximum of 10 loyalty
#  promotions with an
#  `ACTIVE` or `SCHEDULED` status.
        #
        # @param program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram) to associate with the
#  promotion.
#  To get the program ID, call
#  [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram)
#  using the `main` keyword.
        # @param loyalty_promotion [Hash] The loyalty promotion to create.Request of type SquareApiClient::LoyaltyPromotion, as a Hash
        #   * :id (String) 
        #   * :name (String) 
        #   * :incentive (Hash)
        #     * :type (SquareApiClient::LoyaltyPromotionIncentiveType) 
        #     * :points_multiplier_data (Hash)
        #       * :points_multiplier (Integer) 
        #       * :multiplier (String) 
        #     * :points_addition_data (Hash)
        #       * :points_addition (Integer) 
        #   * :available_time (Hash)
        #     * :start_date (String) 
        #     * :end_date (String) 
        #     * :time_periods (Array<String>) 
        #   * :trigger_limit (Hash)
        #     * :times (Integer) 
        #     * :interval (SquareApiClient::LoyaltyPromotionTriggerLimitInterval) 
        #   * :status (SquareApiClient::LoyaltyPromotionStatus) 
        #   * :created_at (String) 
        #   * :canceled_at (String) 
        #   * :updated_at (String) 
        #   * :loyalty_program_id (String) 
        #   * :minimum_spend_amount_money (Hash)
        #     * :amount (Long) 
        #     * :currency (SquareApiClient::Currency) 
        #   * :qualifying_item_variation_ids (Array<String>) 
        #   * :qualifying_category_ids (Array<String>) 
        # @param idempotency_key [String] A unique identifier for this request, which is used to ensure idempotency. For
#  more information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::CreateLoyaltyPromotionResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.create(
#    program_id: "program_id",
#    loyalty_promotion: { name: "Tuesday Happy Hour Promo", incentive: { type: POINTS_MULTIPLIER, points_multiplier_data: { multiplier: "3.0" } }, available_time: { time_periods: ["BEGIN:VEVENT
#  DTSTART:20220816T160000
#  DURATION:PT2H
#  RRULE:FREQ=WEEKLY;BYDAY=TU
#  END:VEVENT"] }, trigger_limit: { times: 1, interval: DAY }, minimum_spend_amount_money: { amount: 2000, currency: USD }, qualifying_category_ids: ["XTQPYLR3IIU9C44VRCB3XD12"] },
#    idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996"
#  )
        def create(program_id:, loyalty_promotion:, idempotency_key:, request_options: nil)
          Async do
            response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), loyalty_promotion: loyalty_promotion, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}/promotions"
end
            SquareApiClient::CreateLoyaltyPromotionResponse.from_json(json_object: response.body)
          end
        end
# Retrieves a loyalty promotion.
        #
        # @param promotion_id [String] The ID of the [loyalty promotion](entity:LoyaltyPromotion) to retrieve.
        # @param program_id [String] The ID of the base [loyalty program](entity:LoyaltyProgram). To get the program
#  ID,
#  call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using
#  the `main` keyword.
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::GetLoyaltyPromotionResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.get(promotion_id: "promotion_id", program_id: "program_id")
        def get(promotion_id:, program_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{promotion_id}/promotions/#{program_id}"
end
            SquareApiClient::GetLoyaltyPromotionResponse.from_json(json_object: response.body)
          end
        end
# Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion
#  earlier than the
#  end date, cancel an `ACTIVE` promotion when an end date is not specified, or
#  cancel a `SCHEDULED` promotion.
#  Because updating a promotion is not supported, you can also use this endpoint to
#  cancel a promotion before
#  you create a new one.
#  This endpoint sets the loyalty promotion to the `CANCELED` state
        #
        # @param promotion_id [String] The ID of the [loyalty promotion](entity:LoyaltyPromotion) to cancel. You can
#  cancel a
#  promotion that has an `ACTIVE` or `SCHEDULED` status.
        # @param program_id [String] The ID of the base [loyalty program](entity:LoyaltyProgram).
        # @param request_options [SquareApiClient::RequestOptions] 
        # @return [SquareApiClient::CancelLoyaltyPromotionResponse]
        # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.promotions.cancel(promotion_id: "promotion_id", program_id: "program_id")
        def cancel(promotion_id:, program_id:, request_options: nil)
          Async do
            response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{promotion_id}/promotions/#{program_id}/cancel"
end
            SquareApiClient::CancelLoyaltyPromotionResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end