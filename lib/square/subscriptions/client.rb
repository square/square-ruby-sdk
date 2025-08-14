
module Square
    module Subscriptions
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Subscriptions::Client]
            def initialize(client)
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
            # @return [Square::CreateSubscriptionResponse]
            def create(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CreateSubscriptionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Schedules a plan variation change for all active subscriptions under a given plan
            # variation. For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
            #
            # @return [Square::BulkSwapPlanResponse]
            def bulk_swap_plan(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::BulkSwapPlanResponse.load(_response.body)

                else
                    raise _response.body
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
            # @return [Square::SearchSubscriptionsResponse]
            def search(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::SearchSubscriptionsResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Retrieves a specific subscription.
            #
            # @return [Square::GetSubscriptionResponse]
            def get(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetSubscriptionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Updates a subscription by modifying or clearing `subscription` field values.
            # To clear a field, set its value to `null`.
            #
            # @return [Square::UpdateSubscriptionResponse]
            def update(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::UpdateSubscriptionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Deletes a scheduled action for a subscription.
            #
            # @return [Square::DeleteSubscriptionActionResponse]
            def delete_action(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::DeleteSubscriptionActionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Changes the [billing anchor date](https://developer.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
            # for a subscription.
            #
            # @return [Square::ChangeBillingAnchorDateResponse]
            def change_billing_anchor_date(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ChangeBillingAnchorDateResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Schedules a `CANCEL` action to cancel an active subscription. This 
            # sets the `canceled_date` field to the end of the active billing period. After this date, 
            # the subscription status changes from ACTIVE to CANCELED.
            #
            # @return [Square::CancelSubscriptionResponse]
            def cancel(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CancelSubscriptionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Lists all [events](https://developer.squareup.com/docs/subscriptions-api/actions-events) for a specific subscription.
            #
            # @return [Square::ListSubscriptionEventsResponse]
            def list_events(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ListSubscriptionEventsResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Schedules a `PAUSE` action to pause an active subscription.
            #
            # @return [Square::PauseSubscriptionResponse]
            def pause(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::PauseSubscriptionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Schedules a `RESUME` action to resume a paused or a deactivated subscription.
            #
            # @return [Square::ResumeSubscriptionResponse]
            def resume(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ResumeSubscriptionResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an existing subscription. 
            # For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
            #
            # @return [Square::SwapPlanResponse]
            def swap_plan(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::SwapPlanResponse.load(_response.body)

                else
                    raise _response.body
                end
            end
        end
    end
end
