# V1 Transactions

```ruby
v1_transactions_api = client.v1_transactions
```

## Class Name

`V1TransactionsApi`

## Methods

* [List Bank Accounts](/doc/v1-transactions.md#list-bank-accounts)
* [Retrieve Bank Account](/doc/v1-transactions.md#retrieve-bank-account)
* [List Orders](/doc/v1-transactions.md#list-orders)
* [Retrieve Order](/doc/v1-transactions.md#retrieve-order)
* [Update Order](/doc/v1-transactions.md#update-order)
* [List Payments](/doc/v1-transactions.md#list-payments)
* [Retrieve Payment](/doc/v1-transactions.md#retrieve-payment)
* [List Refunds](/doc/v1-transactions.md#list-refunds)
* [Create Refund](/doc/v1-transactions.md#create-refund)
* [List Settlements](/doc/v1-transactions.md#list-settlements)
* [Retrieve Settlement](/doc/v1-transactions.md#retrieve-settlement)

## List Bank Accounts

Provides non-confidential details for all of a location's associated bank accounts. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.

```ruby
def list_bank_accounts(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list bank accounts for. |

### Response Type

[`Array<V1 Bank Account Hash>`](/doc/models/v1-bank-account.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_transactions_api.list_bank_accounts(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Bank Account

Provides non-confidential details for a merchant's associated bank account. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.

```ruby
def retrieve_bank_account(location_id:,
                          bank_account_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the bank account's associated location. |
| `bank_account_id` | `String` | Template, Required | The bank account's Square-issued ID. You obtain this value from Settlement objects returned. |

### Response Type

[`V1 Bank Account Hash`](/doc/models/v1-bank-account.md)

### Example Usage

```ruby
location_id = 'location_id4'
bank_account_id = 'bank_account_id0'

result = v1_transactions_api.retrieve_bank_account(location_id: location_id, bank_account_id: bank_account_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Orders

Provides summary information for a merchant's online store orders.

```ruby
def list_orders(location_id:,
                order: nil,
                limit: nil,
                batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list online store orders for. |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | TThe order in which payments are listed in the response. |
| `limit` | `Integer` | Query, Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Order Hash>`](/doc/models/v1-order.md)

### Example Usage

```ruby
location_id = 'location_id4'
order = 'DESC'
limit = 172
batch_token = 'batch_token2'

result = v1_transactions_api.list_orders(location_id: location_id, order: order, limit: limit, batch_token: batch_token)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Order

Provides comprehensive information for a single online store order, including the order's history.

```ruby
def retrieve_order(location_id:,
                   order_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the order's associated location. |
| `order_id` | `String` | Template, Required | The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint |

### Response Type

[`V1 Order Hash`](/doc/models/v1-order.md)

### Example Usage

```ruby
location_id = 'location_id4'
order_id = 'order_id6'

result = v1_transactions_api.retrieve_order(location_id: location_id, order_id: order_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Order

Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:

```ruby
def update_order(location_id:,
                 order_id:,
                 body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the order's associated location. |
| `order_id` | `String` | Template, Required | The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint |
| `body` | [`V1 Update Order Request Hash`](/doc/models/v1-update-order-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Order Hash`](/doc/models/v1-order.md)

### Example Usage

```ruby
location_id = 'location_id4'
order_id = 'order_id6'
body = {}
body[:action] = 'REFUND'
body[:shipped_tracking_number] = 'shipped_tracking_number6'
body[:completed_note] = 'completed_note6'
body[:refunded_note] = 'refunded_note0'
body[:canceled_note] = 'canceled_note4'

result = v1_transactions_api.update_order(location_id: location_id, order_id: order_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Payments

Provides summary information for all payments taken for a given
Square account during a date range. Date ranges cannot exceed 1 year in
length. See Date ranges for details of inclusive and exclusive dates.

*Note**: Details for payments processed with Square Point of Sale while
in offline mode may not be transmitted to Square for up to 72 hours.
Offline payments have a `created_at` value that reflects the time the
payment was originally processed, not the time it was subsequently
transmitted to Square. Consequently, the ListPayments endpoint might
list an offline payment chronologically between online payments that
were seen in a previous request.

```ruby
def list_payments(location_id:,
                  order: nil,
                  begin_time: nil,
                  end_time: nil,
                  limit: nil,
                  batch_token: nil,
                  include_partial: false)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list payments for. If you specify me, this endpoint returns payments aggregated from all of the business's locations. |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which payments are listed in the response. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Query, Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |
| `include_partial` | `Boolean` | Query, Optional | Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed. |

### Response Type

[`Array<V1 Payment Hash>`](/doc/models/v1-payment.md)

### Example Usage

```ruby
location_id = 'location_id4'
order = 'DESC'
begin_time = 'begin_time2'
end_time = 'end_time2'
limit = 172
batch_token = 'batch_token2'
include_partial = false

result = v1_transactions_api.list_payments(location_id: location_id, order: order, begin_time: begin_time, end_time: end_time, limit: limit, batch_token: batch_token, include_partial: include_partial)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Payment

Provides comprehensive information for a single payment.

```ruby
def retrieve_payment(location_id:,
                     payment_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the payment's associated location. |
| `payment_id` | `String` | Template, Required | The Square-issued payment ID. payment_id comes from Payment objects returned by the List Payments endpoint, Settlement objects returned by the List Settlements endpoint, or Refund objects returned by the List Refunds endpoint. |

### Response Type

[`V1 Payment Hash`](/doc/models/v1-payment.md)

### Example Usage

```ruby
location_id = 'location_id4'
payment_id = 'payment_id0'

result = v1_transactions_api.retrieve_payment(location_id: location_id, payment_id: payment_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Refunds

Provides the details for all refunds initiated by a merchant or any of the merchant's mobile staff during a date range. Date ranges cannot exceed one year in length.

```ruby
def list_refunds(location_id:,
                 order: nil,
                 begin_time: nil,
                 end_time: nil,
                 limit: nil,
                 batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list refunds for. |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | TThe order in which payments are listed in the response. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Query, Optional | The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Refund Hash>`](/doc/models/v1-refund.md)

### Example Usage

```ruby
location_id = 'location_id4'
order = 'DESC'
begin_time = 'begin_time2'
end_time = 'end_time2'
limit = 172
batch_token = 'batch_token2'

result = v1_transactions_api.list_refunds(location_id: location_id, order: order, begin_time: begin_time, end_time: end_time, limit: limit, batch_token: batch_token)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Refund

Issues a refund for a previously processed payment. You must issue
a refund within 60 days of the associated payment.

You cannot issue a partial refund for a split tender payment. You must
instead issue a full or partial refund for a particular tender, by
providing the applicable tender id to the V1CreateRefund endpoint.
Issuing a full refund for a split tender payment refunds all tenders
associated with the payment.

Issuing a refund for a card payment is not reversible. For development
purposes, you can create fake cash payments in Square Point of Sale and
refund them.

```ruby
def create_refund(location_id:,
                  body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the original payment's associated location. |
| `body` | [`V1 Create Refund Request Hash`](/doc/models/v1-create-refund-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Refund Hash`](/doc/models/v1-refund.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}
body[:payment_id] = 'payment_id6'
body[:type] = 'FULL'
body[:reason] = 'reason8'
body[:refunded_money] = {}
body[:refunded_money][:amount] = 222
body[:refunded_money][:currency_code] = 'CLF'
body[:request_idempotence_key] = 'request_idempotence_key2'

result = v1_transactions_api.create_refund(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Settlements

Provides summary information for all deposits and withdrawals
initiated by Square to a linked bank account during a date range. Date
ranges cannot exceed one year in length.

*Note**: the ListSettlements endpoint does not provide entry
information.

```ruby
def list_settlements(location_id:,
                     order: nil,
                     begin_time: nil,
                     end_time: nil,
                     limit: nil,
                     status: nil,
                     batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list settlements for. If you specify me, this endpoint returns settlements aggregated from all of the business's locations. |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which settlements are listed in the response. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Query, Optional | The maximum number of settlements to return in a single response. This value cannot exceed 200. |
| `status` | [`String (V1 List Settlements Request Status)`](/doc/models/v1-list-settlements-request-status.md) | Query, Optional | Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED). |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Settlement Hash>`](/doc/models/v1-settlement.md)

### Example Usage

```ruby
location_id = 'location_id4'
order = 'DESC'
begin_time = 'begin_time2'
end_time = 'end_time2'
limit = 172
status = 'SENT'
batch_token = 'batch_token2'

result = v1_transactions_api.list_settlements(location_id: location_id, order: order, begin_time: begin_time, end_time: end_time, limit: limit, status: status, batch_token: batch_token)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Settlement

Provides comprehensive information for a single settlement.

The returned `Settlement` objects include an `entries` field that lists
the transactions that contribute to the settlement total. Most
settlement entries correspond to a payment payout, but settlement
entries are also generated for less common events, like refunds, manual
adjustments, or chargeback holds.

Square initiates its regular deposits as indicated in the
[Deposit Options with Square](https://squareup.com/help/us/en/article/3807)
help article. Details for a regular deposit are usually not available
from Connect API endpoints before 10 p.m. PST the same day.

Square does not know when an initiated settlement **completes**, only
whether it has failed. A completed settlement is typically reflected in
a bank account within 3 business days, but in exceptional cases it may
take longer.

```ruby
def retrieve_settlement(location_id:,
                        settlement_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the settlements's associated location. |
| `settlement_id` | `String` | Template, Required | The settlement's Square-issued ID. You obtain this value from Settlement objects returned by the List Settlements endpoint. |

### Response Type

[`V1 Settlement Hash`](/doc/models/v1-settlement.md)

### Example Usage

```ruby
location_id = 'location_id4'
settlement_id = 'settlement_id0'

result = v1_transactions_api.retrieve_settlement(location_id: location_id, settlement_id: settlement_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

