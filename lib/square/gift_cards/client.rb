# frozen_string_literal: true
require_relative "../../requests"
require_relative "activities/client"
require_relative "../types/list_gift_cards_response"
require_relative "../types/gift_card"
require_relative "../types/create_gift_card_response"
require_relative "../types/get_gift_card_from_gan_response"
require_relative "../types/get_gift_card_from_nonce_response"
require_relative "../types/link_customer_to_gift_card_response"
require_relative "../types/unlink_customer_from_gift_card_response"
require_relative "../types/get_gift_card_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class GiftCardsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client
  # @return [square.rb::GiftCards::ActivitiesClient] 
    attr_reader :activities


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::GiftCardsClient]
    def initialize(request_client:)
      @request_client = request_client
      @activities = square.rb::GiftCards::ActivitiesClient.new(request_client: request_client)
    end
# Lists all gift cards. You can specify optional filters to retrieve
#  a subset of the gift cards. Results are sorted by `created_at` in ascending
#  order.
    #
    # @param type [String] If a [type](entity:GiftCardType) is provided, the endpoint returns gift cards of
#  the specified type.
#  Otherwise, the endpoint returns gift cards of all types.
    # @param state [String] If a [state](entity:GiftCardStatus) is provided, the endpoint returns the gift
#  cards in the specified state.
#  Otherwise, the endpoint returns the gift cards of all states.
    # @param limit [Integer] If a limit is provided, the endpoint returns only the specified number of
#  results per page.
#  The maximum value is 200. The default value is 30.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  If a cursor is not provided, the endpoint returns the first page of the results.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param customer_id [String] If a customer ID is provided, the endpoint returns only the gift cards linked to
#  the specified customer.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListGiftCardsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.list
    def list(type: nil, state: nil, limit: nil, cursor: nil, customer_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "type": type, "state": state, "limit": limit, "cursor": cursor, "customer_id": customer_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards"
end
      square.rb::ListGiftCardsResponse.from_json(json_object: response.body)
    end
# Creates a digital gift card or registers a physical (plastic) gift card. The
#  resulting gift card
#  has a `PENDING` state. To activate a gift card so that it can be redeemed for
#  purchases, call
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  and create an `ACTIVATE`
#  activity with the initial balance. Alternatively, you can use
#  [RefundPayment](api-endpoint:Refunds-RefundPayment)
#  to refund a payment to the new gift card.
    #
    # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param location_id [String] The ID of the [location](entity:Location) where the gift card should be
#  registered for
#  reporting purposes. Gift cards can be redeemed at any of the seller's locations.
    # @param gift_card [Hash] The gift card to create. The `type` field is required for this request. The
#  `gan_source`
#  and `gan` fields are included as follows:
#  To direct Square to generate a 16-digit GAN, omit `gan_source` and `gan`.
#  To provide a custom GAN, include `gan_source` and `gan`.
#  - For `gan_source`, specify `OTHER`.
#  - For `gan`, provide a custom GAN containing 8 to 20 alphanumeric characters.
#  The GAN must be
#  unique for the seller and cannot start with the same bank identification number
#  (BIN) as major
#  credit cards. Do not use GANs that are easy to guess (such as 12345678) because
#  they greatly
#  increase the risk of fraud. It is the responsibility of the developer to ensure
#  the security
#  of their custom GANs. For more information, see
#  [Custom
#  ttps://developer.squareup.com/docs/gift-cards/using-gift-cards-api#custom-gans).
#  To register an unused, physical gift card that the seller previously ordered
#  from Square,
#  include `gan` and provide the GAN that is printed on the gift card.Request of type square.rb::GiftCard, as a Hash
    #   * :id (String) 
    #   * :type (square.rb::GiftCardType) 
    #   * :gan_source (square.rb::GiftCardGanSource) 
    #   * :state (square.rb::GiftCardStatus) 
    #   * :balance_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :gan (String) 
    #   * :created_at (String) 
    #   * :customer_ids (Array<String>) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.create(
#    idempotency_key: "NC9Tm69EjbjtConu",
#    location_id: "81FN9BNFZTKS4",
#    gift_card: { type: DIGITAL }
#  )
    def create(idempotency_key:, location_id:, gift_card:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, location_id: location_id, gift_card: gift_card }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards"
end
      square.rb::CreateGiftCardResponse.from_json(json_object: response.body)
    end
# Retrieves a gift card using the gift card account number (GAN).
    #
    # @param gan [String] The gift card account number (GAN) of the gift card to retrieve.
#  The maximum length of a GAN is 255 digits to account for third-party GANs that
#  have been imported.
#  Square-issued gift cards have 16-digit GANs.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetGiftCardFromGanResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.get_from_gan(gan: "7783320001001635")
    def get_from_gan(gan:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), gan: gan }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/from-gan"
