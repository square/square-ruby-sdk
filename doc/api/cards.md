# Cards

```ruby
cards_api = client.cards
```

## Class Name

`CardsApi`

## Methods

* [List Cards](../../doc/api/cards.md#list-cards)
* [Create Card](../../doc/api/cards.md#create-card)
* [Retrieve Card](../../doc/api/cards.md#retrieve-card)
* [Disable Card](../../doc/api/cards.md#disable-card)


# List Cards

Retrieves a list of cards owned by the account making the request.
A max of 25 cards will be returned.

```ruby
def list_cards(cursor: nil,
               customer_id: nil,
               include_disabled: false,
               reference_id: nil,
               sort_order: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](../../https://developer.squareup.com/docs/basics/api101/pagination) for more information. |
| `customer_id` | `String` | Query, Optional | Limit results to cards associated with the customer supplied.<br>By default, all cards owned by the merchant are returned. |
| `include_disabled` | `Boolean` | Query, Optional | Includes disabled cards.<br>By default, all enabled cards owned by the merchant are returned.<br>**Default**: `false` |
| `reference_id` | `String` | Query, Optional | Limit results to cards associated with the reference_id supplied. |
| `sort_order` | [`String (Sort Order)`](../../doc/models/sort-order.md) | Query, Optional | Sorts the returned list by when the card was created with the specified order.<br>This field defaults to ASC. |

## Response Type

[`List Cards Response Hash`](../../doc/models/list-cards-response.md)

## Example Usage

```ruby
cursor = 'cursor6'
customer_id = 'customer_id8'
include_disabled = false
reference_id = 'reference_id2'
sort_order = 'DESC'

result = cards_api.list_cards(cursor: cursor, customer_id: customer_id, include_disabled: include_disabled, reference_id: reference_id, sort_order: sort_order)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Card

Adds a card on file to an existing merchant.

```ruby
def create_card(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Card Request Hash`](../../doc/models/create-card-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Card Response Hash`](../../doc/models/create-card-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = '4935a656-a929-4792-b97c-8848be85c27c'
body[:source_id] = 'cnon:uIbfJXhXETSP197M3GB'
body[:verification_token] = 'verification_token0'
body[:card] = {}
body[:card][:id] = 'id0'
body[:card][:card_brand] = 'INTERAC'
body[:card][:last_4] = 'last_42'
body[:card][:exp_month] = 236
body[:card][:exp_year] = 60
body[:card][:cardholder_name] = 'Amelia Earhart'
body[:card][:billing_address] = {}
body[:card][:billing_address][:address_line_1] = '500 Electric Ave'
body[:card][:billing_address][:address_line_2] = 'Suite 600'
body[:card][:billing_address][:address_line_3] = 'address_line_34'
body[:card][:billing_address][:locality] = 'New York'
body[:card][:billing_address][:sublocality] = 'sublocality8'
body[:card][:billing_address][:administrative_district_level_1] = 'NY'
body[:card][:billing_address][:postal_code] = '10003'
body[:card][:billing_address][:country] = 'US'
body[:card][:customer_id] = 'VDKXEEKPJN48QDG3BGGFAK05P8'
body[:card][:reference_id] = 'user-id-1'

result = cards_api.create_card(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Card

Retrieves details for a specific Card.

```ruby
def retrieve_card(card_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `card_id` | `String` | Template, Required | Unique ID for the desired Card. |

## Response Type

[`Retrieve Card Response Hash`](../../doc/models/retrieve-card-response.md)

## Example Usage

```ruby
card_id = 'card_id4'

result = cards_api.retrieve_card(card_id: card_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Disable Card

Disables the card, preventing any further updates or charges.
Disabling an already disabled card is allowed but has no effect.

```ruby
def disable_card(card_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `card_id` | `String` | Template, Required | Unique ID for the desired Card. |

## Response Type

[`Disable Card Response Hash`](../../doc/models/disable-card-response.md)

## Example Usage

```ruby
card_id = 'card_id4'

result = cards_api.disable_card(card_id: card_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

