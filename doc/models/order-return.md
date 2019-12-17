## Order Return

The set of line items, service charges, taxes, discounts, tips, etc. being returned in an Order.

### Structure

`OrderReturn`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return only within this order. |
| `source_order_id` | `String` | Optional | Order which contains the original sale of these returned line items. This will be unset<br>for unlinked returns. |
| `return_line_items` | [`Array<Order Return Line Item Hash>`]($m/OrderReturnLineItem) | Optional | Collection of line items which are being returned. |
| `return_service_charges` | [`Array<Order Return Service Charge Hash>`]($m/OrderReturnServiceCharge) | Optional | Collection of service charges which are being returned. |
| `return_taxes` | [`Array<Order Return Tax Hash>`]($m/OrderReturnTax) | Optional | Collection of references to taxes being returned for an order, including the total<br>applied tax amount to be returned. The taxes must reference a top-level tax ID from the source<br>order. |
| `return_discounts` | [`Array<Order Return Discount Hash>`]($m/OrderReturnDiscount) | Optional | Collection of references to discounts being returned for an order, including the total<br>applied discount amount to be returned. The discounts must reference a top-level discount ID<br>from the source order. |
| `rounding_adjustment` | [`Order Rounding Adjustment Hash`]($m/OrderRoundingAdjustment) | Optional | A rounding adjustment of the money being returned. Commonly used to apply Cash Rounding<br>when the minimum unit of account is smaller than the lowest physical denomination of currency. |
| `return_amounts` | [`Order Money Amounts Hash`]($m/OrderMoneyAmounts) | Optional | A collection of various money amounts. |

### Example (as JSON)

```json
{
  "uid": null,
  "source_order_id": null,
  "return_line_items": null,
  "return_service_charges": null,
  "return_taxes": null,
  "return_discounts": null,
  "rounding_adjustment": null,
  "return_amounts": null
}
```

