# Subscriptions

```ruby
subscriptions_api = client.subscriptions
```

## Class Name

`SubscriptionsApi`

## Methods

* [Create Subscription](../../doc/api/subscriptions.md#create-subscription)
* [Search Subscriptions](../../doc/api/subscriptions.md#search-subscriptions)
* [Retrieve Subscription](../../doc/api/subscriptions.md#retrieve-subscription)
* [Update Subscription](../../doc/api/subscriptions.md#update-subscription)
* [Delete Subscription Action](../../doc/api/subscriptions.md#delete-subscription-action)
* [Cancel Subscription](../../doc/api/subscriptions.md#cancel-subscription)
* [List Subscription Events](../../doc/api/subscriptions.md#list-subscription-events)
* [Pause Subscription](../../doc/api/subscriptions.md#pause-subscription)
* [Resume Subscription](../../doc/api/subscriptions.md#resume-subscription)
* [Swap Plan](../../doc/api/subscriptions.md#swap-plan)


# Create Subscription

Creates a subscription to a subscription plan by a customer.

If you provide a card on file in the request, Square charges the card for
the subscription. Otherwise, Square bills an invoice to the customer's email
address. The subscription starts immediately, unless the request includes
the optional `start_date`. Each individual subscription is associated with a particular location.

```ruby
def create_subscription(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Subscription Request Hash`](../../doc/models/create-subscription-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Subscription Response Hash`](../../doc/models/create-subscription-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = '8193148c-9586-11e6-99f9-28cfe92138cf'
body[:location_id] = 'S8GWD5R9QB376'
body[:plan_id] = '6JHXF3B2CW3YKHDV4XEM674H'
body[:customer_id] = 'CHFGVKYY8RSV93M5KCYTG4PN0G'
body[:start_date] = '2021-10-20'
body[:canceled_date] = 'canceled_date0'
body[:tax_percentage] = '5'
body[:price_override_money] = {}
body[:price_override_money][:amount] = 100
body[:price_override_money][:currency] = 'USD'
body[:card_id] = 'ccof:qy5x8hHGYsgLrp4Q4GB'
body[:timezone] = 'America/Los_Angeles'
body[:source] = {}
body[:source][:name] = 'My App'

result = subscriptions_api.create_subscription(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Subscriptions

Searches for subscriptions.

Results are ordered chronologically by subscription creation date. If
the request specifies more than one location ID,
the endpoint orders the result
by location ID, and then by creation date within each location. If no locations are given
in the query, all locations are searched.

You can also optionally specify `customer_ids` to search by customer.
If left unset, all customers
associated with the specified locations are returned.
If the request specifies customer IDs, the endpoint orders results
first by location, within location by customer ID, and within
customer by subscription creation date.

For more information, see
[Retrieve subscriptions](../../https://developer.squareup.com/docs/subscriptions-api/overview#retrieve-subscriptions).

```ruby
def search_subscriptions(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Subscriptions Request Hash`](../../doc/models/search-subscriptions-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Subscriptions Response Hash`](../../doc/models/search-subscriptions-response.md)

## Example Usage

```ruby
body = {}
body[:cursor] = 'cursor0'
body[:limit] = 164
body[:query] = {}
body[:query][:filter] = {}
body[:query][:filter][:customer_ids] = ['CHFGVKYY8RSV93M5KCYTG4PN0G']
body[:query][:filter][:location_ids] = ['S8GWD5R9QB376']
body[:query][:filter][:source_names] = ['My App']
body[:include] = ['include4', 'include5', 'include6']

result = subscriptions_api.search_subscriptions(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Subscription

Retrieves a subscription.

```ruby
def retrieve_subscription(subscription_id:,
                          include: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to retrieve. |
| `include` | `String` | Query, Optional | A query parameter to specify related information to be included in the response.<br><br>The supported query parameter values are:<br><br>- `actions`: to include scheduled actions on the targeted subscription. |

## Response Type

[`Retrieve Subscription Response Hash`](../../doc/models/retrieve-subscription-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
include = 'include2'

result = subscriptions_api.retrieve_subscription(subscription_id: subscription_id, include: include)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Subscription

Updates a subscription. You can set, modify, and clear the
`subscription` field values.

```ruby
def update_subscription(subscription_id:,
                        body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to update. |
| `body` | [`Update Subscription Request Hash`](../../doc/models/update-subscription-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Update Subscription Response Hash`](../../doc/models/update-subscription-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
body = {}
body[:subscription] = {}
body[:subscription][:id] = 'id8'
body[:subscription][:location_id] = 'location_id2'
body[:subscription][:plan_id] = 'plan_id0'
body[:subscription][:customer_id] = 'customer_id6'
body[:subscription][:start_date] = 'start_date2'
body[:subscription][:tax_percentage] = 'null'
body[:subscription][:price_override_money] = {}
body[:subscription][:price_override_money][:amount] = 2000
body[:subscription][:price_override_money][:currency] = 'USD'
body[:subscription][:version] = 1594155459464

result = subscriptions_api.update_subscription(subscription_id: subscription_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Subscription Action

Deletes a scheduled action for a subscription.

```ruby
def delete_subscription_action(subscription_id:,
                               action_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription the targeted action is to act upon. |
| `action_id` | `String` | Template, Required | The ID of the targeted action to be deleted. |

## Response Type

[`Delete Subscription Action Response Hash`](../../doc/models/delete-subscription-action-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
action_id = 'action_id6'

result = subscriptions_api.delete_subscription_action(subscription_id: subscription_id, action_id: action_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Cancel Subscription

Schedules a `CANCEL` action to cancel an active subscription
by setting the `canceled_date` field to the end of the active billing period
and changing the subscription status from ACTIVE to CANCELED after this date.

```ruby
def cancel_subscription(subscription_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to cancel. |

## Response Type

[`Cancel Subscription Response Hash`](../../doc/models/cancel-subscription-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'

result = subscriptions_api.cancel_subscription(subscription_id: subscription_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Subscription Events

Lists all events for a specific subscription.
In the current implementation, only `START_SUBSCRIPTION` and `STOP_SUBSCRIPTION` (when the subscription was canceled) events are returned.

```ruby
def list_subscription_events(subscription_id:,
                             cursor: nil,
                             limit: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to retrieve the events for. |
| `cursor` | `String` | Query, Optional | When the total number of resulting subscription events exceeds the limit of a paged response,<br>specify the cursor returned from a preceding response here to fetch the next set of results.<br>If the cursor is unset, the response contains the last page of the results.<br><br>For more information, see [Pagination](../../https://developer.squareup.com/docs/working-with-apis/pagination). |
| `limit` | `Integer` | Query, Optional | The upper limit on the number of subscription events to return<br>in a paged response. |

## Response Type

[`List Subscription Events Response Hash`](../../doc/models/list-subscription-events-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
cursor = 'cursor6'
limit = 172

result = subscriptions_api.list_subscription_events(subscription_id: subscription_id, cursor: cursor, limit: limit)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Pause Subscription

Schedules a `PAUSE` action to pause an active subscription.

```ruby
def pause_subscription(subscription_id:,
                       body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to pause. |
| `body` | [`Pause Subscription Request Hash`](../../doc/models/pause-subscription-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Pause Subscription Response Hash`](../../doc/models/pause-subscription-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
body = {}
body[:pause_effective_date] = 'pause_effective_date6'
body[:pause_cycle_duration] = 94
body[:resume_effective_date] = 'resume_effective_date4'
body[:resume_change_timing] = 'IMMEDIATE'
body[:pause_reason] = 'pause_reason2'

result = subscriptions_api.pause_subscription(subscription_id: subscription_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Resume Subscription

Schedules a `RESUME` action to resume a paused or a deactivated subscription.

```ruby
def resume_subscription(subscription_id:,
                        body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to resume. |
| `body` | [`Resume Subscription Request Hash`](../../doc/models/resume-subscription-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Resume Subscription Response Hash`](../../doc/models/resume-subscription-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
body = {}
body[:resume_effective_date] = 'resume_effective_date4'
body[:resume_change_timing] = 'IMMEDIATE'

result = subscriptions_api.resume_subscription(subscription_id: subscription_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Swap Plan

Schedules a `SWAP_PLAN` action to swap a subscription plan in an existing subscription.

```ruby
def swap_plan(subscription_id:,
              body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `subscription_id` | `String` | Template, Required | The ID of the subscription to swap the subscription plan for. |
| `body` | [`Swap Plan Request Hash`](../../doc/models/swap-plan-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Swap Plan Response Hash`](../../doc/models/swap-plan-response.md)

## Example Usage

```ruby
subscription_id = 'subscription_id0'
body = {}
body[:new_plan_id] = 'new_plan_id2'

result = subscriptions_api.swap_plan(subscription_id: subscription_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

