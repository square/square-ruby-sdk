# frozen_string_literal: true
require_relative "../../../requests"
require_relative "promotions/client"
require_relative "../../types/list_loyalty_programs_response"
require_relative "../../types/get_loyalty_program_response"
require_relative "../../types/money"
require_relative "../../types/calculate_loyalty_points_response"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Loyalty
    class ProgramsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client
    # @return [square.rb::Loyalty::Programs::PromotionsClient] 
      attr_reader :promotions


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Loyalty::ProgramsClient]
      def initialize(request_client:)
        @request_client = request_client
        @promotions = square.rb::Loyalty::Programs::PromotionsClient.new(request_client: request_client)
      end
# Returns a list of loyalty programs in the seller's account.
#  Loyalty programs define how buyers can earn points and redeem points for
#  rewards. Square sellers can have only one loyalty program, which is created and
#  managed from the Seller Dashboard. For more information, see [Loyalty Program
#  Overview](https://developer.squareup.com/docs/loyalty/overview).
#  Replaced with
#  [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when used
#  with the keyword `main`.
      #
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListLoyaltyProgramsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.list
      def list(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs"
end
        square.rb::ListLoyaltyProgramsResponse.from_json(json_object: response.body)
      end
# Retrieves the loyalty program in a seller's account, specified by the program ID
#  or the keyword `main`.
#  Loyalty programs define how buyers can earn points and redeem points for
#  rewards. Square sellers can have only one loyalty program, which is created and
#  managed from the Seller Dashboard. For more information, see [Loyalty Program
#  Overview](https://developer.squareup.com/docs/loyalty/overview).
      #
      # @param program_id [String] The ID of the loyalty program or the keyword `main`. Either value can be used to
#  retrieve the single loyalty program that belongs to the seller.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetLoyaltyProgramResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.get(program_id: "program_id")
      def get(program_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}"
end
        square.rb::GetLoyaltyProgramResponse.from_json(json_object: response.body)
      end
# Calculates the number of points a buyer can earn from a purchase. Applications
#  might call this endpoint
#  to display the points to the buyer.
#  - If you are using the Orders API to manage orders, provide the `order_id` and
#  (optional) `loyalty_account_id`.
#  Square reads the order to compute the points earned from the base loyalty
#  program and an associated
#  [loyalty promotion](entity:LoyaltyPromotion).
#  - If you are not using the Orders API to manage orders, provide
#  `transaction_amount_money` with the
#  purchase amount. Square uses this amount to calculate the points earned from the
#  base loyalty program,
#  but not points earned from a loyalty promotion. For spend-based and visit-based
#  programs, the `tax_mode`
#  setting of the accrual rule indicates how taxes should be treated for loyalty
#  points accrual.
#  If the purchase qualifies for program points, call
#  [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) and perform
#  a client-side computation
#  to calculate whether the purchase also qualifies for promotion points. For more
#  information, see
#  [Calculating promotion
#  er.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
      #
      # @param program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram), which defines the rules
#  for accruing points.
      # @param order_id [String] The [order](entity:Order) ID for which to calculate the points.
#  Specify this field if your application uses the Orders API to process orders.
#  Otherwise, specify the `transaction_amount_money`.
      # @param transaction_amount_money [Hash] The purchase amount for which to calculate the points.
#  Specify this field if your application does not use the Orders API to process
#  orders.
#  Otherwise, specify the `order_id`.Request of type square.rb::Money, as a Hash
      #   * :amount (Long) 
      #   * :currency (square.rb::Currency) 
      # @param loyalty_account_id [String] The ID of the target [loyalty account](entity:LoyaltyAccount). Optionally
#  specify this field
#  if your application uses the Orders API to process orders.
#  If specified, the `promotion_points` field in the response shows the number of
#  points the buyer would
#  earn from the purchase. In this case, Square uses the account ID to determine
#  whether the promotion's
#  `trigger_limit` (the maximum number of times that a buyer can trigger the
#  promotion) has been reached.
#  If not specified, the `promotion_points` field shows the number of points the
#  purchase qualifies
#  for regardless of the trigger limit.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CalculateLoyaltyPointsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.calculate(
#    program_id: "program_id",
#    order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY",
#    loyalty_account_id: "79b807d2-d786-46a9-933b-918028d7a8c5"
#  )
      def calculate(program_id:, order_id: nil, transaction_amount_money: nil, loyalty_account_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order_id: order_id, transaction_amount_money: transaction_amount_money, loyalty_account_id: loyalty_account_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}/calculate"
end
        square.rb::CalculateLoyaltyPointsResponse.from_json(json_object: response.body)
      end
    end
    class AsyncProgramsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client
    # @return [square.rb::Loyalty::Programs::PromotionsClient] 
      attr_reader :promotions


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Loyalty::AsyncProgramsClient]
      def initialize(request_client:)
        @request_client = request_client
        @promotions = square.rb::Loyalty::Programs::AsyncPromotionsClient.new(request_client: request_client)
      end
