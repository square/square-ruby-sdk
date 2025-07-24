# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_gift_card_activities_response"
require_relative "../../types/gift_card_activity"
require_relative "../../types/create_gift_card_activity_response"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module GiftCards
    class ActivitiesClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::GiftCards::ActivitiesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists gift card activities. By default, you get gift card activities for all
#  gift cards in the seller's account. You can optionally specify query parameters
#  to
#  filter the list. For example, you can get a list of gift card activities for a
#  gift card,
#  for all gift cards in a specific region, or for activities within a time window.
      #
      # @param gift_card_id [String] If a gift card ID is provided, the endpoint returns activities related
#  to the specified gift card. Otherwise, the endpoint returns all gift card
#  activities for
#  the seller.
      # @param type [String] If a [type](entity:GiftCardActivityType) is provided, the endpoint returns gift
#  card activities of the specified type.
#  Otherwise, the endpoint returns all types of gift card activities.
      # @param location_id [String] If a location ID is provided, the endpoint returns gift card activities for the
#  specified location.
#  Otherwise, the endpoint returns gift card activities for all locations.
      # @param begin_time [String] The timestamp for the beginning of the reporting period, in RFC 3339 format.
#  This start time is inclusive. The default value is the current time minus one
#  year.
      # @param end_time [String] The timestamp for the end of the reporting period, in RFC 3339 format.
#  This end time is inclusive. The default value is the current time.
      # @param limit [Integer] If a limit is provided, the endpoint returns the specified number
#  of results (or fewer) per page. The maximum value is 100. The default value is
#  50.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  If a cursor is not provided, the endpoint returns the first page of the results.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param sort_order [String] The order in which the endpoint returns the activities, based on `created_at`.
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListGiftCardActivitiesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.activities.list
      def list(gift_card_id: nil, type: nil, location_id: nil, begin_time: nil, end_time: nil, limit: nil, cursor: nil, sort_order: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "gift_card_id": gift_card_id, "type": type, "location_id": location_id, "begin_time": begin_time, "end_time": end_time, "limit": limit, "cursor": cursor, "sort_order": sort_order }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/activities"
end
        SquareApiClient::ListGiftCardActivitiesResponse.from_json(json_object: response.body)
      end
# Creates a gift card activity to manage the balance or state of a [gift
#  card](entity:GiftCard).
#  For example, create an `ACTIVATE` activity to activate a gift card with an
#  initial balance before first use.
      #
      # @param idempotency_key [String] A unique string that identifies the `CreateGiftCardActivity` request.
      # @param gift_card_activity [Hash] The activity to create for the gift card. This activity must specify
#  `gift_card_id` or `gift_card_gan` for the target
#  gift card, the `location_id` where the activity occurred, and the activity
#  `type` along with the corresponding activity details.Request of type SquareApiClient::GiftCardActivity, as a Hash
      #   * :id (String) 
      #   * :type (SquareApiClient::GiftCardActivityType) 
      #   * :location_id (String) 
      #   * :created_at (String) 
      #   * :gift_card_id (String) 
      #   * :gift_card_gan (String) 
      #   * :gift_card_balance_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :load_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :order_id (String) 
      #     * :line_item_uid (String) 
      #     * :reference_id (String) 
      #     * :buyer_payment_instrument_ids (Array<String>) 
      #   * :activate_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :order_id (String) 
      #     * :line_item_uid (String) 
      #     * :reference_id (String) 
      #     * :buyer_payment_instrument_ids (Array<String>) 
      #   * :redeem_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :payment_id (String) 
      #     * :reference_id (String) 
      #     * :status (SquareApiClient::GiftCardActivityRedeemStatus) 
      #   * :clear_balance_activity_details (Hash)
      #     * :reason (SquareApiClient::GiftCardActivityClearBalanceReason) 
      #   * :deactivate_activity_details (Hash)
      #     * :reason (SquareApiClient::GiftCardActivityDeactivateReason) 
      #   * :adjust_increment_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reason (SquareApiClient::GiftCardActivityAdjustIncrementReason) 
      #   * :adjust_decrement_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reason (SquareApiClient::GiftCardActivityAdjustDecrementReason) 
      #   * :refund_activity_details (Hash)
      #     * :redeem_activity_id (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reference_id (String) 
      #     * :payment_id (String) 
      #   * :unlinked_activity_refund_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reference_id (String) 
      #     * :payment_id (String) 
      #   * :import_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :block_activity_details (Hash)
      #     * :reason (SquareApiClient::GIFT_CARD_ACTIVITY_BLOCK_REASON) 
      #   * :unblock_activity_details (Hash)
      #     * :reason (SquareApiClient::GIFT_CARD_ACTIVITY_UNBLOCK_REASON) 
      #   * :import_reversal_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :transfer_balance_to_activity_details (Hash)
      #     * :transfer_from_gift_card_id (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :transfer_balance_from_activity_details (Hash)
      #     * :transfer_to_gift_card_id (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateGiftCardActivityResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.activities.create(idempotency_key: "U16kfr-kA70er-q4Rsym-7U7NnY", gift_card_activity: { type: ACTIVATE, location_id: "81FN9BNFZTKS4", gift_card_id: "gftc:6d55a72470d940c6ba09c0ab8ad08d20", activate_activity_details: { order_id: "jJNGHm4gLI6XkFbwtiSLqK72KkAZY", line_item_uid: "eIWl7X0nMuO9Ewbh0ChIx" } })
      def create(idempotency_key:, gift_card_activity:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, gift_card_activity: gift_card_activity }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/activities"
