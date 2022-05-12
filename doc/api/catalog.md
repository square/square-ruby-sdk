# Catalog

```ruby
catalog_api = client.catalog
```

## Class Name

`CatalogApi`

## Methods

* [Batch Delete Catalog Objects](../../doc/api/catalog.md#batch-delete-catalog-objects)
* [Batch Retrieve Catalog Objects](../../doc/api/catalog.md#batch-retrieve-catalog-objects)
* [Batch Upsert Catalog Objects](../../doc/api/catalog.md#batch-upsert-catalog-objects)
* [Create Catalog Image](../../doc/api/catalog.md#create-catalog-image)
* [Update Catalog Image](../../doc/api/catalog.md#update-catalog-image)
* [Catalog Info](../../doc/api/catalog.md#catalog-info)
* [List Catalog](../../doc/api/catalog.md#list-catalog)
* [Upsert Catalog Object](../../doc/api/catalog.md#upsert-catalog-object)
* [Delete Catalog Object](../../doc/api/catalog.md#delete-catalog-object)
* [Retrieve Catalog Object](../../doc/api/catalog.md#retrieve-catalog-object)
* [Search Catalog Objects](../../doc/api/catalog.md#search-catalog-objects)
* [Search Catalog Items](../../doc/api/catalog.md#search-catalog-items)
* [Update Item Modifier Lists](../../doc/api/catalog.md#update-item-modifier-lists)
* [Update Item Taxes](../../doc/api/catalog.md#update-item-taxes)


# Batch Delete Catalog Objects

Deletes a set of [CatalogItem](../../doc/models/catalog-item.md)s based on the
provided list of target IDs and returns a set of successfully deleted IDs in
the response. Deletion is a cascading event such that all children of the
targeted object are also deleted. For example, deleting a CatalogItem will
also delete all of its [CatalogItemVariation](../../doc/models/catalog-item-variation.md)
children.

`BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted
IDs can be deleted. The response will only include IDs that were
actually deleted.

```ruby
def batch_delete_catalog_objects(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Delete Catalog Objects Request Hash`](../../doc/models/batch-delete-catalog-objects-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Batch Delete Catalog Objects Response Hash`](../../doc/models/batch-delete-catalog-objects-response.md)

## Example Usage

```ruby
body = {}
body[:object_ids] = ['W62UWFY35CWMYGVWK6TWJDNI', 'AA27W3M2GGTF3H6AVPNB77CK']

result = catalog_api.batch_delete_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Batch Retrieve Catalog Objects

Returns a set of objects based on the provided ID.
Each [CatalogItem](../../doc/models/catalog-item.md) returned in the set includes all of its
child information including: all of its
[CatalogItemVariation](../../doc/models/catalog-item-variation.md) objects, references to
its [CatalogModifierList](../../doc/models/catalog-modifier-list.md) objects, and the ids of
any [CatalogTax](../../doc/models/catalog-tax.md) objects that apply to it.

```ruby
def batch_retrieve_catalog_objects(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Retrieve Catalog Objects Request Hash`](../../doc/models/batch-retrieve-catalog-objects-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Batch Retrieve Catalog Objects Response Hash`](../../doc/models/batch-retrieve-catalog-objects-response.md)

## Example Usage

```ruby
body = {}
body[:object_ids] = ['W62UWFY35CWMYGVWK6TWJDNI', 'AA27W3M2GGTF3H6AVPNB77CK']
body[:include_related_objects] = true

result = catalog_api.batch_retrieve_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Batch Upsert Catalog Objects

Creates or updates up to 10,000 target objects based on the provided
list of objects. The target objects are grouped into batches and each batch is
inserted/updated in an all-or-nothing manner. If an object within a batch is
malformed in some way, or violates a database constraint, the entire batch
containing that item will be disregarded. However, other batches in the same
request may still succeed. Each batch may contain up to 1,000 objects, and
batches will be processed in order as long as the total object count for the
request (items, variations, modifier lists, discounts, and taxes) is no more
than 10,000.

```ruby
def batch_upsert_catalog_objects(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Upsert Catalog Objects Request Hash`](../../doc/models/batch-upsert-catalog-objects-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Batch Upsert Catalog Objects Response Hash`](../../doc/models/batch-upsert-catalog-objects-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = '789ff020-f723-43a9-b4b5-43b5dc1fa3dc'
body[:batches] = []


body[:batches][0] = {}
body[:batches][0][:objects] = []


body[:batches][0][:objects][0] = {}
body[:batches][0][:objects][0][:type] = 'ITEM'
body[:batches][0][:objects][0][:id] = '#Tea'
body[:batches][0][:objects][0][:present_at_all_locations] = true
body[:batches][0][:objects][0][:item_data] = {}
body[:batches][0][:objects][0][:item_data][:name] = 'Tea'
body[:batches][0][:objects][0][:item_data][:description] = 'Hot Leaf Juice'
body[:batches][0][:objects][0][:item_data][:category_id] = '#Beverages'
body[:batches][0][:objects][0][:item_data][:tax_ids] = ['#SalesTax']
body[:batches][0][:objects][0][:item_data][:variations] = []


body[:batches][0][:objects][0][:item_data][:variations][0] = {}
body[:batches][0][:objects][0][:item_data][:variations][0][:type] = 'ITEM_VARIATION'
body[:batches][0][:objects][0][:item_data][:variations][0][:id] = '#Tea_Mug'
body[:batches][0][:objects][0][:item_data][:variations][0][:present_at_all_locations] = true
body[:batches][0][:objects][0][:item_data][:variations][0][:item_variation_data] = {}
body[:batches][0][:objects][0][:item_data][:variations][0][:item_variation_data][:item_id] = '#Tea'
body[:batches][0][:objects][0][:item_data][:variations][0][:item_variation_data][:name] = 'Mug'
body[:batches][0][:objects][0][:item_data][:variations][0][:item_variation_data][:pricing_type] = 'FIXED_PRICING'


body[:batches][0][:objects][1] = {}
body[:batches][0][:objects][1][:type] = 'ITEM'
body[:batches][0][:objects][1][:id] = '#Coffee'
body[:batches][0][:objects][1][:present_at_all_locations] = true
body[:batches][0][:objects][1][:item_data] = {}
body[:batches][0][:objects][1][:item_data][:name] = 'Coffee'
body[:batches][0][:objects][1][:item_data][:description] = 'Hot Bean Juice'
body[:batches][0][:objects][1][:item_data][:category_id] = '#Beverages'
body[:batches][0][:objects][1][:item_data][:tax_ids] = ['#SalesTax']
body[:batches][0][:objects][1][:item_data][:variations] = []


body[:batches][0][:objects][1][:item_data][:variations][0] = {}
body[:batches][0][:objects][1][:item_data][:variations][0][:type] = 'ITEM_VARIATION'
body[:batches][0][:objects][1][:item_data][:variations][0][:id] = '#Coffee_Regular'
body[:batches][0][:objects][1][:item_data][:variations][0][:present_at_all_locations] = true
body[:batches][0][:objects][1][:item_data][:variations][0][:item_variation_data] = {}
body[:batches][0][:objects][1][:item_data][:variations][0][:item_variation_data][:item_id] = '#Coffee'
body[:batches][0][:objects][1][:item_data][:variations][0][:item_variation_data][:name] = 'Regular'
body[:batches][0][:objects][1][:item_data][:variations][0][:item_variation_data][:pricing_type] = 'FIXED_PRICING'

body[:batches][0][:objects][1][:item_data][:variations][1] = {}
body[:batches][0][:objects][1][:item_data][:variations][1][:type] = 'ITEM_VARIATION'
body[:batches][0][:objects][1][:item_data][:variations][1][:id] = '#Coffee_Large'
body[:batches][0][:objects][1][:item_data][:variations][1][:present_at_all_locations] = true
body[:batches][0][:objects][1][:item_data][:variations][1][:item_variation_data] = {}
body[:batches][0][:objects][1][:item_data][:variations][1][:item_variation_data][:item_id] = '#Coffee'
body[:batches][0][:objects][1][:item_data][:variations][1][:item_variation_data][:name] = 'Large'
body[:batches][0][:objects][1][:item_data][:variations][1][:item_variation_data][:pricing_type] = 'FIXED_PRICING'


body[:batches][0][:objects][2] = {}
body[:batches][0][:objects][2][:type] = 'CATEGORY'
body[:batches][0][:objects][2][:id] = '#Beverages'
body[:batches][0][:objects][2][:present_at_all_locations] = true
body[:batches][0][:objects][2][:category_data] = {}
body[:batches][0][:objects][2][:category_data][:name] = 'Beverages'

body[:batches][0][:objects][3] = {}
body[:batches][0][:objects][3][:type] = 'TAX'
body[:batches][0][:objects][3][:id] = '#SalesTax'
body[:batches][0][:objects][3][:present_at_all_locations] = true
body[:batches][0][:objects][3][:tax_data] = {}
body[:batches][0][:objects][3][:tax_data][:name] = 'Sales Tax'
body[:batches][0][:objects][3][:tax_data][:calculation_phase] = 'TAX_SUBTOTAL_PHASE'
body[:batches][0][:objects][3][:tax_data][:inclusion_type] = 'ADDITIVE'
body[:batches][0][:objects][3][:tax_data][:percentage] = '5.0'
body[:batches][0][:objects][3][:tax_data][:applies_to_custom_amounts] = true
body[:batches][0][:objects][3][:tax_data][:enabled] = true



result = catalog_api.batch_upsert_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Catalog Image

Uploads an image file to be represented by a [CatalogImage](../../doc/models/catalog-image.md) object that can be linked to an existing
[CatalogObject](../../doc/models/catalog-object.md) instance. The resulting `CatalogImage` is unattached to any `CatalogObject` if the `object_id`
is not specified.

This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in
JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.

```ruby
def create_catalog_image(request: nil,
                         image_file: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `request` | [`Create Catalog Image Request Hash`](../../doc/models/create-catalog-image-request.md) | Form, Optional | - |
| `image_file` | `File \| UploadIO` | Form, Optional | - |

## Response Type

[`Create Catalog Image Response Hash`](../../doc/models/create-catalog-image-response.md)

## Example Usage

```ruby
request = {}
request[:idempotency_key] = '528dea59-7bfb-43c1-bd48-4a6bba7dd61f86'
request[:object_id] = 'ND6EA5AAJEO5WL3JNNIAQA32'
request[:image] = {}
request[:image][:type] = 'IMAGE'
request[:image][:id] = '#TEMP_ID'
request[:image][:image_data] = {}
request[:image][:image_data][:caption] = 'A picture of a cup of coffee'

result = catalog_api.create_catalog_image(request: request, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Catalog Image

Uploads a new image file to replace the existing one in the specified [CatalogImage](../../doc/models/catalog-image.md) object.

This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in
JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.

```ruby
def update_catalog_image(image_id:,
                         request: nil,
                         image_file: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `image_id` | `String` | Template, Required | The ID of the `CatalogImage` object to update the encapsulated image file. |
| `request` | [`Update Catalog Image Request Hash`](../../doc/models/update-catalog-image-request.md) | Form, Optional | - |
| `image_file` | `File \| UploadIO` | Form, Optional | - |

## Response Type

[`Update Catalog Image Response Hash`](../../doc/models/update-catalog-image-response.md)

## Example Usage

```ruby
image_id = 'image_id4'
request = {}
request[:idempotency_key] = '528dea59-7bfb-43c1-bd48-4a6bba7dd61f86'

result = catalog_api.update_catalog_image(image_id: image_id, request: request, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Catalog Info

Retrieves information about the Square Catalog API, such as batch size
limits that can be used by the `BatchUpsertCatalogObjects` endpoint.

```ruby
def catalog_info
```

## Response Type

[`Catalog Info Response Hash`](../../doc/models/catalog-info-response.md)

## Example Usage

```ruby
result = catalog_api.catalog_info()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Catalog

Returns a list of all [CatalogObject](../../doc/models/catalog-object.md)s of the specified types in the catalog.

The `types` parameter is specified as a comma-separated list of the [CatalogObjectType](../../doc/models/catalog-object-type.md) values,
for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".

__Important:__ ListCatalog does not return deleted catalog items. To retrieve
deleted catalog items, use [SearchCatalogObjects](../../doc/api/catalog.md#search-catalog-objects)
and set the `include_deleted_objects` attribute value to `true`.

```ruby
def list_catalog(cursor: nil,
                 types: nil,
                 catalog_version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | The pagination cursor returned in the previous response. Leave unset for an initial request.<br>The page size is currently set to be 100.<br>See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information. |
| `types` | `String` | Query, Optional | An optional case-insensitive, comma-separated list of object types to retrieve.<br><br>The valid values are defined in the [CatalogObjectType](../../doc/models/catalog-object-type.md) enum, for example,<br>`ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,<br>`MODIFIER`, `MODIFIER_LIST`, `IMAGE`, etc.<br><br>If this is unspecified, the operation returns objects of all the top level types at the version<br>of the Square API used to make the request. Object types that are nested onto other object types<br>are not included in the defaults.<br><br>At the current API version the default object types are:<br>ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST, DINING_OPTION, TAX_EXEMPTION,<br>SERVICE_CHARGE, PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,<br>SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION, QUICK_AMOUNT_SETTINGS. |
| `catalog_version` | `Long` | Query, Optional | The specific version of the catalog objects to be included in the response.<br>This allows you to retrieve historical<br>versions of objects. The specified version value is matched against<br>the [CatalogObject](../../doc/models/catalog-object.md)s' `version` attribute.  If not included, results will<br>be from the current version of the catalog. |

## Response Type

[`List Catalog Response Hash`](../../doc/models/list-catalog-response.md)

## Example Usage

```ruby
result = catalog_api.list_catalog()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Upsert Catalog Object

Creates or updates the target [CatalogObject](../../doc/models/catalog-object.md).

```ruby
def upsert_catalog_object(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Upsert Catalog Object Request Hash`](../../doc/models/upsert-catalog-object-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Upsert Catalog Object Response Hash`](../../doc/models/upsert-catalog-object-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = 'af3d1afc-7212-4300-b463-0bfc5314a5ae'
body[:object] = {}
body[:object][:type] = 'ITEM'
body[:object][:id] = '#Cocoa'
body[:object][:item_data] = {}
body[:object][:item_data][:name] = 'Cocoa'
body[:object][:item_data][:description] = 'Hot Chocolate'
body[:object][:item_data][:abbreviation] = 'Ch'
body[:object][:item_data][:variations] = []


body[:object][:item_data][:variations][0] = {}
body[:object][:item_data][:variations][0][:type] = 'ITEM_VARIATION'
body[:object][:item_data][:variations][0][:id] = '#Small'
body[:object][:item_data][:variations][0][:item_variation_data] = {}
body[:object][:item_data][:variations][0][:item_variation_data][:item_id] = '#Cocoa'
body[:object][:item_data][:variations][0][:item_variation_data][:name] = 'Small'
body[:object][:item_data][:variations][0][:item_variation_data][:pricing_type] = 'VARIABLE_PRICING'

body[:object][:item_data][:variations][1] = {}
body[:object][:item_data][:variations][1][:type] = 'ITEM_VARIATION'
body[:object][:item_data][:variations][1][:id] = '#Large'
body[:object][:item_data][:variations][1][:item_variation_data] = {}
body[:object][:item_data][:variations][1][:item_variation_data][:item_id] = '#Cocoa'
body[:object][:item_data][:variations][1][:item_variation_data][:name] = 'Large'
body[:object][:item_data][:variations][1][:item_variation_data][:pricing_type] = 'FIXED_PRICING'
body[:object][:item_data][:variations][1][:item_variation_data][:price_money] = {}
body[:object][:item_data][:variations][1][:item_variation_data][:price_money][:amount] = 400
body[:object][:item_data][:variations][1][:item_variation_data][:price_money][:currency] = 'USD'


result = catalog_api.upsert_catalog_object(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Catalog Object

Deletes a single [CatalogObject](../../doc/models/catalog-object.md) based on the
provided ID and returns the set of successfully deleted IDs in the response.
Deletion is a cascading event such that all children of the targeted object
are also deleted. For example, deleting a [CatalogItem](../../doc/models/catalog-item.md)
will also delete all of its
[CatalogItemVariation](../../doc/models/catalog-item-variation.md) children.

```ruby
def delete_catalog_object(object_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `object_id` | `String` | Template, Required | The ID of the catalog object to be deleted. When an object is deleted, other<br>objects in the graph that depend on that object will be deleted as well (for example, deleting a<br>catalog item will delete its catalog item variations). |

## Response Type

[`Delete Catalog Object Response Hash`](../../doc/models/delete-catalog-object-response.md)

## Example Usage

```ruby
object_id = 'object_id8'

result = catalog_api.delete_catalog_object(object_id: object_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Catalog Object

Returns a single [CatalogItem](../../doc/models/catalog-item.md) as a
[CatalogObject](../../doc/models/catalog-object.md) based on the provided ID. The returned
object includes all of the relevant [CatalogItem](../../doc/models/catalog-item.md)
information including: [CatalogItemVariation](../../doc/models/catalog-item-variation.md)
children, references to its
[CatalogModifierList](../../doc/models/catalog-modifier-list.md) objects, and the ids of
any [CatalogTax](../../doc/models/catalog-tax.md) objects that apply to it.

```ruby
def retrieve_catalog_object(object_id:,
                            include_related_objects: false,
                            catalog_version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `object_id` | `String` | Template, Required | The object ID of any type of catalog objects to be retrieved. |
| `include_related_objects` | `Boolean` | Query, Optional | If `true`, the response will include additional objects that are related to the<br>requested objects. Related objects are defined as any objects referenced by ID by the results in the `objects` field<br>of the response. These objects are put in the `related_objects` field. Setting this to `true` is<br>helpful when the objects are needed for immediate display to a user.<br>This process only goes one level deep. Objects referenced by the related objects will not be included. For example,<br><br>if the `objects` field of the response contains a CatalogItem, its associated<br>CatalogCategory objects, CatalogTax objects, CatalogImage objects and<br>CatalogModifierLists will be returned in the `related_objects` field of the<br>response. If the `objects` field of the response contains a CatalogItemVariation,<br>its parent CatalogItem will be returned in the `related_objects` field of<br>the response.<br><br>Default value: `false`<br>**Default**: `false` |
| `catalog_version` | `Long` | Query, Optional | Requests objects as of a specific version of the catalog. This allows you to retrieve historical<br>versions of objects. The value to retrieve a specific version of an object can be found<br>in the version field of [CatalogObject](../../doc/models/catalog-object.md)s. If not included, results will<br>be from the current version of the catalog. |

## Response Type

[`Retrieve Catalog Object Response Hash`](../../doc/models/retrieve-catalog-object-response.md)

## Example Usage

```ruby
object_id = 'object_id8'
include_related_objects = false

result = catalog_api.retrieve_catalog_object(object_id: object_id, include_related_objects: include_related_objects, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Catalog Objects

Searches for [CatalogObject](../../doc/models/catalog-object.md) of any type by matching supported search attribute values,
excluding custom attribute values on items or item variations, against one or more of the specified query filters.

This (`SearchCatalogObjects`) endpoint differs from the [SearchCatalogItems](../../doc/api/catalog.md#search-catalog-items)
endpoint in the following aspects:

- `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects.
- `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not.
- `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does.
- The both endpoints have different call conventions, including the query filter formats.

```ruby
def search_catalog_objects(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Catalog Objects Request Hash`](../../doc/models/search-catalog-objects-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Catalog Objects Response Hash`](../../doc/models/search-catalog-objects-response.md)

## Example Usage

```ruby
body = {}
body[:object_types] = ['ITEM']
body[:query] = {}
body[:query][:prefix_query] = {}
body[:query][:prefix_query][:attribute_name] = 'name'
body[:query][:prefix_query][:attribute_prefix] = 'tea'
body[:limit] = 100

result = catalog_api.search_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Catalog Items

Searches for catalog items or item variations by matching supported search attribute values, including
custom attribute values, against one or more of the specified query filters.

This (`SearchCatalogItems`) endpoint differs from the [SearchCatalogObjects](../../doc/api/catalog.md#search-catalog-objects)
endpoint in the following aspects:

- `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects.
- `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not.
- `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does.
- The both endpoints use different call conventions, including the query filter formats.

```ruby
def search_catalog_items(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Catalog Items Request Hash`](../../doc/models/search-catalog-items-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Catalog Items Response Hash`](../../doc/models/search-catalog-items-response.md)

## Example Usage

```ruby
body = {}
body[:text_filter] = 'red'
body[:category_ids] = ['WINE_CATEGORY_ID']
body[:stock_levels] = ['OUT', 'LOW']
body[:enabled_location_ids] = ['ATL_LOCATION_ID']
body[:limit] = 100
body[:sort_order] = 'ASC'
body[:product_types] = ['REGULAR']
body[:custom_attribute_filters] = []


body[:custom_attribute_filters][0] = {}
body[:custom_attribute_filters][0][:custom_attribute_definition_id] = 'VEGAN_DEFINITION_ID'
body[:custom_attribute_filters][0][:bool_filter] = true

body[:custom_attribute_filters][1] = {}
body[:custom_attribute_filters][1][:custom_attribute_definition_id] = 'BRAND_DEFINITION_ID'
body[:custom_attribute_filters][1][:string_filter] = 'Dark Horse'

body[:custom_attribute_filters][2] = {}
body[:custom_attribute_filters][2][:key] = 'VINTAGE'
body[:custom_attribute_filters][2][:number_filter] = {}
body[:custom_attribute_filters][2][:number_filter][:min] = '2017'
body[:custom_attribute_filters][2][:number_filter][:max] = '2018'

body[:custom_attribute_filters][3] = {}
body[:custom_attribute_filters][3][:custom_attribute_definition_id] = 'VARIETAL_DEFINITION_ID'


result = catalog_api.search_catalog_items(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Item Modifier Lists

Updates the [CatalogModifierList](../../doc/models/catalog-modifier-list.md) objects
that apply to the targeted [CatalogItem](../../doc/models/catalog-item.md) without having
to perform an upsert on the entire item.

```ruby
def update_item_modifier_lists(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Update Item Modifier Lists Request Hash`](../../doc/models/update-item-modifier-lists-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Update Item Modifier Lists Response Hash`](../../doc/models/update-item-modifier-lists-response.md)

## Example Usage

```ruby
body = {}
body[:item_ids] = ['H42BRLUJ5KTZTTMPVSLFAACQ', '2JXOBJIHCWBQ4NZ3RIXQGJA6']
body[:modifier_lists_to_enable] = ['H42BRLUJ5KTZTTMPVSLFAACQ', '2JXOBJIHCWBQ4NZ3RIXQGJA6']
body[:modifier_lists_to_disable] = ['7WRC16CJZDVLSNDQ35PP6YAD']

result = catalog_api.update_item_modifier_lists(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Item Taxes

Updates the [CatalogTax](../../doc/models/catalog-tax.md) objects that apply to the
targeted [CatalogItem](../../doc/models/catalog-item.md) without having to perform an
upsert on the entire item.

```ruby
def update_item_taxes(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Update Item Taxes Request Hash`](../../doc/models/update-item-taxes-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Update Item Taxes Response Hash`](../../doc/models/update-item-taxes-response.md)

## Example Usage

```ruby
body = {}
body[:item_ids] = ['H42BRLUJ5KTZTTMPVSLFAACQ', '2JXOBJIHCWBQ4NZ3RIXQGJA6']
body[:taxes_to_enable] = ['4WRCNHCJZDVLSNDQ35PP6YAD']
body[:taxes_to_disable] = ['AQCEGCEBBQONINDOHRGZISEX']

result = catalog_api.update_item_taxes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

