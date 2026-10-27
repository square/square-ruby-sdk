# frozen_string_literal: true

module Square
  module Subscriptions
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Enrolls a customer in a subscription.
      #
      # If you provide a card on file in the request, Square charges the card for
      # the subscription. Otherwise, Square sends an invoice to the customer's email
      # address. The subscription starts immediately, unless the request includes
      # the optional `start_date`. Each individual subscription is associated with a particular location.
      #
      # For more information, see [Create a
      # subscription](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions#create-a-subscription).
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::CreateSubscriptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.subscriptions.create(
      #     idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf",
      #     location_id: "S8GWD5R9QB376",
      #     plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
      #     customer_id: "CHFGVKYY8RSV93M5KCYTG4PN0G",
      #     start_date: "2023-06-20",
      #     card_id: "ccof:qy5x8hHGYsgLrp4Q4GB",
      #     timezone: "America/Los_Angeles",
      #     source: {
      #       name: "My Application"
      #     },
      #     phases: [{
      #       ordinal: 0,
      #       order_template_id: "U2NaowWxzXwpsZU697x7ZHOAnCNZY"
      #     }]
      #   )
      #
      # @return [Square::Types::CreateSubscriptionResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions",
          body: Square::Subscriptions::Types::CreateSubscriptionRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateSubscriptionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Schedules a plan variation change for all active subscriptions under a given plan
      # variation. For more information, see [Swap Subscription Plan
      # Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::BulkSwapPlanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.subscriptions.bulk_swap_plan(
      #     new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
      #     old_plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
      #     location_id: "S8GWD5R9QB376"
      #   )
      #
      # @return [Square::Types::BulkSwapPlanResponse]
      def bulk_swap_plan(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/bulk-swap-plan",
          body: Square::Subscriptions::Types::BulkSwapPlanRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkSwapPlanResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Searches for subscriptions.
      #
      # Results are ordered chronologically by subscription creation date. If
      # the request specifies more than one location ID,
      # the endpoint orders the result
      # by location ID, and then by creation date within each location. If no locations are given
      # in the query, all locations are searched.
      #
      # You can also optionally specify `customer_ids` to search by customer.
      # If left unset, all customers
      # associated with the specified locations are returned.
      # If the request specifies customer IDs, the endpoint orders results
      # first by location, within location by customer ID, and within
      # customer by subscription creation date.
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::SearchSubscriptionsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.subscriptions.search(query: {
      #     filter: {
      #       customer_ids: ["CHFGVKYY8RSV93M5KCYTG4PN0G"],
      #       location_ids: ["S8GWD5R9QB376"],
      #       source_names: ["My App"]
      #     }
      #   })
      #
      # @return [Square::Types::SearchSubscriptionsResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/search",
          body: Square::Subscriptions::Types::SearchSubscriptionsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchSubscriptionsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a specific subscription.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      # @option params [String, nil] :include
      #
      # @example
      #   client.subscriptions.get(
      #     subscription_id: "subscription_id",
      #     include: "include"
      #   )
      #
      # @return [Square::Types::GetSubscriptionResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["include"] = params[:include] if params.key?(:include)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::GetSubscriptionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a subscription by modifying or clearing `subscription` field values.
      # To clear a field, set its value to `null`.
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::UpdateSubscriptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      #
      # @example
      #   client.subscriptions.update(
      #     subscription_id: "subscription_id",
      #     subscription: {
      #       card_id: "{NEW CARD ID}"
      #     }
      #   )
      #
      # @return [Square::Types::UpdateSubscriptionResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::UpdateSubscriptionRequest.new(params).to_h
        non_body_param_names = %w[subscription_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::UpdateSubscriptionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes a scheduled action for a subscription.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      # @option params [String] :action_id
      #
      # @example
      #   client.subscriptions.delete_action(
      #     subscription_id: "subscription_id",
      #     action_id: "action_id"
      #   )
      #
      # @return [Square::Types::DeleteSubscriptionActionResponse]
      def delete_action(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/actions/#{URI.encode_uri_component(params[:action_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DeleteSubscriptionActionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Changes the [billing anchor
      # date](https://developer.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
      # for a subscription.
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::ChangeBillingAnchorDateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      #
      # @example
      #   client.subscriptions.change_billing_anchor_date(
      #     subscription_id: "subscription_id",
      #     monthly_billing_anchor_date: 1
      #   )
      #
      # @return [Square::Types::ChangeBillingAnchorDateResponse]
      def change_billing_anchor_date(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::ChangeBillingAnchorDateRequest.new(params).to_h
        non_body_param_names = %w[subscription_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/billing-anchor",
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
          (response.body.to_s.empty? ? nil : Square::Types::ChangeBillingAnchorDateResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Schedules a `CANCEL` action to cancel an active subscription. This
      # sets the `canceled_date` field to the end of the active billing period. After this date,
      # the subscription status changes from ACTIVE to CANCELED.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      #
      # @example
      #   client.subscriptions.cancel(subscription_id: "subscription_id")
      #
      # @return [Square::Types::CancelSubscriptionResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/cancel",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CancelSubscriptionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists all [events](https://developer.squareup.com/docs/subscriptions-api/actions-events) for a specific
      # subscription.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::SubscriptionEvent` in the
      # `subscription_events` field of every page, requesting pages as they are needed. Call `pages` on it to get each
      # page as a `Square::Types::ListSubscriptionEventsResponse`, including its other fields.
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
      # @option params [String] :subscription_id
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      #
      # @example
      #   client.subscriptions.list_events(
      #     subscription_id: "subscription_id",
      #     cursor: "cursor",
      #     limit: 1
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list_events(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :subscription_events,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/events",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListSubscriptionEventsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Schedules a `PAUSE` action to pause an active subscription.
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::PauseSubscriptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      #
      # @example
      #   client.subscriptions.pause(subscription_id: "subscription_id")
      #
      # @return [Square::Types::PauseSubscriptionResponse]
      def pause(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::PauseSubscriptionRequest.new(params).to_h
        non_body_param_names = %w[subscription_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/pause",
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
          (response.body.to_s.empty? ? nil : Square::Types::PauseSubscriptionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Schedules a `RESUME` action to resume a paused or a deactivated subscription.
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::ResumeSubscriptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      #
      # @example
      #   client.subscriptions.resume(subscription_id: "subscription_id")
      #
      # @return [Square::Types::ResumeSubscriptionResponse]
      def resume(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::ResumeSubscriptionRequest.new(params).to_h
        non_body_param_names = %w[subscription_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/resume",
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
          (response.body.to_s.empty? ? nil : Square::Types::ResumeSubscriptionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an existing subscription.
      # For more information, see [Swap Subscription Plan
      # Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
      #
      # @param request_options [Hash]
      # @param params [Square::Subscriptions::Types::SwapPlanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :subscription_id
      #
      # @example
      #   client.subscriptions.swap_plan(
      #     subscription_id: "subscription_id",
      #     new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
      #     phases: [{
      #       ordinal: 0,
      #       order_template_id: "uhhnjH9osVv3shUADwaC0b3hNxQZY"
      #     }]
      #   )
      #
      # @return [Square::Types::SwapPlanResponse]
      def swap_plan(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::SwapPlanRequest.new(params).to_h
        non_body_param_names = %w[subscription_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/swap-plan",
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
          (response.body.to_s.empty? ? nil : Square::Types::SwapPlanResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
