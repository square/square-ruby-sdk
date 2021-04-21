
# List Transactions Request

Defines the query parameters that can be included in
a request to the [ListTransactions](/doc/api/transactions.md#list-transactions) endpoint.

Deprecated - recommend using [SearchOrders](/doc/api/orders.md#search-orders)

## Structure

`List Transactions Request`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. |

## Example (as JSON)

```json
{
  "begin_time": "begin_time2",
  "end_time": "end_time2",
  "sort_order": "DESC",
  "cursor": "cursor6"
}
```

