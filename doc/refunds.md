# Refunds

```ruby
refunds_api = client.refunds
```

## Class Name

`RefundsApi`

## Methods

* [List Payment Refunds](/doc/refunds.md#list-payment-refunds)
* [Refund Payment](/doc/refunds.md#refund-payment)
* [Get Payment Refund](/doc/refunds.md#get-payment-refund)

## List Payment Refunds

Retrieves a list of refunds for the account making the request.

Max results per page: 100

```ruby
def list_payment_refunds(begin_time: nil,
                         end_time: nil,
                         sort_order: nil,
                         cursor: nil,
                         location_id: nil,
                         status: nil,
                         source_type: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Query, Optional | Timestamp for the beginning of the requested reporting period, in RFC 3339 format.<br><br>Default: The current time minus one year. |
| `end_time` | `String` | Query, Optional | Timestamp for the end of the requested reporting period, in RFC 3339 format.<br><br>Default: The current time. |
| `sort_order` | `String` | Query, Optional | The order in which results are listed.<br>- `ASC` - oldest to newest<br>- `DESC` - newest to oldest (default). |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information. |
| `location_id` | `String` | Query, Optional | Limit results to the location supplied. By default, results are returned<br>for all locations associated with the merchant. |
| `status` | `String` | Query, Optional | If provided, only refunds with the given status are returned.<br>For a list of refund status values, see [PaymentRefund](#type-paymentrefund).<br><br>Default: If omitted refunds are returned regardless of status. |
| `source_type` | `String` | Query, Optional | If provided, only refunds with the given source type are returned.<br>- `CARD` - List refunds only for payments where card was specified as payment<br>source.<br><br>Default: If omitted refunds are returned regardless of source type. |

### Response Type

[`List Payment Refunds Response Hash`](/doc/models/list-payment-refunds-response.md)

### Example Usage

```ruby
begin_time = 'begin_time2'
end_time = 'end_time2'
sort_order = 'sort_order0'
cursor = 'cursor6'
location_id = 'location_id4'
status = 'status8'
source_type = 'source_type0'

result = refunds_api.list_payment_refunds(begin_time: begin_time, end_time: end_time, sort_order: sort_order, cursor: cursor, location_id: location_id, status: status, source_type: source_type)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Refund Payment

Refunds a payment. You can refund the entire payment amount or a 
portion of it. For more information, see 
[Payments and Refunds Overview](https://developer.squareup.com/docs/payments-api/overview).

```ruby
def refund_payment(body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Refund Payment Request Hash`](/doc/models/refund-payment-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Refund Payment Response Hash`](/doc/models/refund-payment-response.md)

### Example Usage

```ruby
body = {}
body[:idempotency_key] = 'a7e36d40-d24b-11e8-b568-0800200c9a66'
body[:amount_money] = {}
body[:amount_money][:amount] = 100
body[:amount_money][:currency] = 'USD'
body[:app_fee_money] = {}
body[:app_fee_money][:amount] = 114
body[:app_fee_money][:currency] = 'GEL'
body[:payment_id] = 'UNOE3kv2BZwqHlJ830RCt5YCuaB'
body[:reason] = 'reason8'

result = refunds_api.refund_payment(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Get Payment Refund

Retrieves a specific `Refund` using the `refund_id`.

```ruby
def get_payment_refund(refund_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `refund_id` | `String` | Template, Required | Unique ID for the desired `PaymentRefund`. |

### Response Type

[`Get Payment Refund Response Hash`](/doc/models/get-payment-refund-response.md)

### Example Usage

```ruby
refund_id = 'refund_id4'

result = refunds_api.get_payment_refund(refund_id: refund_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

