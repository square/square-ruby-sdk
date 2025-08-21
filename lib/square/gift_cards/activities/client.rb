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
          _query_param_names = %w[gift_card_id type location_id begin_time end_time limit cursor
                                  sort_order]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/gift-cards/activities",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListGiftCardActivitiesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates a gift card activity to manage the balance or state of a [gift card](entity:GiftCard).
        # For example, create an `ACTIVATE` activity to activate a gift card with an initial balance before first use.
        #
        # @return [Square::Types::CreateGiftCardActivityResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/gift-cards/activities",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateGiftCardActivityResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
