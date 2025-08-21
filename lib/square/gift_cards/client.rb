# frozen_string_literal: true

module Square
  module GiftCards
    class Client
      # @return [Square::GiftCards::Client]
      def initialize(client:)
        @client = client
      end

      # Lists all gift cards. You can specify optional filters to retrieve
      # a subset of the gift cards. Results are sorted by `created_at` in ascending order.
      #
      # @return [Square::Types::ListGiftCardsResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[type state limit cursor customer_id]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/gift-cards",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListGiftCardsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a digital gift card or registers a physical (plastic) gift card. The resulting gift card
      # has a `PENDING` state. To activate a gift card so that it can be redeemed for purchases, call
      # [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity) and create an `ACTIVATE`
      # activity with the initial balance. Alternatively, you can use [RefundPayment](api-endpoint:Refunds-RefundPayment)
      # to refund a payment to the new gift card.
      #
      # @return [Square::Types::CreateGiftCardResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/gift-cards",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateGiftCardResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a gift card using the gift card account number (GAN).
      #
      # @return [Square::Types::GetGiftCardFromGanResponse]
      def get_from_gan(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/gift-cards/from-gan",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetGiftCardFromGanResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a gift card using a secure payment token that represents the gift card.
      #
      # @return [Square::Types::GetGiftCardFromNonceResponse]
      def get_from_nonce(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/gift-cards/from-nonce",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetGiftCardFromNonceResponse.load(_response.body)
        end

        raise _response.body
      end

      # Links a customer to a gift card, which is also referred to as adding a card on file.
      #
      # @return [Square::Types::LinkCustomerToGiftCardResponse]
      def link_customer(request_options: {}, **params)
        _path_param_names = ["gift_card_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/gift-cards/#{params[:gift_card_id]}/link-customer",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::LinkCustomerToGiftCardResponse.load(_response.body)
        end

        raise _response.body
      end

      # Unlinks a customer from a gift card, which is also referred to as removing a card on file.
      #
      # @return [Square::Types::UnlinkCustomerFromGiftCardResponse]
      def unlink_customer(request_options: {}, **params)
        _path_param_names = ["gift_card_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/gift-cards/#{params[:gift_card_id]}/unlink-customer",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UnlinkCustomerFromGiftCardResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a gift card using the gift card ID.
      #
      # @return [Square::Types::GetGiftCardResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/gift-cards/#{params[:id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetGiftCardResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::Activities::Client]
      def activities
        @activities ||= Square::Activities::Client.new(client: @raw_client)
      end
    end
  end
end
