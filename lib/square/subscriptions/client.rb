# frozen_string_literal: true

module Square
  module Subscriptions
    class Client
      # @return [Square::Subscriptions::Client]
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
      # For more information, see [Create a subscription](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions#create-a-subscription).
      #
      # @return [Square::Types::CreateSubscriptionResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a plan variation change for all active subscriptions under a given plan
      # variation. For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
      #
      # @return [Square::Types::BulkSwapPlanResponse]
      def bulk_swap_plan(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/bulk-swap-plan",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkSwapPlanResponse.load(_response.body)
        end

        raise _response.body
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
      # @return [Square::Types::SearchSubscriptionsResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchSubscriptionsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a specific subscription.
      #
      # @return [Square::Types::GetSubscriptionResponse]
      def get(request_options: {}, **params)
        _query_param_names = [
          ["include"],
          %i[include]
        ].flatten
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/subscriptions/#{params[:subscription_id]}",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a subscription by modifying or clearing `subscription` field values.
      # To clear a field, set its value to `null`.
      #
      # @return [Square::Types::UpdateSubscriptionResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/subscriptions/#{params[:subscription_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deletes a scheduled action for a subscription.
      #
      # @return [Square::Types::DeleteSubscriptionActionResponse]
      def delete_action(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/subscriptions/#{params[:subscription_id]}/actions/#{params[:action_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteSubscriptionActionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Changes the [billing anchor date](https://developer.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
      # for a subscription.
      #
      # @return [Square::Types::ChangeBillingAnchorDateResponse]
      def change_billing_anchor_date(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/billing-anchor",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ChangeBillingAnchorDateResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `CANCEL` action to cancel an active subscription. This
      # sets the `canceled_date` field to the end of the active billing period. After this date,
      # the subscription status changes from ACTIVE to CANCELED.
      #
      # @return [Square::Types::CancelSubscriptionResponse]
      def cancel(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/cancel"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Lists all [events](https://developer.squareup.com/docs/subscriptions-api/actions-events) for a specific subscription.
      #
      # @return [Square::Types::ListSubscriptionEventsResponse]
      def list_events(request_options: {}, **params)
        _query_param_names = [
          %w[cursor limit],
          %i[cursor limit]
        ].flatten
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/subscriptions/#{params[:subscription_id]}/events",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListSubscriptionEventsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `PAUSE` action to pause an active subscription.
      #
      # @return [Square::Types::PauseSubscriptionResponse]
      def pause(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/pause",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::PauseSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `RESUME` action to resume a paused or a deactivated subscription.
      #
      # @return [Square::Types::ResumeSubscriptionResponse]
      def resume(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/resume",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ResumeSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an existing subscription.
      # For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
      #
      # @return [Square::Types::SwapPlanResponse]
      def swap_plan(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/swap-plan",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        return Square::Types::SwapPlanResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end
    end
  end
end
