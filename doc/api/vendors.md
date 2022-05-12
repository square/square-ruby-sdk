# Vendors

```ruby
vendors_api = client.vendors
```

## Class Name

`VendorsApi`

## Methods

* [Bulk Create Vendors](../../doc/api/vendors.md#bulk-create-vendors)
* [Bulk Retrieve Vendors](../../doc/api/vendors.md#bulk-retrieve-vendors)
* [Bulk Update Vendors](../../doc/api/vendors.md#bulk-update-vendors)
* [Create Vendor](../../doc/api/vendors.md#create-vendor)
* [Search Vendors](../../doc/api/vendors.md#search-vendors)
* [Retrieve Vendor](../../doc/api/vendors.md#retrieve-vendor)
* [Update Vendor](../../doc/api/vendors.md#update-vendor)


# Bulk Create Vendors

Creates one or more [Vendor](../../doc/models/vendor.md) objects to represent suppliers to a seller.

```ruby
def bulk_create_vendors(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Create Vendors Request Hash`](../../doc/models/bulk-create-vendors-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Bulk Create Vendors Response Hash`](../../doc/models/bulk-create-vendors-response.md)

## Example Usage

```ruby
body = {}
body[:vendors] = {}

result = vendors_api.bulk_create_vendors(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Retrieve Vendors

Retrieves one or more vendors of specified [Vendor](../../doc/models/vendor.md) IDs.

```ruby
def bulk_retrieve_vendors(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Retrieve Vendors Request Hash`](../../doc/models/bulk-retrieve-vendors-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Bulk Retrieve Vendors Response Hash`](../../doc/models/bulk-retrieve-vendors-response.md)

## Example Usage

```ruby
body = {}
body[:vendor_ids] = ['INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4']

result = vendors_api.bulk_retrieve_vendors(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Update Vendors

Updates one or more of existing [Vendor](../../doc/models/vendor.md) objects as suppliers to a seller.

```ruby
def bulk_update_vendors(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Update Vendors Request Hash`](../../doc/models/bulk-update-vendors-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Bulk Update Vendors Response Hash`](../../doc/models/bulk-update-vendors-response.md)

## Example Usage

```ruby
body = {}
body[:vendors] = {}
body[:vendors][:vendor] = {}

result = vendors_api.bulk_update_vendors(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Vendor

Creates a single [Vendor](../../doc/models/vendor.md) object to represent a supplier to a seller.

```ruby
def create_vendor(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Vendor Request Hash`](../../doc/models/create-vendor-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Vendor Response Hash`](../../doc/models/create-vendor-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = 'idempotency_key2'

result = vendors_api.create_vendor(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Vendors

Searches for vendors using a filter against supported [Vendor](../../doc/models/vendor.md) properties and a supported sorter.

```ruby
def search_vendors(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Vendors Request Hash`](../../doc/models/search-vendors-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Vendors Response Hash`](../../doc/models/search-vendors-response.md)

## Example Usage

```ruby
body = {}

result = vendors_api.search_vendors(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Vendor

Retrieves the vendor of a specified [Vendor](../../doc/models/vendor.md) ID.

```ruby
def retrieve_vendor(vendor_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `vendor_id` | `String` | Template, Required | ID of the [Vendor](../../doc/models/vendor.md) to retrieve. |

## Response Type

[`Retrieve Vendor Response Hash`](../../doc/models/retrieve-vendor-response.md)

## Example Usage

```ruby
vendor_id = 'vendor_id8'

result = vendors_api.retrieve_vendor(vendor_id: vendor_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Vendor

Updates an existing [Vendor](../../doc/models/vendor.md) object as a supplier to a seller.

```ruby
def update_vendor(body:,
                  vendor_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Update Vendor Request Hash`](../../doc/models/update-vendor-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |
| `vendor_id` | `String` | Template, Required | - |

## Response Type

[`Update Vendor Response Hash`](../../doc/models/update-vendor-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = '8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe'
body[:vendor] = {}
body[:vendor][:id] = 'INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4'
body[:vendor][:name] = 'Jack\'s Chicken Shack'
body[:vendor][:version] = 1
body[:vendor][:status] = 'ACTIVE'
vendor_id = 'vendor_id8'

result = vendors_api.update_vendor(body: body, vendor_id: vendor_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

