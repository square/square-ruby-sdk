# V1 Items

```ruby
v1_items_api = client.v1_items
```

## Class Name

`V1ItemsApi`

## Methods

* [List Categories](/doc/v1-items.md#list-categories)
* [Create Category](/doc/v1-items.md#create-category)
* [Delete Category](/doc/v1-items.md#delete-category)
* [Update Category](/doc/v1-items.md#update-category)
* [List Discounts](/doc/v1-items.md#list-discounts)
* [Create Discount](/doc/v1-items.md#create-discount)
* [Delete Discount](/doc/v1-items.md#delete-discount)
* [Update Discount](/doc/v1-items.md#update-discount)
* [List Fees](/doc/v1-items.md#list-fees)
* [Create Fee](/doc/v1-items.md#create-fee)
* [Delete Fee](/doc/v1-items.md#delete-fee)
* [Update Fee](/doc/v1-items.md#update-fee)
* [List Inventory](/doc/v1-items.md#list-inventory)
* [Adjust Inventory](/doc/v1-items.md#adjust-inventory)
* [List Items](/doc/v1-items.md#list-items)
* [Create Item](/doc/v1-items.md#create-item)
* [Delete Item](/doc/v1-items.md#delete-item)
* [Retrieve Item](/doc/v1-items.md#retrieve-item)
* [Update Item](/doc/v1-items.md#update-item)
* [Remove Fee](/doc/v1-items.md#remove-fee)
* [Apply Fee](/doc/v1-items.md#apply-fee)
* [Remove Modifier List](/doc/v1-items.md#remove-modifier-list)
* [Apply Modifier List](/doc/v1-items.md#apply-modifier-list)
* [Create Variation](/doc/v1-items.md#create-variation)
* [Delete Variation](/doc/v1-items.md#delete-variation)
* [Update Variation](/doc/v1-items.md#update-variation)
* [List Modifier Lists](/doc/v1-items.md#list-modifier-lists)
* [Create Modifier List](/doc/v1-items.md#create-modifier-list)
* [Delete Modifier List](/doc/v1-items.md#delete-modifier-list)
* [Retrieve Modifier List](/doc/v1-items.md#retrieve-modifier-list)
* [Update Modifier List](/doc/v1-items.md#update-modifier-list)
* [Create Modifier Option](/doc/v1-items.md#create-modifier-option)
* [Delete Modifier Option](/doc/v1-items.md#delete-modifier-option)
* [Update Modifier Option](/doc/v1-items.md#update-modifier-option)
* [List Pages](/doc/v1-items.md#list-pages)
* [Create Page](/doc/v1-items.md#create-page)
* [Delete Page](/doc/v1-items.md#delete-page)
* [Update Page](/doc/v1-items.md#update-page)
* [Delete Page Cell](/doc/v1-items.md#delete-page-cell)
* [Update Page Cell](/doc/v1-items.md#update-page-cell)

## List Categories

Lists all the item categories for a given location.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_categories(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list categories for. |

### Response Type

[`Array<V1 Category Hash>`](/doc/models/v1-category.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_categories(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Category

Creates an item category.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_category(location_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Category Hash`](/doc/models/v1-category.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Category Hash`](/doc/models/v1-category.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_category(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Category

Deletes an existing item category.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteCategory__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteCategoryRequest` object
as documented below.

```ruby
def delete_category(location_id:,
                    category_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `category_id` | `String` | Template, Required | The ID of the category to delete. |

### Response Type

[`V1 Category Hash`](/doc/models/v1-category.md)

### Example Usage

```ruby
location_id = 'location_id4'
category_id = 'category_id8'

result = v1_items_api.delete_category(location_id: location_id, category_id: category_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Category

Modifies the details of an existing item category.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_category(location_id:,
                    category_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the category's associated location. |
| `category_id` | `String` | Template, Required | The ID of the category to edit. |
| `body` | [`V1 Category Hash`](/doc/models/v1-category.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Category Hash`](/doc/models/v1-category.md)

### Example Usage

```ruby
location_id = 'location_id4'
category_id = 'category_id8'
body = {}

result = v1_items_api.update_category(location_id: location_id, category_id: category_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Discounts

Lists all the discounts for a given location.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_discounts(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list categories for. |

### Response Type

[`Array<V1 Discount Hash>`](/doc/models/v1-discount.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_discounts(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Discount

Creates a discount.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_discount(location_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Discount Hash`](/doc/models/v1-discount.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Discount Hash`](/doc/models/v1-discount.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_discount(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Discount

Deletes an existing discount.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteDiscount__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteDiscountRequest` object
as documented below.

```ruby
def delete_discount(location_id:,
                    discount_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `discount_id` | `String` | Template, Required | The ID of the discount to delete. |

### Response Type

[`V1 Discount Hash`](/doc/models/v1-discount.md)

### Example Usage

```ruby
location_id = 'location_id4'
discount_id = 'discount_id8'

result = v1_items_api.delete_discount(location_id: location_id, discount_id: discount_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Discount

Modifies the details of an existing discount.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_discount(location_id:,
                    discount_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the category's associated location. |
| `discount_id` | `String` | Template, Required | The ID of the discount to edit. |
| `body` | [`V1 Discount Hash`](/doc/models/v1-discount.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Discount Hash`](/doc/models/v1-discount.md)

### Example Usage

```ruby
location_id = 'location_id4'
discount_id = 'discount_id8'
body = {}

result = v1_items_api.update_discount(location_id: location_id, discount_id: discount_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Fees

Lists all the fees (taxes) for a given location.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_fees(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list fees for. |

### Response Type

[`Array<V1 Fee Hash>`](/doc/models/v1-fee.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_fees(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Fee

Creates a fee (tax).

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_fee(location_id:,
               body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create a fee for. |
| `body` | [`V1 Fee Hash`](/doc/models/v1-fee.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Fee Hash`](/doc/models/v1-fee.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_fee(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Fee

Deletes an existing fee (tax).

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteFee__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteFeeRequest` object
as documented below.

```ruby
def delete_fee(location_id:,
               fee_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `fee_id` | `String` | Template, Required | The ID of the fee to delete. |

### Response Type

[`V1 Fee Hash`](/doc/models/v1-fee.md)

### Example Usage

```ruby
location_id = 'location_id4'
fee_id = 'fee_id8'

result = v1_items_api.delete_fee(location_id: location_id, fee_id: fee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Fee

Modifies the details of an existing fee (tax).

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_fee(location_id:,
               fee_id:,
               body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `fee_id` | `String` | Template, Required | The ID of the fee to edit. |
| `body` | [`V1 Fee Hash`](/doc/models/v1-fee.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Fee Hash`](/doc/models/v1-fee.md)

### Example Usage

```ruby
location_id = 'location_id4'
fee_id = 'fee_id8'
body = {}

result = v1_items_api.update_fee(location_id: location_id, fee_id: fee_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Inventory

Provides inventory information for all inventory-enabled item
variations.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_inventory(location_id:,
                   limit: nil,
                   batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `limit` | `Integer` | Query, Optional | The maximum number of inventory entries to return in a single response. This value cannot exceed 1000. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Inventory Entry Hash>`](/doc/models/v1-inventory-entry.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_inventory(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Adjust Inventory

Adjusts the current available inventory of an item variation.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def adjust_inventory(location_id:,
                     variation_id:,
                     body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `variation_id` | `String` | Template, Required | The ID of the variation to adjust inventory information for. |
| `body` | [`V1 Adjust Inventory Request Hash`](/doc/models/v1-adjust-inventory-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Inventory Entry Hash`](/doc/models/v1-inventory-entry.md)

### Example Usage

```ruby
location_id = 'location_id4'
variation_id = 'variation_id2'
body = {}

result = v1_items_api.adjust_inventory(location_id: location_id, variation_id: variation_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Items

Provides summary information of all items for a given location.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_items(location_id:,
               batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list items for. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Item Hash>`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_items(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Item

Creates an item and at least one variation for it.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---


Item-related entities include fields you can use to associate them with
entities in a non-Square system.

When you create an item-related entity, you can optionally specify `id`.
This value must be unique among all IDs ever specified for the account,
including those specified by other applications. You can never reuse an
entity ID. If you do not specify an ID, Square generates one for the entity.

Item variations have a `user_data` string that lets you associate arbitrary
metadata with the variation. The string cannot exceed 255 characters.

```ruby
def create_item(location_id:,
                body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Item Hash`](/doc/models/v1-item.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_item(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Item

Deletes an existing item and all item variations associated with it.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteItem__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteItemRequest` object
as documented below.

```ruby
def delete_item(location_id:,
                item_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to modify. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'

result = v1_items_api.delete_item(location_id: location_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Item

Provides the details for a single item, including associated modifier
lists and fees.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def retrieve_item(location_id:,
                  item_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The item's ID. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'

result = v1_items_api.retrieve_item(location_id: location_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Item

Modifies the core details of an existing item.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_item(location_id:,
                item_id:,
                body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to modify. |
| `body` | [`V1 Item Hash`](/doc/models/v1-item.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
body = {}

result = v1_items_api.update_item(location_id: location_id, item_id: item_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Remove Fee

Removes a fee assocation from an item so the fee is no longer
automatically applied to the item in Square Point of Sale.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def remove_fee(location_id:,
               item_id:,
               fee_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to add the fee to. |
| `fee_id` | `String` | Template, Required | The ID of the fee to apply. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
fee_id = 'fee_id8'

result = v1_items_api.remove_fee(location_id: location_id, item_id: item_id, fee_id: fee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Apply Fee

Associates a fee with an item so the fee is automatically applied to
the item in Square Point of Sale.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def apply_fee(location_id:,
              item_id:,
              fee_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to add the fee to. |
| `fee_id` | `String` | Template, Required | The ID of the fee to apply. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
fee_id = 'fee_id8'

result = v1_items_api.apply_fee(location_id: location_id, item_id: item_id, fee_id: fee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Remove Modifier List

Removes a modifier list association from an item so the modifier
options from the list can no longer be applied to the item.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def remove_modifier_list(location_id:,
                         modifier_list_id:,
                         item_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to remove. |
| `item_id` | `String` | Template, Required | The ID of the item to remove the modifier list from. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
item_id = 'item_id0'

result = v1_items_api.remove_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Apply Modifier List

Associates a modifier list with an item so the associated modifier
options can be applied to the item.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def apply_modifier_list(location_id:,
                        modifier_list_id:,
                        item_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to apply. |
| `item_id` | `String` | Template, Required | The ID of the item to add the modifier list to. |

### Response Type

[`V1 Item Hash`](/doc/models/v1-item.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
item_id = 'item_id0'

result = v1_items_api.apply_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Variation

Creates an item variation for an existing item.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_variation(location_id:,
                     item_id:,
                     body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The item's ID. |
| `body` | [`V1 Variation Hash`](/doc/models/v1-variation.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Variation Hash`](/doc/models/v1-variation.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
body = {}

result = v1_items_api.create_variation(location_id: location_id, item_id: item_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Variation

Deletes an existing item variation from an item.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteVariation__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteVariationRequest` object
as documented below.

```ruby
def delete_variation(location_id:,
                     item_id:,
                     variation_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to delete. |
| `variation_id` | `String` | Template, Required | The ID of the variation to delete. |

### Response Type

[`V1 Variation Hash`](/doc/models/v1-variation.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
variation_id = 'variation_id2'

result = v1_items_api.delete_variation(location_id: location_id, item_id: item_id, variation_id: variation_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Variation

Modifies the details of an existing item variation.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_variation(location_id:,
                     item_id:,
                     variation_id:,
                     body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to modify. |
| `variation_id` | `String` | Template, Required | The ID of the variation to modify. |
| `body` | [`V1 Variation Hash`](/doc/models/v1-variation.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Variation Hash`](/doc/models/v1-variation.md)

### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
variation_id = 'variation_id2'
body = {}

result = v1_items_api.update_variation(location_id: location_id, item_id: item_id, variation_id: variation_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Modifier Lists

Lists all the modifier lists for a given location.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_modifier_lists(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list modifier lists for. |

### Response Type

[`Array<V1 Modifier List Hash>`](/doc/models/v1-modifier-list.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_modifier_lists(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Modifier List

Creates an item modifier list and at least 1 modifier option for it.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_modifier_list(location_id:,
                         body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create a modifier list for. |
| `body` | [`V1 Modifier List Hash`](/doc/models/v1-modifier-list.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Modifier List Hash`](/doc/models/v1-modifier-list.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_modifier_list(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Modifier List

Deletes an existing item modifier list and all modifier options
associated with it.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteModifierList__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteModifierListRequest` object
as documented below.

```ruby
def delete_modifier_list(location_id:,
                         modifier_list_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to delete. |

### Response Type

[`V1 Modifier List Hash`](/doc/models/v1-modifier-list.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'

result = v1_items_api.delete_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Modifier List

Provides the details for a single modifier list.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def retrieve_modifier_list(location_id:,
                           modifier_list_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The modifier list's ID. |

### Response Type

[`V1 Modifier List Hash`](/doc/models/v1-modifier-list.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'

result = v1_items_api.retrieve_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Modifier List

Modifies the details of an existing item modifier list.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_modifier_list(location_id:,
                         modifier_list_id:,
                         body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `body` | [`V1 Update Modifier List Request Hash`](/doc/models/v1-update-modifier-list-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Modifier List Hash`](/doc/models/v1-modifier-list.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
body = {}

result = v1_items_api.update_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Modifier Option

Creates an item modifier option and adds it to a modifier list.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_modifier_option(location_id:,
                           modifier_list_id:,
                           body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `body` | [`V1 Modifier Option Hash`](/doc/models/v1-modifier-option.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Modifier Option Hash`](/doc/models/v1-modifier-option.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
body = {}

result = v1_items_api.create_modifier_option(location_id: location_id, modifier_list_id: modifier_list_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Modifier Option

Deletes an existing item modifier option from a modifier list.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeleteModifierOption__ returns nothing on success but Connect
SDKs map the empty response to an empty `V1DeleteModifierOptionRequest`
object.

```ruby
def delete_modifier_option(location_id:,
                           modifier_list_id:,
                           modifier_option_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to delete. |
| `modifier_option_id` | `String` | Template, Required | The ID of the modifier list to edit. |

### Response Type

[`V1 Modifier Option Hash`](/doc/models/v1-modifier-option.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
modifier_option_id = 'modifier_option_id6'

result = v1_items_api.delete_modifier_option(location_id: location_id, modifier_list_id: modifier_list_id, modifier_option_id: modifier_option_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Modifier Option

Modifies the details of an existing item modifier option.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_modifier_option(location_id:,
                           modifier_list_id:,
                           modifier_option_id:,
                           body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `modifier_option_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `body` | [`V1 Modifier Option Hash`](/doc/models/v1-modifier-option.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Modifier Option Hash`](/doc/models/v1-modifier-option.md)

### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
modifier_option_id = 'modifier_option_id6'
body = {}

result = v1_items_api.update_modifier_option(location_id: location_id, modifier_list_id: modifier_list_id, modifier_option_id: modifier_option_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Pages

Lists all Favorites pages (in Square Point of Sale) for a given
location.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def list_pages(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list Favorites pages for. |

### Response Type

[`Array<V1 Page Hash>`](/doc/models/v1-page.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_pages(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Page

Creates a Favorites page in Square Point of Sale.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def create_page(location_id:,
                body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Page Hash`](/doc/models/v1-page.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Page Hash`](/doc/models/v1-page.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_page(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Page

Deletes an existing Favorites page and all of its cells.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeletePage__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeletePageRequest` object.

```ruby
def delete_page(location_id:,
                page_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location. |
| `page_id` | `String` | Template, Required | The ID of the page to delete. |

### Response Type

[`V1 Page Hash`](/doc/models/v1-page.md)

### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'

result = v1_items_api.delete_page(location_id: location_id, page_id: page_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Page

Modifies the details of a Favorites page in Square Point of Sale.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_page(location_id:,
                page_id:,
                body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location |
| `page_id` | `String` | Template, Required | The ID of the page to modify. |
| `body` | [`V1 Page Hash`](/doc/models/v1-page.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Page Hash`](/doc/models/v1-page.md)

### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'
body = {}

result = v1_items_api.update_page(location_id: location_id, page_id: page_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Page Cell

Deletes a cell from a Favorites page in Square Point of Sale.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

__DeletePageCell__ returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeletePageCellRequest` object
as documented below.

```ruby
def delete_page_cell(location_id:,
                     page_id:,
                     row: nil,
                     column: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location. |
| `page_id` | `String` | Template, Required | The ID of the page to delete. |
| `row` | `String` | Query, Optional | The row of the cell to clear. Always an integer between 0 and 4, inclusive. Row 0 is the top row. |
| `column` | `String` | Query, Optional | The column of the cell to clear. Always an integer between 0 and 4, inclusive. Column 0 is the leftmost column. |

### Response Type

[`V1 Page Hash`](/doc/models/v1-page.md)

### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'

result = v1_items_api.delete_page_cell(location_id: location_id, page_id: page_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Page Cell

Modifies a cell of a Favorites page in Square Point of Sale.

---

- __Deprecation date__: 2019-11-20
- [__Retirement date__](https://developer.squareup.com/docs/build-basics/api-lifecycle#deprecated): 2020-11-18
- [Migration guide](https://developer.squareup.com/docs/migrate-from-v1/guides/v1-items)

---

```ruby
def update_page_cell(location_id:,
                     page_id:,
                     body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location. |
| `page_id` | `String` | Template, Required | The ID of the page the cell belongs to. |
| `body` | [`V1 Page Cell Hash`](/doc/models/v1-page-cell.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Page Hash`](/doc/models/v1-page.md)

### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'
body = {}

result = v1_items_api.update_page_cell(location_id: location_id, page_id: page_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