end
      square.rb::GetGiftCardFromGanResponse.from_json(json_object: response.body)
    end
# Retrieves a gift card using a secure payment token that represents the gift
#  card.
    #
    # @param nonce [String] The payment token of the gift card to retrieve. Payment tokens are generated by
#  the
#  Web Payments SDK or In-App Payments SDK.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetGiftCardFromNonceResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.get_from_nonce(nonce: "cnon:7783322135245171")
    def get_from_nonce(nonce:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), nonce: nonce }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/from-nonce"
end
      square.rb::GetGiftCardFromNonceResponse.from_json(json_object: response.body)
    end
# Links a customer to a gift card, which is also referred to as adding a card on
#  file.
    #
    # @param gift_card_id [String] The ID of the gift card to be linked.
    # @param customer_id [String] The ID of the customer to link to the gift card.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::LinkCustomerToGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.link_customer(gift_card_id: "gift_card_id", customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW")
    def link_customer(gift_card_id:, customer_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), customer_id: customer_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/#{gift_card_id}/link-customer"
end
      square.rb::LinkCustomerToGiftCardResponse.from_json(json_object: response.body)
    end
# Unlinks a customer from a gift card, which is also referred to as removing a
#  card on file.
    #
    # @param gift_card_id [String] The ID of the gift card to be unlinked.
    # @param customer_id [String] The ID of the customer to unlink from the gift card.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UnlinkCustomerFromGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.unlink_customer(gift_card_id: "gift_card_id", customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW")
    def unlink_customer(gift_card_id:, customer_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), customer_id: customer_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/#{gift_card_id}/unlink-customer"
end
      square.rb::UnlinkCustomerFromGiftCardResponse.from_json(json_object: response.body)
    end
# Retrieves a gift card using the gift card ID.
    #
    # @param id [String] The ID of the gift card to retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.get(id: "id")
    def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/#{id}"
end
      square.rb::GetGiftCardResponse.from_json(json_object: response.body)
    end
  end
  class AsyncGiftCardsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client
  # @return [square.rb::GiftCards::ActivitiesClient] 
    attr_reader :activities


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncGiftCardsClient]
    def initialize(request_client:)
      @request_client = request_client
      @activities = square.rb::GiftCards::AsyncActivitiesClient.new(request_client: request_client)
    end
# Lists all gift cards. You can specify optional filters to retrieve
#  a subset of the gift cards. Results are sorted by `created_at` in ascending
#  order.
    #
    # @param type [String] If a [type](entity:GiftCardType) is provided, the endpoint returns gift cards of
#  the specified type.
#  Otherwise, the endpoint returns gift cards of all types.
    # @param state [String] If a [state](entity:GiftCardStatus) is provided, the endpoint returns the gift
#  cards in the specified state.
#  Otherwise, the endpoint returns the gift cards of all states.
    # @param limit [Integer] If a limit is provided, the endpoint returns only the specified number of