end
        SquareApiClient::CreateGiftCardActivityResponse.from_json(json_object: response.body)
      end
    end
    class AsyncActivitiesClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::GiftCards::AsyncActivitiesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists gift card activities. By default, you get gift card activities for all
#  gift cards in the seller's account. You can optionally specify query parameters
#  to
#  filter the list. For example, you can get a list of gift card activities for a
#  gift card,
#  for all gift cards in a specific region, or for activities within a time window.
      #
      # @param gift_card_id [String] If a gift card ID is provided, the endpoint returns activities related
#  to the specified gift card. Otherwise, the endpoint returns all gift card
#  activities for
#  the seller.
      # @param type [String] If a [type](entity:GiftCardActivityType) is provided, the endpoint returns gift
#  card activities of the specified type.
#  Otherwise, the endpoint returns all types of gift card activities.
      # @param location_id [String] If a location ID is provided, the endpoint returns gift card activities for the
#  specified location.
#  Otherwise, the endpoint returns gift card activities for all locations.
      # @param begin_time [String] The timestamp for the beginning of the reporting period, in RFC 3339 format.
#  This start time is inclusive. The default value is the current time minus one
#  year.
      # @param end_time [String] The timestamp for the end of the reporting period, in RFC 3339 format.
#  This end time is inclusive. The default value is the current time.
      # @param limit [Integer] If a limit is provided, the endpoint returns the specified number
#  of results (or fewer) per page. The maximum value is 100. The default value is
#  50.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  If a cursor is not provided, the endpoint returns the first page of the results.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
      # @param sort_order [String] The order in which the endpoint returns the activities, based on `created_at`.
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListGiftCardActivitiesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.activities.list
      def list(gift_card_id: nil, type: nil, location_id: nil, begin_time: nil, end_time: nil, limit: nil, cursor: nil, sort_order: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "gift_card_id": gift_card_id, "type": type, "location_id": location_id, "begin_time": begin_time, "end_time": end_time, "limit": limit, "cursor": cursor, "sort_order": sort_order }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/activities"
end
          SquareApiClient::ListGiftCardActivitiesResponse.from_json(json_object: response.body)
        end
      end
# Creates a gift card activity to manage the balance or state of a [gift
#  card](entity:GiftCard).
#  For example, create an `ACTIVATE` activity to activate a gift card with an
#  initial balance before first use.
      #
      # @param idempotency_key [String] A unique string that identifies the `CreateGiftCardActivity` request.
      # @param gift_card_activity [Hash] The activity to create for the gift card. This activity must specify
#  `gift_card_id` or `gift_card_gan` for the target
#  gift card, the `location_id` where the activity occurred, and the activity
#  `type` along with the corresponding activity details.Request of type SquareApiClient::GiftCardActivity, as a Hash
      #   * :id (String) 
      #   * :type (SquareApiClient::GiftCardActivityType) 
      #   * :location_id (String) 
      #   * :created_at (String) 
      #   * :gift_card_id (String) 
      #   * :gift_card_gan (String) 
      #   * :gift_card_balance_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :load_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :order_id (String) 
      #     * :line_item_uid (String) 
      #     * :reference_id (String) 
      #     * :buyer_payment_instrument_ids (Array<String>) 
      #   * :activate_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :order_id (String) 
      #     * :line_item_uid (String) 
      #     * :reference_id (String) 
      #     * :buyer_payment_instrument_ids (Array<String>) 
      #   * :redeem_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :payment_id (String) 
      #     * :reference_id (String) 
      #     * :status (SquareApiClient::GiftCardActivityRedeemStatus) 
      #   * :clear_balance_activity_details (Hash)
      #     * :reason (SquareApiClient::GiftCardActivityClearBalanceReason) 
      #   * :deactivate_activity_details (Hash)
      #     * :reason (SquareApiClient::GiftCardActivityDeactivateReason) 
      #   * :adjust_increment_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reason (SquareApiClient::GiftCardActivityAdjustIncrementReason) 
      #   * :adjust_decrement_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reason (SquareApiClient::GiftCardActivityAdjustDecrementReason) 
      #   * :refund_activity_details (Hash)
      #     * :redeem_activity_id (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reference_id (String) 
      #     * :payment_id (String) 
      #   * :unlinked_activity_refund_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :reference_id (String) 
      #     * :payment_id (String) 
      #   * :import_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :block_activity_details (Hash)
      #     * :reason (SquareApiClient::GIFT_CARD_ACTIVITY_BLOCK_REASON) 
      #   * :unblock_activity_details (Hash)
      #     * :reason (SquareApiClient::GIFT_CARD_ACTIVITY_UNBLOCK_REASON) 
      #   * :import_reversal_activity_details (Hash)
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :transfer_balance_to_activity_details (Hash)
      #     * :transfer_from_gift_card_id (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :transfer_balance_from_activity_details (Hash)
      #     * :transfer_to_gift_card_id (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateGiftCardActivityResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.activities.create(idempotency_key: "U16kfr-kA70er-q4Rsym-7U7NnY", gift_card_activity: { type: ACTIVATE, location_id: "81FN9BNFZTKS4", gift_card_id: "gftc:6d55a72470d940c6ba09c0ab8ad08d20", activate_activity_details: { order_id: "jJNGHm4gLI6XkFbwtiSLqK72KkAZY", line_item_uid: "eIWl7X0nMuO9Ewbh0ChIx" } })
      def create(idempotency_key:, gift_card_activity:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, gift_card_activity: gift_card_activity }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/activities"
end
          SquareApiClient::CreateGiftCardActivityResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end