## Order Fulfillment

Contains details on how to fulfill this order.

### Structure

`OrderFulfillment`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the fulfillment only within this order. |
| `type` | [`String (Order Fulfillment Type)`](/doc/models/order-fulfillment-type.md) | Optional | The type of fulfillment. |
| `state` | [`String (Order Fulfillment State)`](/doc/models/order-fulfillment-state.md) | Optional | The state of the fulfillment. |
| `pickup_details` | [`Order Fulfillment Pickup Details Hash`](/doc/models/order-fulfillment-pickup-details.md) | Optional | Contains details necessary to fulfill a pickup order. |
| `shipment_details` | [`Order Fulfillment Shipment Details Hash`](/doc/models/order-fulfillment-shipment-details.md) | Optional | - |

### Example (as JSON)

```json
{
  "uid": null,
  "type": null,
  "state": null,
  "pickup_details": null,
  "shipment_details": null
}
```