# Returns a list of loyalty programs in the seller's account.
#  Loyalty programs define how buyers can earn points and redeem points for
#  rewards. Square sellers can have only one loyalty program, which is created and
#  managed from the Seller Dashboard. For more information, see [Loyalty Program
#  Overview](https://developer.squareup.com/docs/loyalty/overview).
#  Replaced with
#  [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when used
#  with the keyword `main`.
      #
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListLoyaltyProgramsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.list
      def list(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs"
end
          square.rb::ListLoyaltyProgramsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves the loyalty program in a seller's account, specified by the program ID
#  or the keyword `main`.
#  Loyalty programs define how buyers can earn points and redeem points for
#  rewards. Square sellers can have only one loyalty program, which is created and
#  managed from the Seller Dashboard. For more information, see [Loyalty Program
#  Overview](https://developer.squareup.com/docs/loyalty/overview).
      #
      # @param program_id [String] The ID of the loyalty program or the keyword `main`. Either value can be used to
#  retrieve the single loyalty program that belongs to the seller.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetLoyaltyProgramResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.get(program_id: "program_id")
      def get(program_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}"
end
          square.rb::GetLoyaltyProgramResponse.from_json(json_object: response.body)
        end
      end
# Calculates the number of points a buyer can earn from a purchase. Applications
#  might call this endpoint
#  to display the points to the buyer.
#  - If you are using the Orders API to manage orders, provide the `order_id` and
#  (optional) `loyalty_account_id`.
#  Square reads the order to compute the points earned from the base loyalty
#  program and an associated
#  [loyalty promotion](entity:LoyaltyPromotion).
#  - If you are not using the Orders API to manage orders, provide
#  `transaction_amount_money` with the
#  purchase amount. Square uses this amount to calculate the points earned from the
#  base loyalty program,
#  but not points earned from a loyalty promotion. For spend-based and visit-based
#  programs, the `tax_mode`
#  setting of the accrual rule indicates how taxes should be treated for loyalty
#  points accrual.
#  If the purchase qualifies for program points, call
#  [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) and perform
#  a client-side computation
#  to calculate whether the purchase also qualifies for promotion points. For more
#  information, see
#  [Calculating promotion
#  er.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
      #
      # @param program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram), which defines the rules
#  for accruing points.
      # @param order_id [String] The [order](entity:Order) ID for which to calculate the points.
#  Specify this field if your application uses the Orders API to process orders.
#  Otherwise, specify the `transaction_amount_money`.
      # @param transaction_amount_money [Hash] The purchase amount for which to calculate the points.
#  Specify this field if your application does not use the Orders API to process
#  orders.
#  Otherwise, specify the `order_id`.Request of type square.rb::Money, as a Hash
      #   * :amount (Long) 
      #   * :currency (square.rb::Currency) 
      # @param loyalty_account_id [String] The ID of the target [loyalty account](entity:LoyaltyAccount). Optionally
#  specify this field
#  if your application uses the Orders API to process orders.
#  If specified, the `promotion_points` field in the response shows the number of
#  points the buyer would
#  earn from the purchase. In this case, Square uses the account ID to determine
#  whether the promotion's
#  `trigger_limit` (the maximum number of times that a buyer can trigger the
#  promotion) has been reached.
#  If not specified, the `promotion_points` field shows the number of points the
#  purchase qualifies
#  for regardless of the trigger limit.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CalculateLoyaltyPointsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.programs.calculate(
#    program_id: "program_id",
#    order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY",
#    loyalty_account_id: "79b807d2-d786-46a9-933b-918028d7a8c5"
#  )
      def calculate(program_id:, order_id: nil, transaction_amount_money: nil, loyalty_account_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order_id: order_id, transaction_amount_money: transaction_amount_money, loyalty_account_id: loyalty_account_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/programs/#{program_id}/calculate"
end
          square.rb::CalculateLoyaltyPointsResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end