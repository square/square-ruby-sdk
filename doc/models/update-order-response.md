## Update Order Response

Defines the fields that are included in the response body of
a request to the [UpdateOrder](/doc/orders.md#updateorder) endpoint.

### Structure

`UpdateOrderResponse`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`Order Hash`](/doc/models/order.md) | Optional | Contains all information related to a single order to process with Square,<br>including line items that specify the products to purchase. Order objects also<br>include information on any associated tenders, refunds, and returns.<br><br>All Connect V2 Transactions have all been converted to Orders including all associated<br>itemization data. |
| `errors` | [`Array<Error Hash>`](/doc/models/error.md) | Optional | Any errors that occurred during the request. |

### Example (as JSON)

```json
{
  "order": null,
  "errors": null
}
```

