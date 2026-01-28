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
          Square::Types::CreateSubscriptionResponse.load(response.body)
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
          Square::Types::BulkSwapPlanResponse.load(response.body)
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
          Square::Types::SearchSubscriptionsResponse.load(response.body)
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
      # @return [Square::Types::GetSubscriptionResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[include]
        query_params = {}
        query_params["include"] = params[:include] if params.key?(:include)
        params = params.except(*query_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/subscriptions/#{params[:subscription_id]}",
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
          Square::Types::GetSubscriptionResponse.load(response.body)
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
      # @return [Square::Types::UpdateSubscriptionResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::UpdateSubscriptionRequest.new(params).to_h
        non_body_param_names = ["subscription_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/subscriptions/#{params[:subscription_id]}",
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
          Square::Types::UpdateSubscriptionResponse.load(response.body)
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
      # @return [Square::Types::DeleteSubscriptionActionResponse]
      def delete_action(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/subscriptions/#{params[:subscription_id]}/actions/#{params[:action_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteSubscriptionActionResponse.load(response.body)
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
      # @return [Square::Types::ChangeBillingAnchorDateResponse]
      def change_billing_anchor_date(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::ChangeBillingAnchorDateRequest.new(params).to_h
        non_body_param_names = ["subscription_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/billing-anchor",
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
          Square::Types::ChangeBillingAnchorDateResponse.load(response.body)
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
      # @return [Square::Types::CancelSubscriptionResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/cancel",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CancelSubscriptionResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Lists all [events](https://developer.squareup.com/docs/subscriptions-api/actions-events) for a specific
      # subscription.
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
      # @return [Square::Types::ListSubscriptionEventsResponse]
      def list_events(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[cursor limit]
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        params = params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :subscription_events,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/subscriptions/#{params[:subscription_id]}/events",
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
            Square::Types::ListSubscriptionEventsResponse.load(response.body)
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
      # @return [Square::Types::PauseSubscriptionResponse]
      def pause(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::PauseSubscriptionRequest.new(params).to_h
        non_body_param_names = ["subscription_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/pause",
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
          Square::Types::PauseSubscriptionResponse.load(response.body)
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
      # @return [Square::Types::ResumeSubscriptionResponse]
      def resume(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::ResumeSubscriptionRequest.new(params).to_h
        non_body_param_names = ["subscription_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/resume",
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
          Square::Types::ResumeSubscriptionResponse.load(response.body)
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
      # @return [Square::Types::SwapPlanResponse]
      def swap_plan(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Subscriptions::Types::SwapPlanRequest.new(params).to_h
        non_body_param_names = ["subscription_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/swap-plan",
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
          Square::Types::SwapPlanResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
