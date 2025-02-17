# Refunds

```ruby
refunds_api = client.refunds
```

## Class Name

`RefundsApi`

## Methods

* [List Payment Refunds](../../doc/api/refunds.md#list-payment-refunds)
* [Refund Payment](../../doc/api/refunds.md#refund-payment)
* [Get Payment Refund](../../doc/api/refunds.md#get-payment-refund)


# List Payment Refunds

Retrieves a list of refunds for the account making the request.

Results are eventually consistent, and new refunds or changes to refunds might take several
seconds to appear.

The maximum results per page is 100.

```ruby
def list_payment_refunds(begin_time: nil,
                         end_time: nil,
                         sort_order: nil,
                         cursor: nil,
                         location_id: nil,
                         status: nil,
                         source_type: nil,
                         limit: nil,
                         updated_at_begin_time: nil,
                         updated_at_end_time: nil,
                         sort_field: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Query, Optional | Indicates the start of the time range to retrieve each `PaymentRefund` for, in RFC 3339<br>format.  The range is determined using the `created_at` field for each `PaymentRefund`.<br><br>Default: The current time minus one year. |
| `end_time` | `String` | Query, Optional | Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC 3339<br>format.  The range is determined using the `created_at` field for each `PaymentRefund`.<br><br>Default: The current time. |
| `sort_order` | `String` | Query, Optional | The order in which results are listed by `PaymentRefund.created_at`:<br><br>- `ASC` - Oldest to newest.<br>- `DESC` - Newest to oldest (default). |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for the original query.<br><br>For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |
| `location_id` | `String` | Query, Optional | Limit results to the location supplied. By default, results are returned<br>for all locations associated with the seller. |
| `status` | `String` | Query, Optional | If provided, only refunds with the given status are returned.<br>For a list of refund status values, see [PaymentRefund](entity:PaymentRefund).<br><br>Default: If omitted, refunds are returned regardless of their status. |
| `source_type` | `String` | Query, Optional | If provided, only returns refunds whose payments have the indicated source type.<br>Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, and `EXTERNAL`.<br>For information about these payment source types, see<br>[Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).<br><br>Default: If omitted, refunds are returned regardless of the source type. |
| `limit` | `Integer` | Query, Optional | The maximum number of results to be returned in a single page.<br><br>It is possible to receive fewer results than the specified limit on a given page.<br><br>If the supplied value is greater than 100, no more than 100 results are returned.<br><br>Default: 100 |
| `updated_at_begin_time` | `string` | Query, Optional | Indicates the start of the time range to retrieve each `PaymentRefund` for, in RFC 3339<br>format.  The range is determined using the `updated_at` field for each `PaymentRefund`.<br><br>Default: if omitted, the time range starts at `begin_time`. |
| `updated_at_end_time` | `string` | Query, Optional | Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC 3339<br>format.  The range is determined using the `updated_at` field for each `PaymentRefund`.<br><br>Default: The current time. |
| `sort_field` | `string` | Query, Optional | The field used to sort results by. The default is `CREATED_AT`.<br>Current values include `CREATED_AT` and `UPDATED_AT`.<br> |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Payment Refunds Response Hash`](../../doc/models/list-payment-refunds-response.md).

## Example Usage

```ruby
result = refunds_api.list_payment_refunds

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Refund Payment

Refunds a payment. You can refund the entire payment amount or a
portion of it. You can use this endpoint to refund a card payment or record a
refund of a cash or external payment. For more information, see
[Refund Payment](https://developer.squareup.com/docs/payments-api/refund-payments).

```ruby
def refund_payment(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Refund Payment Request Hash`](../../doc/models/refund-payment-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Refund Payment Response Hash`](../../doc/models/refund-payment-response.md).

## Example Usage

```ruby
body = {
  :idempotency_key => '9b7f2dcf-49da-4411-b23e-a2d6af21333a',
  :amount_money => {
    :amount => 1000,
    :currency => 'USD'
  },
  :app_fee_money => {
    :amount => 10,
    :currency => 'USD'
  },
  :payment_id => 'R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY',
  :reason => 'Example'
}


result = refunds_api.refund_payment(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Payment Refund

Retrieves a specific refund using the `refund_id`.

```ruby
def get_payment_refund(refund_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `refund_id` | `String` | Template, Required | The unique ID for the desired `PaymentRefund`. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Get Payment Refund Response Hash`](../../doc/models/get-payment-refund-response.md).

## Example Usage

```ruby
refund_id = 'refund_id4'


result = refunds_api.get_payment_refund(refund_id: refund_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

