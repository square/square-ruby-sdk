# Order Custom Attributes

```ruby
order_custom_attributes_api = client.order_custom_attributes
```

## Class Name

`OrderCustomAttributesApi`

## Methods

* [List Order Custom Attribute Definitions](../../doc/api/order-custom-attributes.md#list-order-custom-attribute-definitions)
* [Create Order Custom Attribute Definition](../../doc/api/order-custom-attributes.md#create-order-custom-attribute-definition)
* [Delete Order Custom Attribute Definition](../../doc/api/order-custom-attributes.md#delete-order-custom-attribute-definition)
* [Retrieve Order Custom Attribute Definition](../../doc/api/order-custom-attributes.md#retrieve-order-custom-attribute-definition)
* [Update Order Custom Attribute Definition](../../doc/api/order-custom-attributes.md#update-order-custom-attribute-definition)
* [Bulk Delete Order Custom Attributes](../../doc/api/order-custom-attributes.md#bulk-delete-order-custom-attributes)
* [Bulk Upsert Order Custom Attributes](../../doc/api/order-custom-attributes.md#bulk-upsert-order-custom-attributes)
* [List Order Custom Attributes](../../doc/api/order-custom-attributes.md#list-order-custom-attributes)
* [Delete Order Custom Attribute](../../doc/api/order-custom-attributes.md#delete-order-custom-attribute)
* [Retrieve Order Custom Attribute](../../doc/api/order-custom-attributes.md#retrieve-order-custom-attribute)
* [Upsert Order Custom Attribute](../../doc/api/order-custom-attributes.md#upsert-order-custom-attribute)


# List Order Custom Attribute Definitions

Lists the order-related [custom attribute definitions](../../doc/models/custom-attribute-definition.md) that belong to a Square seller account.

When all response pages are retrieved, the results include all custom attribute definitions
that are visible to the requesting application, including those that are created by other
applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def list_order_custom_attribute_definitions(visibility_filter: nil,
                                            cursor: nil,
                                            limit: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `visibility_filter` | [`String (Visibility Filter)`](../../doc/models/visibility-filter.md) | Query, Optional | Requests that all of the custom attributes be returned, or only those that are read-only or read-write. |
| `cursor` | `String` | Query, Optional | The cursor returned in the paged response from the previous call to this endpoint.<br>Provide this cursor to retrieve the next page of results for your original request.<br>For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). |
| `limit` | `Integer` | Query, Optional | The maximum number of results to return in a single paged response. This limit is advisory.<br>The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.<br>The default value is 20.<br>For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). |

## Response Type

[`List Order Custom Attribute Definitions Response Hash`](../../doc/models/list-order-custom-attribute-definitions-response.md)

## Example Usage

```ruby
result = order_custom_attributes_api.list_order_custom_attribute_definitions()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Order Custom Attribute Definition

Creates an order-related custom attribute definition.  Use this endpoint to
define a custom attribute that can be associated with orders.

After creating a custom attribute definition, you can set the custom attribute for orders
in the Square seller account.

```ruby
def create_order_custom_attribute_definition(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Order Custom Attribute Definition Request Hash`](../../doc/models/create-order-custom-attribute-definition-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Order Custom Attribute Definition Response Hash`](../../doc/models/create-order-custom-attribute-definition-response.md)

## Example Usage

```ruby
body = {}
body[:custom_attribute_definition] = {}
body[:custom_attribute_definition][:key] = 'cover-count'
body[:custom_attribute_definition][:name] = 'Cover count'
body[:custom_attribute_definition][:description] = 'The number of people seated at a table'
body[:custom_attribute_definition][:visibility] = 'VISIBILITY_READ_WRITE_VALUES'
body[:idempotency_key] = 'IDEMPOTENCY_KEY'

result = order_custom_attributes_api.create_order_custom_attribute_definition(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Order Custom Attribute Definition

Deletes an order-related [custom attribute definition](../../doc/models/custom-attribute-definition.md) from a Square seller account.

Only the definition owner can delete a custom attribute definition.

```ruby
def delete_order_custom_attribute_definition(key:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Template, Required | The key of the custom attribute definition to delete. |

## Response Type

[`Delete Order Custom Attribute Definition Response Hash`](../../doc/models/delete-order-custom-attribute-definition-response.md)

## Example Usage

```ruby
key = 'key0'

result = order_custom_attributes_api.delete_order_custom_attribute_definition(key: key)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Order Custom Attribute Definition

Retrieves an order-related [custom attribute definition](../../doc/models/custom-attribute-definition.md) from a Square seller account.

To retrieve a custom attribute definition created by another application, the `visibility`
setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def retrieve_order_custom_attribute_definition(key:,
                                               version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Template, Required | The key of the custom attribute definition to retrieve. |
| `version` | `Integer` | Query, Optional | To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)<br>control, include this optional field and specify the current version of the custom attribute. |

## Response Type

[`Retrieve Order Custom Attribute Definition Response Hash`](../../doc/models/retrieve-order-custom-attribute-definition-response.md)

## Example Usage

```ruby
key = 'key0'

result = order_custom_attributes_api.retrieve_order_custom_attribute_definition(key: key, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Order Custom Attribute Definition

Updates an order-related custom attribute definition for a Square seller account.

Only the definition owner can update a custom attribute definition. Note that sellers can view all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.

```ruby
def update_order_custom_attribute_definition(key:,
                                             body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Template, Required | The key of the custom attribute definition to update. |
| `body` | [`Update Order Custom Attribute Definition Request Hash`](../../doc/models/update-order-custom-attribute-definition-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Update Order Custom Attribute Definition Response Hash`](../../doc/models/update-order-custom-attribute-definition-response.md)

## Example Usage

```ruby
key = 'key0'
body = {}
body[:custom_attribute_definition] = {}
body[:custom_attribute_definition][:key] = 'cover-count'
body[:custom_attribute_definition][:visibility] = 'VISIBILITY_READ_ONLY'
body[:custom_attribute_definition][:version] = 1
body[:idempotency_key] = 'IDEMPOTENCY_KEY'

result = order_custom_attributes_api.update_order_custom_attribute_definition(key: key, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Delete Order Custom Attributes

Deletes order [custom attributes](../../doc/models/custom-attribute.md) as a bulk operation.

Use this endpoint to delete one or more custom attributes from one or more orders.
A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
custom attribute definition, use the [CreateOrderCustomAttributeDefinition](../../doc/api/order-custom-attributes.md#create-order-custom-attribute-definition) endpoint.)

This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual delete
requests and returns a map of individual delete responses. Each delete request has a unique ID
and provides an order ID and custom attribute. Each delete response is returned with the ID
of the corresponding request.

To delete a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def bulk_delete_order_custom_attributes(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Delete Order Custom Attributes Request Hash`](../../doc/models/bulk-delete-order-custom-attributes-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Bulk Delete Order Custom Attributes Response Hash`](../../doc/models/bulk-delete-order-custom-attributes-response.md)

## Example Usage

```ruby
body = {}
body[:values] = {}
body[:values][:order_id] = nil

result = order_custom_attributes_api.bulk_delete_order_custom_attributes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Upsert Order Custom Attributes

Creates or updates order [custom attributes](../../doc/models/custom-attribute.md) as a bulk operation.

Use this endpoint to delete one or more custom attributes from one or more orders.
A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
custom attribute definition, use the [CreateOrderCustomAttributeDefinition](../../doc/api/order-custom-attributes.md#create-order-custom-attribute-definition) endpoint.)

This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
requests and returns a map of individual upsert responses. Each upsert request has a unique ID
and provides an order ID and custom attribute. Each upsert response is returned with the ID
of the corresponding request.

To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def bulk_upsert_order_custom_attributes(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Upsert Order Custom Attributes Request Hash`](../../doc/models/bulk-upsert-order-custom-attributes-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Bulk Upsert Order Custom Attributes Response Hash`](../../doc/models/bulk-upsert-order-custom-attributes-response.md)

## Example Usage

```ruby
body = {}
body[:values] = {}
body[:values][:custom_attribute] = {}
body[:values][:order_id] = nil

result = order_custom_attributes_api.bulk_upsert_order_custom_attributes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Order Custom Attributes

Lists the [custom attributes](../../doc/models/custom-attribute.md) associated with an order.

You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
in the same call.

When all response pages are retrieved, the results include all custom attributes that are
visible to the requesting application, including those that are owned by other applications
and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def list_order_custom_attributes(order_id:,
                                 visibility_filter: nil,
                                 cursor: nil,
                                 limit: nil,
                                 with_definitions: false)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order_id` | `String` | Template, Required | The ID of the target [order](../../doc/models/order.md). |
| `visibility_filter` | [`String (Visibility Filter)`](../../doc/models/visibility-filter.md) | Query, Optional | Requests that all of the custom attributes be returned, or only those that are read-only or read-write. |
| `cursor` | `String` | Query, Optional | The cursor returned in the paged response from the previous call to this endpoint.<br>Provide this cursor to retrieve the next page of results for your original request.<br>For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). |
| `limit` | `Integer` | Query, Optional | The maximum number of results to return in a single paged response. This limit is advisory.<br>The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.<br>The default value is 20.<br>For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). |
| `with_definitions` | `TrueClass\|FalseClass` | Query, Optional | Indicates whether to return the [custom attribute definition](../../doc/models/custom-attribute-definition.md) in the `definition` field of each<br>custom attribute. Set this parameter to `true` to get the name and description of each custom attribute,<br>information about the data type, or other definition details. The default value is `false`.<br>**Default**: `false` |

## Response Type

[`List Order Custom Attributes Response Hash`](../../doc/models/list-order-custom-attributes-response.md)

## Example Usage

```ruby
order_id = 'order_id6'
with_definitions = false

result = order_custom_attributes_api.list_order_custom_attributes(order_id: order_id, with_definitions: with_definitions)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Order Custom Attribute

Deletes a [custom attribute](../../doc/models/custom-attribute.md) associated with a customer profile.

To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def delete_order_custom_attribute(order_id:,
                                  custom_attribute_key:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order_id` | `String` | Template, Required | The ID of the target [order](../../doc/models/order.md). |
| `custom_attribute_key` | `String` | Template, Required | The key of the custom attribute to delete.  This key must match the key of an<br>existing custom attribute definition. |

## Response Type

[`Delete Order Custom Attribute Response Hash`](../../doc/models/delete-order-custom-attribute-response.md)

## Example Usage

```ruby
order_id = 'order_id6'
custom_attribute_key = 'custom_attribute_key2'

result = order_custom_attributes_api.delete_order_custom_attribute(order_id: order_id, custom_attribute_key: custom_attribute_key)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Order Custom Attribute

Retrieves a [custom attribute](../../doc/models/custom-attribute.md) associated with an order.

You can use the `with_definition` query parameter to also retrieve the custom attribute definition
in the same call.

To retrieve a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def retrieve_order_custom_attribute(order_id:,
                                    custom_attribute_key:,
                                    version: nil,
                                    with_definition: false)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order_id` | `String` | Template, Required | The ID of the target [order](../../doc/models/order.md). |
| `custom_attribute_key` | `String` | Template, Required | The key of the custom attribute to retrieve.  This key must match the key of an<br>existing custom attribute definition. |
| `version` | `Integer` | Query, Optional | To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)<br>control, include this optional field and specify the current version of the custom attribute. |
| `with_definition` | `TrueClass\|FalseClass` | Query, Optional | Indicates whether to return the [custom attribute definition](../../doc/models/custom-attribute-definition.md) in the `definition` field of each<br>custom attribute. Set this parameter to `true` to get the name and description of each custom attribute,<br>information about the data type, or other definition details. The default value is `false`.<br>**Default**: `false` |

## Response Type

[`Retrieve Order Custom Attribute Response Hash`](../../doc/models/retrieve-order-custom-attribute-response.md)

## Example Usage

```ruby
order_id = 'order_id6'
custom_attribute_key = 'custom_attribute_key2'
with_definition = false

result = order_custom_attributes_api.retrieve_order_custom_attribute(order_id: order_id, custom_attribute_key: custom_attribute_key, with_definition: with_definition)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Upsert Order Custom Attribute

Creates or updates a [custom attribute](../../doc/models/custom-attribute.md) for an order.

Use this endpoint to set the value of a custom attribute for a specific order.
A custom attribute is based on a custom attribute definition in a Square seller account. (To create a
custom attribute definition, use the [CreateOrderCustomAttributeDefinition](../../doc/api/order-custom-attributes.md#create-order-custom-attribute-definition) endpoint.)

To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def upsert_order_custom_attribute(order_id:,
                                  custom_attribute_key:,
                                  body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order_id` | `String` | Template, Required | The ID of the target [order](../../doc/models/order.md). |
| `custom_attribute_key` | `String` | Template, Required | The key of the custom attribute to create or update.  This key must match the key<br>of an existing custom attribute definition. |
| `body` | [`Upsert Order Custom Attribute Request Hash`](../../doc/models/upsert-order-custom-attribute-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Upsert Order Custom Attribute Response Hash`](../../doc/models/upsert-order-custom-attribute-response.md)

## Example Usage

```ruby
order_id = 'order_id6'
custom_attribute_key = 'custom_attribute_key2'
body = {}
body[:custom_attribute] = {}

result = order_custom_attributes_api.upsert_order_custom_attribute(order_id: order_id, custom_attribute_key: custom_attribute_key, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

