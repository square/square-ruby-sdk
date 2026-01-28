# frozen_string_literal: true

module Square
  module GiftCards
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Lists all gift cards. You can specify optional filters to retrieve
      # a subset of the gift cards. Results are sorted by `created_at` in ascending order.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :type
      # @option params [String, nil] :state
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :cursor
      # @option params [String, nil] :customer_id
      #
      # @return [Square::Types::ListGiftCardsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[type state limit cursor customer_id]
        query_params = {}
        query_params["type"] = params[:type] if params.key?(:type)
        query_params["state"] = params[:state] if params.key?(:state)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["customer_id"] = params[:customer_id] if params.key?(:customer_id)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :gift_cards,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/gift-cards",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListGiftCardsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Creates a digital gift card or registers a physical (plastic) gift card. The resulting gift card
      # has a `PENDING` state. To activate a gift card so that it can be redeemed for purchases, call
      # [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity) and create an `ACTIVATE`
      # activity with the initial balance. Alternatively, you can use
      # [RefundPayment](api-endpoint:Refunds-RefundPayment)
      # to refund a payment to the new gift card.
      #
      # @param request_options [Hash]
      # @param params [Square::GiftCards::Types::CreateGiftCardRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateGiftCardResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/gift-cards",
          body: Square::GiftCards::Types::CreateGiftCardRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateGiftCardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a gift card using the gift card account number (GAN).
      #
      # @param request_options [Hash]
      # @param params [Square::GiftCards::Types::GetGiftCardFromGanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::GetGiftCardFromGanResponse]
      def get_from_gan(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/gift-cards/from-gan",
          body: Square::GiftCards::Types::GetGiftCardFromGanRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetGiftCardFromGanResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a gift card using a secure payment token that represents the gift card.
      #
      # @param request_options [Hash]
      # @param params [Square::GiftCards::Types::GetGiftCardFromNonceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::GetGiftCardFromNonceResponse]
      def get_from_nonce(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/gift-cards/from-nonce",
          body: Square::GiftCards::Types::GetGiftCardFromNonceRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetGiftCardFromNonceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Links a customer to a gift card, which is also referred to as adding a card on file.
      #
      # @param request_options [Hash]
      # @param params [Square::GiftCards::Types::LinkCustomerToGiftCardRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :gift_card_id
      #
      # @return [Square::Types::LinkCustomerToGiftCardResponse]
      def link_customer(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::GiftCards::Types::LinkCustomerToGiftCardRequest.new(params).to_h
        non_body_param_names = ["gift_card_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/gift-cards/#{params[:gift_card_id]}/link-customer",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::LinkCustomerToGiftCardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Unlinks a customer from a gift card, which is also referred to as removing a card on file.
      #
      # @param request_options [Hash]
      # @param params [Square::GiftCards::Types::UnlinkCustomerFromGiftCardRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :gift_card_id
      #
      # @return [Square::Types::UnlinkCustomerFromGiftCardResponse]
      def unlink_customer(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::GiftCards::Types::UnlinkCustomerFromGiftCardRequest.new(params).to_h
        non_body_param_names = ["gift_card_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/gift-cards/#{params[:gift_card_id]}/unlink-customer",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UnlinkCustomerFromGiftCardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a gift card using the gift card ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Square::Types::GetGiftCardResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/gift-cards/#{params[:id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetGiftCardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::Activities::Client]
      def activities
        @activities ||= Square::GiftCards::Activities::Client.new(client: @client)
      end
    end
  end
end
