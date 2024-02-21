# V1 Transactions

```ruby
v1_transactions_api = client.v1_transactions
```

## Class Name

`V1TransactionsApi`

## Methods

* [V1 List Orders](../../doc/api/v1-transactions.md#v1-list-orders)
* [V1 Retrieve Order](../../doc/api/v1-transactions.md#v1-retrieve-order)
* [V1 Update Order](../../doc/api/v1-transactions.md#v1-update-order)


# V1 List Orders

**This endpoint is deprecated.**

Provides summary information for a merchant's online store orders.

```ruby
def v1_list_orders(location_id:,
                   order: nil,
                   limit: nil,
                   batch_token: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list online store orders for. |
| `order` | [`String (Sort Order)`](../../doc/models/sort-order.md) | Query, Optional | The order in which payments are listed in the response. |
| `limit` | `Integer` | Query, Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Array<V1 Order Hash>`](../../doc/models/v1-order.md).

## Example Usage

```ruby
location_id = 'location_id4'


result = v1_transactions_api.v1_list_orders(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```


# V1 Retrieve Order

**This endpoint is deprecated.**

Provides comprehensive information for a single online store order, including the order's history.

```ruby
def v1_retrieve_order(location_id:,
                      order_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the order's associated location. |
| `order_id` | `String` | Template, Required | The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`V1 Order Hash`](../../doc/models/v1-order.md).

## Example Usage

```ruby
location_id = 'location_id4'

order_id = 'order_id6'


result = v1_transactions_api.v1_retrieve_order(
  location_id: location_id,
  order_id: order_id
)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```


# V1 Update Order

**This endpoint is deprecated.**

Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:

```ruby
def v1_update_order(location_id:,
                    order_id:,
                    body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the order's associated location. |
| `order_id` | `String` | Template, Required | The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint |
| `body` | [`V1 Update Order Request Hash`](../../doc/models/v1-update-order-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`V1 Order Hash`](../../doc/models/v1-order.md).

## Example Usage

```ruby
location_id = 'location_id4'

order_id = 'order_id6'

body = {
  :action => 'REFUND'
}


result = v1_transactions_api.v1_update_order(
  location_id: location_id,
  order_id: order_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

