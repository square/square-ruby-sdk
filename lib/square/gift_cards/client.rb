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
        _query_param_names = [
          %w[type state limit cursor customer_id],
          %i[type state limit cursor customer_id]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/gift-cards",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::ListGiftCardsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
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
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/gift-cards",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateGiftCardResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a gift card using the gift card account number (GAN).
      #
      # @return [Square::Types::GetGiftCardFromGanResponse]
      def get_from_gan(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/gift-cards/from-gan",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetGiftCardFromGanResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a gift card using a secure payment token that represents the gift card.
      #
      # @return [Square::Types::GetGiftCardFromNonceResponse]
      def get_from_nonce(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/gift-cards/from-nonce",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetGiftCardFromNonceResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Links a customer to a gift card, which is also referred to as adding a card on file.
      #
      # @return [Square::Types::LinkCustomerToGiftCardResponse]
      def link_customer(request_options: {}, **params)
        _path_param_names = ["gift_card_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/gift-cards/#{params[:gift_card_id]}/link-customer",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::LinkCustomerToGiftCardResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Unlinks a customer from a gift card, which is also referred to as removing a card on file.
      #
      # @return [Square::Types::UnlinkCustomerFromGiftCardResponse]
      def unlink_customer(request_options: {}, **params)
        _path_param_names = ["gift_card_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/gift-cards/#{params[:gift_card_id]}/unlink-customer",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::UnlinkCustomerFromGiftCardResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a gift card using the gift card ID.
      #
      # @return [Square::Types::GetGiftCardResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/gift-cards/#{params[:id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetGiftCardResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [Square::Activities::Client]
      def activities
        @activities ||= Square::GiftCards::Activities::Client.new(client: @client)
      end
    end
  end
end
