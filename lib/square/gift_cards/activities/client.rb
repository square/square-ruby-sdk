# frozen_string_literal: true

module Square
  module GiftCards
    module Activities
      class Client
        # @return [Square::GiftCards::Activities::Client]
        def initialize(client:)
          @client = client
        end

        # Lists gift card activities. By default, you get gift card activities for all
        # gift cards in the seller's account. You can optionally specify query parameters to
        # filter the list. For example, you can get a list of gift card activities for a gift card,
        # for all gift cards in a specific region, or for activities within a time window.
        #
        # @return [Square::Types::ListGiftCardActivitiesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[gift_card_id type location_id begin_time end_time limit cursor sort_order]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :gift_card_activities,
            initial_cursor: _query[:cursor]
          ) do |next_cursor|
            _query[:cursor] = next_cursor
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/gift-cards/activities",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListGiftCardActivitiesResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end

        # Creates a gift card activity to manage the balance or state of a [gift card](entity:GiftCard).
        # For example, create an `ACTIVATE` activity to activate a gift card with an initial balance before first use.
        #
        # @return [Square::Types::CreateGiftCardActivityResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/gift-cards/activities",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateGiftCardActivityResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