#  results per page.
#  The maximum value is 200. The default value is 30.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  If a cursor is not provided, the endpoint returns the first page of the results.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param customer_id [String] If a customer ID is provided, the endpoint returns only the gift cards linked to
#  the specified customer.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListGiftCardsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.list
    def list(type: nil, state: nil, limit: nil, cursor: nil, customer_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "type": type, "state": state, "limit": limit, "cursor": cursor, "customer_id": customer_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards"
end
        square.rb::ListGiftCardsResponse.from_json(json_object: response.body)
      end
    end
# Creates a digital gift card or registers a physical (plastic) gift card. The
#  resulting gift card
#  has a `PENDING` state. To activate a gift card so that it can be redeemed for
#  purchases, call
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  and create an `ACTIVATE`
#  activity with the initial balance. Alternatively, you can use
#  [RefundPayment](api-endpoint:Refunds-RefundPayment)
#  to refund a payment to the new gift card.
    #
    # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency. For more
#  information,
#  see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param location_id [String] The ID of the [location](entity:Location) where the gift card should be
#  registered for
#  reporting purposes. Gift cards can be redeemed at any of the seller's locations.
    # @param gift_card [Hash] The gift card to create. The `type` field is required for this request. The
#  `gan_source`
#  and `gan` fields are included as follows:
#  To direct Square to generate a 16-digit GAN, omit `gan_source` and `gan`.
#  To provide a custom GAN, include `gan_source` and `gan`.
#  - For `gan_source`, specify `OTHER`.
#  - For `gan`, provide a custom GAN containing 8 to 20 alphanumeric characters.
#  The GAN must be
#  unique for the seller and cannot start with the same bank identification number
#  (BIN) as major
#  credit cards. Do not use GANs that are easy to guess (such as 12345678) because
#  they greatly
#  increase the risk of fraud. It is the responsibility of the developer to ensure
#  the security
#  of their custom GANs. For more information, see
#  [Custom
#  ttps://developer.squareup.com/docs/gift-cards/using-gift-cards-api#custom-gans).
#  To register an unused, physical gift card that the seller previously ordered
#  from Square,
#  include `gan` and provide the GAN that is printed on the gift card.Request of type square.rb::GiftCard, as a Hash
    #   * :id (String) 
    #   * :type (square.rb::GiftCardType) 
    #   * :gan_source (square.rb::GiftCardGanSource) 
    #   * :state (square.rb::GiftCardStatus) 
    #   * :balance_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :gan (String) 
    #   * :created_at (String) 
    #   * :customer_ids (Array<String>) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.create(
#    idempotency_key: "NC9Tm69EjbjtConu",
#    location_id: "81FN9BNFZTKS4",
#    gift_card: { type: DIGITAL }
#  )
    def create(idempotency_key:, location_id:, gift_card:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, location_id: location_id, gift_card: gift_card }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards"
end
        square.rb::CreateGiftCardResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a gift card using the gift card account number (GAN).
    #
    # @param gan [String] The gift card account number (GAN) of the gift card to retrieve.
#  The maximum length of a GAN is 255 digits to account for third-party GANs that
#  have been imported.
#  Square-issued gift cards have 16-digit GANs.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetGiftCardFromGanResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.get_from_gan(gan: "7783320001001635")
    def get_from_gan(gan:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), gan: gan }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/from-gan"
end
        square.rb::GetGiftCardFromGanResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a gift card using a secure payment token that represents the gift
#  card.
    #
    # @param nonce [String] The payment token of the gift card to retrieve. Payment tokens are generated by
#  the
#  Web Payments SDK or In-App Payments SDK.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetGiftCardFromNonceResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.get_from_nonce(nonce: "cnon:7783322135245171")
    def get_from_nonce(nonce:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), nonce: nonce }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/from-nonce"
end
        square.rb::GetGiftCardFromNonceResponse.from_json(json_object: response.body)
      end
    end
# Links a customer to a gift card, which is also referred to as adding a card on
#  file.
    #
    # @param gift_card_id [String] The ID of the gift card to be linked.
    # @param customer_id [String] The ID of the customer to link to the gift card.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::LinkCustomerToGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.link_customer(gift_card_id: "gift_card_id", customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW")
    def link_customer(gift_card_id:, customer_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), customer_id: customer_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/#{gift_card_id}/link-customer"
end
        square.rb::LinkCustomerToGiftCardResponse.from_json(json_object: response.body)
      end
    end
# Unlinks a customer from a gift card, which is also referred to as removing a
#  card on file.
    #
    # @param gift_card_id [String] The ID of the gift card to be unlinked.
    # @param customer_id [String] The ID of the customer to unlink from the gift card.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UnlinkCustomerFromGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.unlink_customer(gift_card_id: "gift_card_id", customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW")
    def unlink_customer(gift_card_id:, customer_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), customer_id: customer_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/#{gift_card_id}/unlink-customer"
end
        square.rb::UnlinkCustomerFromGiftCardResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a gift card using the gift card ID.
    #
    # @param id [String] The ID of the gift card to retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetGiftCardResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.gift_cards.get(id: "id")
    def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/gift-cards/#{id}"
end
        square.rb::GetGiftCardResponse.from_json(json_object: response.body)
      end
    end
  end
end