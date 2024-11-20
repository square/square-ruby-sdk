# Merchant Custom Attributes

```ruby
merchant_custom_attributes_api = client.merchant_custom_attributes
```

## Class Name

`MerchantCustomAttributesApi`

## Methods

* [List Merchant Custom Attribute Definitions](../../doc/api/merchant-custom-attributes.md#list-merchant-custom-attribute-definitions)
* [Create Merchant Custom Attribute Definition](../../doc/api/merchant-custom-attributes.md#create-merchant-custom-attribute-definition)
* [Delete Merchant Custom Attribute Definition](../../doc/api/merchant-custom-attributes.md#delete-merchant-custom-attribute-definition)
* [Retrieve Merchant Custom Attribute Definition](../../doc/api/merchant-custom-attributes.md#retrieve-merchant-custom-attribute-definition)
* [Update Merchant Custom Attribute Definition](../../doc/api/merchant-custom-attributes.md#update-merchant-custom-attribute-definition)
* [Bulk Delete Merchant Custom Attributes](../../doc/api/merchant-custom-attributes.md#bulk-delete-merchant-custom-attributes)
* [Bulk Upsert Merchant Custom Attributes](../../doc/api/merchant-custom-attributes.md#bulk-upsert-merchant-custom-attributes)
* [List Merchant Custom Attributes](../../doc/api/merchant-custom-attributes.md#list-merchant-custom-attributes)
* [Delete Merchant Custom Attribute](../../doc/api/merchant-custom-attributes.md#delete-merchant-custom-attribute)
* [Retrieve Merchant Custom Attribute](../../doc/api/merchant-custom-attributes.md#retrieve-merchant-custom-attribute)
* [Upsert Merchant Custom Attribute](../../doc/api/merchant-custom-attributes.md#upsert-merchant-custom-attribute)


# List Merchant Custom Attribute Definitions

Lists the merchant-related [custom attribute definitions](../../doc/models/custom-attribute-definition.md) that belong to a Square seller account.
When all response pages are retrieved, the results include all custom attribute definitions
that are visible to the requesting application, including those that are created by other
applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def list_merchant_custom_attribute_definitions(visibility_filter: nil,
                                               limit: nil,
                                               cursor: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `visibility_filter` | [`String (Visibility Filter)`](../../doc/models/visibility-filter.md) | Query, Optional | Filters the `CustomAttributeDefinition` results by their `visibility` values. |
| `limit` | `Integer` | Query, Optional | The maximum number of results to return in a single paged response. This limit is advisory.<br>The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.<br>The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |
| `cursor` | `String` | Query, Optional | The cursor returned in the paged response from the previous call to this endpoint.<br>Provide this cursor to retrieve the next page of results for your original request.<br>For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Merchant Custom Attribute Definitions Response Hash`](../../doc/models/list-merchant-custom-attribute-definitions-response.md).

## Example Usage

```ruby
result = merchant_custom_attributes_api.list_merchant_custom_attribute_definitions

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Merchant Custom Attribute Definition

Creates a merchant-related [custom attribute definition](../../doc/models/custom-attribute-definition.md) for a Square seller account.
Use this endpoint to define a custom attribute that can be associated with a merchant connecting to your application.
A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
for a custom attribute. After the definition is created, you can call
[UpsertMerchantCustomAttribute](../../doc/api/merchant-custom-attributes.md#upsert-merchant-custom-attribute) or
[BulkUpsertMerchantCustomAttributes](../../doc/api/merchant-custom-attributes.md#bulk-upsert-merchant-custom-attributes)
to set the custom attribute for a merchant.

```ruby
def create_merchant_custom_attribute_definition(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Merchant Custom Attribute Definition Request Hash`](../../doc/models/create-merchant-custom-attribute-definition-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Merchant Custom Attribute Definition Response Hash`](../../doc/models/create-merchant-custom-attribute-definition-response.md).

## Example Usage

```ruby
body = {
  :custom_attribute_definition => {
    :key => 'alternative_seller_name',
    :name => 'Alternative Merchant Name',
    :description => 'This is the other name this merchant goes by.',
    :visibility => 'VISIBILITY_READ_ONLY'
  }
}


result = merchant_custom_attributes_api.create_merchant_custom_attribute_definition(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Merchant Custom Attribute Definition

Deletes a merchant-related [custom attribute definition](../../doc/models/custom-attribute-definition.md) from a Square seller account.
Deleting a custom attribute definition also deletes the corresponding custom attribute from
the merchant.
Only the definition owner can delete a custom attribute definition.

```ruby
def delete_merchant_custom_attribute_definition(key:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Template, Required | The key of the custom attribute definition to delete. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Delete Merchant Custom Attribute Definition Response Hash`](../../doc/models/delete-merchant-custom-attribute-definition-response.md).

## Example Usage

```ruby
key = 'key0'


result = merchant_custom_attributes_api.delete_merchant_custom_attribute_definition(key: key)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Merchant Custom Attribute Definition

Retrieves a merchant-related [custom attribute definition](../../doc/models/custom-attribute-definition.md) from a Square seller account.
To retrieve a custom attribute definition created by another application, the `visibility`
setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def retrieve_merchant_custom_attribute_definition(key:,
                                                  version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Template, Required | The key of the custom attribute definition to retrieve. If the requesting application<br>is not the definition owner, you must use the qualified key. |
| `version` | `Integer` | Query, Optional | The current version of the custom attribute definition, which is used for strongly consistent<br>reads to guarantee that you receive the most up-to-date data. When included in the request,<br>Square returns the specified version or a higher version if one exists. If the specified version<br>is higher than the current version, Square returns a `BAD_REQUEST` error. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Retrieve Merchant Custom Attribute Definition Response Hash`](../../doc/models/retrieve-merchant-custom-attribute-definition-response.md).

## Example Usage

```ruby
key = 'key0'


result = merchant_custom_attributes_api.retrieve_merchant_custom_attribute_definition(key: key)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Merchant Custom Attribute Definition

Updates a merchant-related [custom attribute definition](../../doc/models/custom-attribute-definition.md) for a Square seller account.
Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
`schema` for a `Selection` data type.
Only the definition owner can update a custom attribute definition.

```ruby
def update_merchant_custom_attribute_definition(key:,
                                                body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Template, Required | The key of the custom attribute definition to update. |
| `body` | [`Update Merchant Custom Attribute Definition Request Hash`](../../doc/models/update-merchant-custom-attribute-definition-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Update Merchant Custom Attribute Definition Response Hash`](../../doc/models/update-merchant-custom-attribute-definition-response.md).

## Example Usage

```ruby
key = 'key0'

body = {
  :custom_attribute_definition => {
    :description => 'Update the description as desired.',
    :visibility => 'VISIBILITY_READ_ONLY'
  }
}


result = merchant_custom_attributes_api.update_merchant_custom_attribute_definition(
  key: key,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Delete Merchant Custom Attributes

Deletes [custom attributes](../../doc/models/custom-attribute.md) for a merchant as a bulk operation.
To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`.

```ruby
def bulk_delete_merchant_custom_attributes(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Delete Merchant Custom Attributes Request Hash`](../../doc/models/bulk-delete-merchant-custom-attributes-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Bulk Delete Merchant Custom Attributes Response Hash`](../../doc/models/bulk-delete-merchant-custom-attributes-response.md).

## Example Usage

```ruby
body = {
  :values => {
    'id1' => {},
    'id2' => {}
  }
}


result = merchant_custom_attributes_api.bulk_delete_merchant_custom_attributes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Upsert Merchant Custom Attributes

Creates or updates [custom attributes](../../doc/models/custom-attribute.md) for a merchant as a bulk operation.
Use this endpoint to set the value of one or more custom attributes for a merchant.
A custom attribute is based on a custom attribute definition in a Square seller account, which is
created using the [CreateMerchantCustomAttributeDefinition](../../doc/api/merchant-custom-attributes.md#create-merchant-custom-attribute-definition) endpoint.
This `BulkUpsertMerchantCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
requests and returns a map of individual upsert responses. Each upsert request has a unique ID
and provides a merchant ID and custom attribute. Each upsert response is returned with the ID
of the corresponding request.
To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def bulk_upsert_merchant_custom_attributes(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Upsert Merchant Custom Attributes Request Hash`](../../doc/models/bulk-upsert-merchant-custom-attributes-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Bulk Upsert Merchant Custom Attributes Response Hash`](../../doc/models/bulk-upsert-merchant-custom-attributes-response.md).

## Example Usage

```ruby
body = {
  :values => {
    'key0' => {
      :merchant_id => 'merchant_id0',
      :custom_attribute => {}
    },
    'key1' => {
      :merchant_id => 'merchant_id0',
      :custom_attribute => {}
    }
  }
}


result = merchant_custom_attributes_api.bulk_upsert_merchant_custom_attributes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Merchant Custom Attributes

Lists the [custom attributes](../../doc/models/custom-attribute.md) associated with a merchant.
You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
in the same call.
When all response pages are retrieved, the results include all custom attributes that are
visible to the requesting application, including those that are owned by other applications
and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def list_merchant_custom_attributes(merchant_id:,
                                    visibility_filter: nil,
                                    limit: nil,
                                    cursor: nil,
                                    with_definitions: false)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `merchant_id` | `String` | Template, Required | The ID of the target [merchant](entity:Merchant). |
| `visibility_filter` | [`String (Visibility Filter)`](../../doc/models/visibility-filter.md) | Query, Optional | Filters the `CustomAttributeDefinition` results by their `visibility` values. |
| `limit` | `Integer` | Query, Optional | The maximum number of results to return in a single paged response. This limit is advisory.<br>The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.<br>The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |
| `cursor` | `String` | Query, Optional | The cursor returned in the paged response from the previous call to this endpoint.<br>Provide this cursor to retrieve the next page of results for your original request. For more<br>information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |
| `with_definitions` | `TrueClass \| FalseClass` | Query, Optional | Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each<br>custom attribute. Set this parameter to `true` to get the name and description of each custom<br>attribute, information about the data type, or other definition details. The default value is `false`.<br>**Default**: `false` |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Merchant Custom Attributes Response Hash`](../../doc/models/list-merchant-custom-attributes-response.md).

## Example Usage

```ruby
merchant_id = 'merchant_id0'

with_definitions = false


result = merchant_custom_attributes_api.list_merchant_custom_attributes(
  merchant_id: merchant_id,
  with_definitions: with_definitions
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Merchant Custom Attribute

Deletes a [custom attribute](../../doc/models/custom-attribute.md) associated with a merchant.
To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`.

```ruby
def delete_merchant_custom_attribute(merchant_id:,
                                     key:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `merchant_id` | `String` | Template, Required | The ID of the target [merchant](entity:Merchant). |
| `key` | `String` | Template, Required | The key of the custom attribute to delete. This key must match the `key` of a custom<br>attribute definition in the Square seller account. If the requesting application is not the<br>definition owner, you must use the qualified key. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Delete Merchant Custom Attribute Response Hash`](../../doc/models/delete-merchant-custom-attribute-response.md).

## Example Usage

```ruby
merchant_id = 'merchant_id0'

key = 'key0'


result = merchant_custom_attributes_api.delete_merchant_custom_attribute(
  merchant_id: merchant_id,
  key: key
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Merchant Custom Attribute

Retrieves a [custom attribute](../../doc/models/custom-attribute.md) associated with a merchant.
You can use the `with_definition` query parameter to also retrieve the custom attribute definition
in the same call.
To retrieve a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def retrieve_merchant_custom_attribute(merchant_id:,
                                       key:,
                                       with_definition: false,
                                       version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `merchant_id` | `String` | Template, Required | The ID of the target [merchant](entity:Merchant). |
| `key` | `String` | Template, Required | The key of the custom attribute to retrieve. This key must match the `key` of a custom<br>attribute definition in the Square seller account. If the requesting application is not the<br>definition owner, you must use the qualified key. |
| `with_definition` | `TrueClass \| FalseClass` | Query, Optional | Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of<br>the custom attribute. Set this parameter to `true` to get the name and description of the custom<br>attribute, information about the data type, or other definition details. The default value is `false`.<br>**Default**: `false` |
| `version` | `Integer` | Query, Optional | The current version of the custom attribute, which is used for strongly consistent reads to<br>guarantee that you receive the most up-to-date data. When included in the request, Square<br>returns the specified version or a higher version if one exists. If the specified version is<br>higher than the current version, Square returns a `BAD_REQUEST` error. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Retrieve Merchant Custom Attribute Response Hash`](../../doc/models/retrieve-merchant-custom-attribute-response.md).

## Example Usage

```ruby
merchant_id = 'merchant_id0'

key = 'key0'

with_definition = false


result = merchant_custom_attributes_api.retrieve_merchant_custom_attribute(
  merchant_id: merchant_id,
  key: key,
  with_definition: with_definition
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Upsert Merchant Custom Attribute

Creates or updates a [custom attribute](../../doc/models/custom-attribute.md) for a merchant.
Use this endpoint to set the value of a custom attribute for a specified merchant.
A custom attribute is based on a custom attribute definition in a Square seller account, which
is created using the [CreateMerchantCustomAttributeDefinition](../../doc/api/merchant-custom-attributes.md#create-merchant-custom-attribute-definition) endpoint.
To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`.

```ruby
def upsert_merchant_custom_attribute(merchant_id:,
                                     key:,
                                     body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `merchant_id` | `String` | Template, Required | The ID of the target [merchant](entity:Merchant). |
| `key` | `String` | Template, Required | The key of the custom attribute to create or update. This key must match the `key` of a<br>custom attribute definition in the Square seller account. If the requesting application is not<br>the definition owner, you must use the qualified key. |
| `body` | [`Upsert Merchant Custom Attribute Request Hash`](../../doc/models/upsert-merchant-custom-attribute-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Upsert Merchant Custom Attribute Response Hash`](../../doc/models/upsert-merchant-custom-attribute-response.md).

## Example Usage

```ruby
merchant_id = 'merchant_id0'

key = 'key0'

body = {
  :custom_attribute => {}
}


result = merchant_custom_attributes_api.upsert_merchant_custom_attribute(
  merchant_id: merchant_id,
  key: key,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

