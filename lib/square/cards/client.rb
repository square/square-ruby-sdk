# frozen_string_literal: true

module Square
  module Cards
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of cards owned by the account making the request.
      # A max of 25 cards will be returned.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Card` in the `cards` field of
      # every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListCardsResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :cursor
      # @option params [String, nil] :customer_id
      # @option params [Boolean, nil] :include_disabled
      # @option params [String, nil] :reference_id
      # @option params [Square::Types::SortOrder, nil] :sort_order
      #
      # @example
      #   client.cards.list(
      #     cursor: "cursor",
      #     customer_id: "customer_id",
      #     include_disabled: true,
      #     reference_id: "reference_id",
      #     sort_order: "DESC"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["customer_id"] = params[:customer_id] if params.key?(:customer_id)
        query_params["include_disabled"] = params[:include_disabled] if params.key?(:include_disabled)
        query_params["reference_id"] = params[:reference_id] if params.key?(:reference_id)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :cards,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/cards",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCardsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Adds a card on file to an existing merchant.
      #
      # @param request_options [Hash]
      # @param params [Square::Cards::Types::CreateCardRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.cards.create(
      #     idempotency_key: "4935a656-a929-4792-b97c-8848be85c27c",
      #     source_id: "cnon:uIbfJXhXETSP197M3GB",
      #     card: {
      #       cardholder_name: "Amelia Earhart",
      #       billing_address: {
      #         address_line_1: "500 Electric Ave",
      #         address_line_2: "Suite 600",
      #         locality: "New York",
      #         administrative_district_level_1: "NY",
      #         postal_code: "10003",
      #         country: "US"
      #       },
      #       customer_id: "VDKXEEKPJN48QDG3BGGFAK05P8",
      #       reference_id: "user-id-1"
      #     }
      #   )
      #
      # @return [Square::Types::CreateCardResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/cards",
          body: Square::Cards::Types::CreateCardRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateCardResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves details for a specific Card.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :card_id
      #
      # @example
      #   client.cards.get(card_id: "card_id")
      #
      # @return [Square::Types::GetCardResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/cards/#{URI.encode_uri_component(params[:card_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetCardResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Disables the card, preventing any further updates or charges.
      # Disabling an already disabled card is allowed but has no effect.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :card_id
      #
      # @example
      #   client.cards.disable(card_id: "card_id")
      #
      # @return [Square::Types::DisableCardResponse]
      def disable(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/cards/#{URI.encode_uri_component(params[:card_id].to_s)}/disable",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DisableCardResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
