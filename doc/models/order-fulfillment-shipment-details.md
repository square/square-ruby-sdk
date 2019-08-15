## Order Fulfillment Shipment Details

### Structure

`OrderFulfillmentShipmentDetails`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `recipient` | [`Order Fulfillment Recipient Hash`](/doc/models/order-fulfillment-recipient.md) | Optional | The recipient of a fulfillment. |
| `carrier` | `String` | Optional | The shipping carrier.<br>e.g. UPS, FedEx, USPS, etc. |
| `shipping_note` | `String` | Optional | A note from the merchant or the buyer with additional information for the carrier. |
| `shipping_type` | `String` | Optional | A description of the class or type of shipping product purchased from the carrier.<br>e.g. Regular, Express |
| `tracking_number` | `String` | Optional | The reference number for the shipment provided by the carrier. |
| `tracking_url` | `String` | Optional | A link to the tracking webpage on the carrier's website. |
| `placed_at` | `String` | Optional | The date the shipment was requested. |
| `in_progress_at` | `String` | Optional | The date the shipment started being prepared. |
| `packaged_at` | `String` | Optional | The date the shipment was packaged. |
| `expected_shipped_at` | `String` | Optional | The expected shipment date. |
| `shipped_at` | `String` | Optional | The date the shipment was given to the carrier. |
| `canceled_at` | `String` | Optional | The date the shipment was canceled by either the merchant or the buyer. |
| `cancel_reason` | `String` | Optional | A description of why the shipment was canceled. |
| `failed_at` | `String` | Optional | The date the shipment failed to be completed. |
| `failure_reason` | `String` | Optional | A description of why the shipment failed to be completed. |

### Example (as JSON)

```json
{
  "recipient": null,
  "carrier": null,
  "shipping_note": null,
  "shipping_type": null,
  "tracking_number": null,
  "tracking_url": null,
  "placed_at": null,
  "in_progress_at": null,
  "packaged_at": null,
  "expected_shipped_at": null,
  "shipped_at": null,
  "canceled_at": null,
  "cancel_reason": null,
  "failed_at": null,
  "failure_reason": null
}
```

