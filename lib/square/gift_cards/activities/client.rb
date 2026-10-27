# frozen_string_literal: true

module Square
  module GiftCards
    module Activities
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists gift card activities. By default, you get gift card activities for all
        # gift cards in the seller's account. You can optionally specify query parameters to
        # filter the list. For example, you can get a list of gift card activities for a gift card,
        # for all gift cards in a specific region, or for activities within a time window.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::GiftCardActivity` in the
        # `gift_card_activities` field of every page, requesting pages as they are needed. Call `pages` on it to get
        # each page as a `Square::Types::ListGiftCardActivitiesResponse`, including its other fields.
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
        # @option params [String, nil] :gift_card_id
        # @option params [String, nil] :type
        # @option params [String, nil] :location_id
        # @option params [String, nil] :begin_time
        # @option params [String, nil] :end_time
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        # @option params [String, nil] :sort_order
        #
        # @example
        #   client.gift_cards.activities.list(
        #     gift_card_id: "gift_card_id",
        #     type: "type",
        #     location_id: "location_id",
        #     begin_time: "begin_time",
        #     end_time: "end_time",
        #     limit: 1,
        #     cursor: "cursor",
        #     sort_order: "sort_order"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["gift_card_id"] = params[:gift_card_id] if params.key?(:gift_card_id)
          query_params["type"] = params[:type] if params.key?(:type)
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
          query_params["end_time"] = params[:end_time] if params.key?(:end_time)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :gift_card_activities,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/gift-cards/activities",
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListGiftCardActivitiesResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a gift card activity to manage the balance or state of a [gift card](entity:GiftCard).
        # For example, create an `ACTIVATE` activity to activate a gift card with an initial balance before first use.
        #
        # @param request_options [Hash]
        # @param params [Square::GiftCards::Activities::Types::CreateGiftCardActivityRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.gift_cards.activities.create(
        #     idempotency_key: "U16kfr-kA70er-q4Rsym-7U7NnY",
        #     gift_card_activity: {
        #       type: "ACTIVATE",
        #       location_id: "81FN9BNFZTKS4",
        #       gift_card_id: "gftc:6d55a72470d940c6ba09c0ab8ad08d20",
        #       activate_activity_details: {
        #         order_id: "jJNGHm4gLI6XkFbwtiSLqK72KkAZY",
        #         line_item_uid: "eIWl7X0nMuO9Ewbh0ChIx"
        #       }
        #     }
        #   )
        #
        # @return [Square::Types::CreateGiftCardActivityResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/gift-cards/activities",
            body: Square::GiftCards::Activities::Types::CreateGiftCardActivityRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateGiftCardActivityResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
