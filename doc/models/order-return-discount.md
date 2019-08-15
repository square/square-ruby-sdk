## Order Return Discount

Represents a discount being returned that applies to one or more return line items in an
order.

Fixed-amount, order-scoped discounts are distributed across all non-zero return line item totals.
The amount distributed to each return line item is relative to that item’s contribution to the
order subtotal.

### Structure

`OrderReturnDiscount`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return discount only within this order. |
| `source_discount_uid` | `String` | Optional | `uid` of the Discount from the Order which contains the original application of this discount. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogDiscount](./models/catalog-discount.md). |
| `name` | `String` | Optional | The discount's name. |
| `type` | [`String (Order Line Item Discount Type)`](/doc/models/order-line-item-discount-type.md) | Optional | Indicates how the discount is applied to the associated line item or order. |
| `percentage` | `String` | Optional | The percentage of the tax, as a string representation of a decimal number.<br>A value of `7.25` corresponds to a percentage of 7.25%.<br><br>The percentage won't be set for an amount-based discount. |
| `amount_money` | [`Money Hash`](/doc/models/money.md) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `applied_money` | [`Money Hash`](/doc/models/money.md) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `scope` | [`String (Order Line Item Discount Scope)`](/doc/models/order-line-item-discount-scope.md) | Optional | Indicates whether this is a line item or order level discount. |

### Example (as JSON)

```json
{
  "uid": null,
  "source_discount_uid": null,
  "catalog_object_id": null,
  "name": null,
  "type": null,
  "percentage": null,
  "amount_money": null,
  "applied_money": null,
  "scope": null
}
```

