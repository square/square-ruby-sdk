# Payouts

```ruby
payouts_api = client.payouts
```

## Class Name

`PayoutsApi`

## Methods

* [List Payouts](../../doc/api/payouts.md#list-payouts)
* [Get Payout](../../doc/api/payouts.md#get-payout)
* [List Payout Entries](../../doc/api/payouts.md#list-payout-entries)


# List Payouts

Retrieves a list of all payouts for the default location.
You can filter payouts by location ID, status, time range, and order them in ascending or descending order.
To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.

```ruby
def list_payouts(location_id: nil,
                 status: nil,
                 begin_time: nil,
                 end_time: nil,
                 sort_order: nil,
                 cursor: nil,
                 limit: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Query, Optional | The ID of the location for which to list the payouts.<br>By default, payouts are returned for the default (main) location associated with the seller. |
| `status` | [`String (Payout Status)`](../../doc/models/payout-status.md) | Query, Optional | If provided, only payouts with the given status are returned. |
| `begin_time` | `String` | Query, Optional | The timestamp for the beginning of the payout creation time, in RFC 3339 format.<br>Inclusive. Default: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The timestamp for the end of the payout creation time, in RFC 3339 format.<br>Default: The current time. |
| `sort_order` | [`String (Sort Order)`](../../doc/models/sort-order.md) | Query, Optional | The order in which payouts are listed. |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for the original query.<br>For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).<br>If request parameters change between requests, subsequent results may contain duplicates or missing records. |
| `limit` | `Integer` | Query, Optional | The maximum number of results to be returned in a single page.<br>It is possible to receive fewer results than the specified limit on a given page.<br>The default value of 100 is also the maximum allowed value. If the provided value is<br>greater than 100, it is ignored and the default value is used instead.<br>Default: `100` |

## Response Type

[`List Payouts Response Hash`](../../doc/models/list-payouts-response.md)

## Example Usage

```ruby
location_id = 'location_id4'
status = 'PAID'
begin_time = 'begin_time2'
end_time = 'end_time2'
sort_order = 'DESC'
cursor = 'cursor6'
limit = 172

result = payouts_api.list_payouts(location_id: location_id, status: status, begin_time: begin_time, end_time: end_time, sort_order: sort_order, cursor: cursor, limit: limit)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Payout

Retrieves details of a specific payout identified by a payout ID.
To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.

```ruby
def get_payout(payout_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payout_id` | `String` | Template, Required | The ID of the payout to retrieve the information for. |

## Response Type

[`Get Payout Response Hash`](../../doc/models/get-payout-response.md)

## Example Usage

```ruby
payout_id = 'payout_id6'

result = payouts_api.get_payout(payout_id: payout_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Payout Entries

Retrieves a list of all payout entries for a specific payout.
To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.

```ruby
def list_payout_entries(payout_id:,
                        sort_order: nil,
                        cursor: nil,
                        limit: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payout_id` | `String` | Template, Required | The ID of the payout to retrieve the information for. |
| `sort_order` | [`String (Sort Order)`](../../doc/models/sort-order.md) | Query, Optional | The order in which payout entries are listed. |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for the original query.<br>For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).<br>If request parameters change between requests, subsequent results may contain duplicates or missing records. |
| `limit` | `Integer` | Query, Optional | The maximum number of results to be returned in a single page.<br>It is possible to receive fewer results than the specified limit on a given page.<br>The default value of 100 is also the maximum allowed value. If the provided value is<br>greater than 100, it is ignored and the default value is used instead.<br>Default: `100` |

## Response Type

[`List Payout Entries Response Hash`](../../doc/models/list-payout-entries-response.md)

## Example Usage

```ruby
payout_id = 'payout_id6'
sort_order = 'DESC'
cursor = 'cursor6'
limit = 172

result = payouts_api.list_payout_entries(payout_id: payout_id, sort_order: sort_order, cursor: cursor, limit: limit)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

