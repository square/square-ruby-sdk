# frozen_string_literal: true
require_relative "../../requests"
require_relative "accounts/client"
require_relative "programs/client"
require_relative "rewards/client"
require_relative "../types/loyalty_event_query"
require_relative "../types/search_loyalty_events_response"
require "async"
require_relative "../../requests"

module square.rb
  class LoyaltyClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client
  # @return [square.rb::Loyalty::AccountsClient] 
    attr_reader :accounts
  # @return [square.rb::Loyalty::ProgramsClient] 
    attr_reader :programs
  # @return [square.rb::Loyalty::RewardsClient] 
    attr_reader :rewards


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::LoyaltyClient]
    def initialize(request_client:)
      @request_client = request_client
      @accounts = square.rb::Loyalty::AccountsClient.new(request_client: request_client)
      @programs = square.rb::Loyalty::ProgramsClient.new(request_client: request_client)
      @rewards = square.rb::Loyalty::RewardsClient.new(request_client: request_client)
    end
# Searches for loyalty events.
#  A Square loyalty program maintains a ledger of events that occur during the
#  lifetime of a
#  buyer's loyalty account. Each change in the point balance
#  (for example, points earned, points redeemed, and points expired) is
#  recorded in the ledger. Using this endpoint, you can search the ledger for
#  events.
#  Search results are sorted by `created_at` in descending order.
    #
    # @param query [Hash] A set of one or more predefined query filters to apply when
#  searching for loyalty events. The endpoint performs a logical AND to
#  evaluate multiple filters and performs a logical OR on arrays
#  that specifies multiple field values.Request of type square.rb::LoyaltyEventQuery, as a Hash
    #   * :filter (Hash)
    #     * :loyalty_account_filter (Hash)
    #       * :loyalty_account_id (String) 
    #     * :type_filter (Hash)
    #       * :types (Array<square.rb::LoyaltyEventType>) 
    #     * :date_time_filter (Hash)
    #       * :created_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #     * :location_filter (Hash)
    #       * :location_ids (Array<String>) 
    #     * :order_filter (Hash)
    #       * :order_id (String) 
    # @param limit [Integer] The maximum number of results to include in the response.
#  The last page might contain fewer events.
#  The default is 30 events.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchLoyaltyEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.search_events(query: { filter: { order_filter: { order_id: "PyATxhYLfsMqpVkcKJITPydgEYfZY" } } }, limit: 30)
    def search_events(query: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/events/search"
end
      square.rb::SearchLoyaltyEventsResponse.from_json(json_object: response.body)
    end
  end
  class AsyncLoyaltyClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client
  # @return [square.rb::Loyalty::AccountsClient] 
    attr_reader :accounts
  # @return [square.rb::Loyalty::ProgramsClient] 
    attr_reader :programs
  # @return [square.rb::Loyalty::RewardsClient] 
    attr_reader :rewards


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncLoyaltyClient]
    def initialize(request_client:)
      @request_client = request_client
      @accounts = square.rb::Loyalty::AsyncAccountsClient.new(request_client: request_client)
      @programs = square.rb::Loyalty::AsyncProgramsClient.new(request_client: request_client)
      @rewards = square.rb::Loyalty::AsyncRewardsClient.new(request_client: request_client)
    end
# Searches for loyalty events.
#  A Square loyalty program maintains a ledger of events that occur during the
#  lifetime of a
#  buyer's loyalty account. Each change in the point balance
#  (for example, points earned, points redeemed, and points expired) is
#  recorded in the ledger. Using this endpoint, you can search the ledger for
#  events.
#  Search results are sorted by `created_at` in descending order.
    #
    # @param query [Hash] A set of one or more predefined query filters to apply when
#  searching for loyalty events. The endpoint performs a logical AND to
#  evaluate multiple filters and performs a logical OR on arrays
#  that specifies multiple field values.Request of type square.rb::LoyaltyEventQuery, as a Hash
    #   * :filter (Hash)
    #     * :loyalty_account_filter (Hash)
    #       * :loyalty_account_id (String) 
    #     * :type_filter (Hash)
    #       * :types (Array<square.rb::LoyaltyEventType>) 
    #     * :date_time_filter (Hash)
    #       * :created_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #     * :location_filter (Hash)
    #       * :location_ids (Array<String>) 
    #     * :order_filter (Hash)
    #       * :order_id (String) 
    # @param limit [Integer] The maximum number of results to include in the response.
#  The last page might contain fewer events.
#  The default is 30 events.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchLoyaltyEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.search_events(query: { filter: { order_filter: { order_id: "PyATxhYLfsMqpVkcKJITPydgEYfZY" } } }, limit: 30)
    def search_events(query: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/events/search"
end
        square.rb::SearchLoyaltyEventsResponse.from_json(json_object: response.body)
      end
    end
  end
end