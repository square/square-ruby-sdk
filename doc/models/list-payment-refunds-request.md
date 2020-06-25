## List Payment Refunds Request

Retrieves a list of refunds for the account making the request.

Max results per page: 100

### Structure

`ListPaymentRefundsRequest`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Optional | Timestamp for the beginning of the requested reporting period, in RFC 3339 format.<br><br>Default: The current time minus one year. |
| `end_time` | `String` | Optional | Timestamp for the end of the requested reporting period, in RFC 3339 format.<br><br>Default: The current time. |
| `sort_order` | `String` | Optional | The order in which results are listed.<br>- `ASC` - oldest to newest<br>- `DESC` - newest to oldest (default). |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information. |
| `location_id` | `String` | Optional | Limit results to the location supplied. By default, results are returned<br>for all locations associated with the merchant. |
| `status` | `String` | Optional | If provided, only refunds with the given status are returned.<br>For a list of refund status values, see [PaymentRefund](#type-paymentrefund).<br><br>Default: If omitted refunds are returned regardless of status. |
| `source_type` | `String` | Optional | If provided, only refunds with the given source type are returned.<br>- `CARD` - List refunds only for payments where card was specified as payment<br>source.<br><br>Default: If omitted refunds are returned regardless of source type. |

### Example (as JSON)

```json
{}
```

