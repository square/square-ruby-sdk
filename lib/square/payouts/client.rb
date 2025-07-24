# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/payout_status"
require_relative "../types/sort_order"
require_relative "../types/list_payouts_response"
require_relative "../types/get_payout_response"
require_relative "../types/list_payout_entries_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class PayoutsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::PayoutsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves a list of all payouts for the default location.
#  You can filter payouts by location ID, status, time range, and order them in
#  ascending or descending order.
#  To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    #
    # @param location_id [String] The ID of the location for which to list the payouts.
#  By default, payouts are returned for the default (main) location associated with
#  the seller.
    # @param status [square.rb::PayoutStatus] If provided, only payouts with the given status are returned.
    # @param begin_time [String] The timestamp for the beginning of the payout creation time, in RFC 3339 format.
#  Inclusive. Default: The current time minus one year.
    # @param end_time [String] The timestamp for the end of the payout creation time, in RFC 3339 format.
#  Default: The current time.
    # @param sort_order [square.rb::SortOrder] The order in which payouts are listed.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
#  If request parameters change between requests, subsequent results may contain
#  duplicates or missing records.
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value. If the provided
#  value is
#  greater than 100, it is ignored and the default value is used instead.
#  Default: `100`
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListPayoutsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payouts.list
    def list(location_id: nil, status: nil, begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "status": status, "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payouts"
end
      square.rb::ListPayoutsResponse.from_json(json_object: response.body)
    end
# Retrieves details of a specific payout identified by a payout ID.
#  To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    #
    # @param payout_id [String] The ID of the payout to retrieve the information for.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetPayoutResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payouts.get(payout_id: "payout_id")
    def get(payout_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payouts/#{payout_id}"
end
      square.rb::GetPayoutResponse.from_json(json_object: response.body)
    end
# Retrieves a list of all payout entries for a specific payout.
#  To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    #
    # @param payout_id [String] The ID of the payout to retrieve the information for.
    # @param sort_order [square.rb::SortOrder] The order in which payout entries are listed.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
#  If request parameters change between requests, subsequent results may contain
#  duplicates or missing records.
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value. If the provided
#  value is
#  greater than 100, it is ignored and the default value is used instead.
#  Default: `100`
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListPayoutEntriesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payouts.list_entries(payout_id: "payout_id")
    def list_entries(payout_id:, sort_order: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "sort_order": sort_order, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payouts/#{payout_id}/payout-entries"
end
      square.rb::ListPayoutEntriesResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPayoutsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncPayoutsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves a list of all payouts for the default location.
#  You can filter payouts by location ID, status, time range, and order them in
#  ascending or descending order.
#  To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    #
    # @param location_id [String] The ID of the location for which to list the payouts.
#  By default, payouts are returned for the default (main) location associated with
#  the seller.
    # @param status [square.rb::PayoutStatus] If provided, only payouts with the given status are returned.
    # @param begin_time [String] The timestamp for the beginning of the payout creation time, in RFC 3339 format.
#  Inclusive. Default: The current time minus one year.
    # @param end_time [String] The timestamp for the end of the payout creation time, in RFC 3339 format.
#  Default: The current time.
    # @param sort_order [square.rb::SortOrder] The order in which payouts are listed.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
#  If request parameters change between requests, subsequent results may contain
#  duplicates or missing records.
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value. If the provided
#  value is
#  greater than 100, it is ignored and the default value is used instead.
#  Default: `100`
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListPayoutsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payouts.list
    def list(location_id: nil, status: nil, begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "status": status, "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payouts"
end
        square.rb::ListPayoutsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves details of a specific payout identified by a payout ID.
#  To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    #
    # @param payout_id [String] The ID of the payout to retrieve the information for.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetPayoutResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payouts.get(payout_id: "payout_id")
    def get(payout_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payouts/#{payout_id}"
end
        square.rb::GetPayoutResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a list of all payout entries for a specific payout.
#  To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    #
    # @param payout_id [String] The ID of the payout to retrieve the information for.
    # @param sort_order [square.rb::SortOrder] The order in which payout entries are listed.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
#  If request parameters change between requests, subsequent results may contain
#  duplicates or missing records.
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value. If the provided
#  value is
#  greater than 100, it is ignored and the default value is used instead.
#  Default: `100`
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListPayoutEntriesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payouts.list_entries(payout_id: "payout_id")
    def list_entries(payout_id:, sort_order: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "sort_order": sort_order, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payouts/#{payout_id}/payout-entries"
end
        square.rb::ListPayoutEntriesResponse.from_json(json_object: response.body)
      end
    end
  end
end