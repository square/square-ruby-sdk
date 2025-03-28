# Devices

```ruby
devices_api = client.devices
```

## Class Name

`DevicesApi`

## Methods

* [List Devices](../../doc/api/devices.md#list-devices)
* [List Device Codes](../../doc/api/devices.md#list-device-codes)
* [Create Device Code](../../doc/api/devices.md#create-device-code)
* [Get Device Code](../../doc/api/devices.md#get-device-code)
* [Get Device](../../doc/api/devices.md#get-device)


# List Devices

List devices associated with the merchant. Currently, only Terminal API
devices are supported.

```ruby
def list_devices(cursor: nil,
                 sort_order: nil,
                 limit: nil,
                 location_id: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for the original query.<br>See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information. |
| `sort_order` | [`String (Sort Order)`](../../doc/models/sort-order.md) | Query, Optional | The order in which results are listed.<br><br>- `ASC` - Oldest to newest.<br>- `DESC` - Newest to oldest (default). |
| `limit` | `Integer` | Query, Optional | The number of results to return in a single page. |
| `location_id` | `String` | Query, Optional | If present, only returns devices at the target location. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Devices Response Hash`](../../doc/models/list-devices-response.md).

## Example Usage

```ruby
result = devices_api.list_devices

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Device Codes

Lists all DeviceCodes associated with the merchant.

```ruby
def list_device_codes(cursor: nil,
                      location_id: nil,
                      product_type: nil,
                      status: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. |
| `location_id` | `String` | Query, Optional | If specified, only returns DeviceCodes of the specified location.<br>Returns DeviceCodes of all locations if empty. |
| `product_type` | [`String (Product Type)`](../../doc/models/product-type.md) | Query, Optional | If specified, only returns DeviceCodes targeting the specified product type.<br>Returns DeviceCodes of all product types if empty. |
| `status` | [`String (Device Code Status)`](../../doc/models/device-code-status.md) | Query, Optional | If specified, returns DeviceCodes with the specified statuses.<br>Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Device Codes Response Hash`](../../doc/models/list-device-codes-response.md).

## Example Usage

```ruby
result = devices_api.list_device_codes

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Device Code

Creates a DeviceCode that can be used to login to a Square Terminal device to enter the connected
terminal mode.

```ruby
def create_device_code(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Device Code Request Hash`](../../doc/models/create-device-code-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Device Code Response Hash`](../../doc/models/create-device-code-response.md).

## Example Usage

```ruby
body = {
  :idempotency_key => '01bb00a6-0c86-4770-94ed-f5fca973cd56',
  :device_code => {
    :product_type => 'TERMINAL_API',
    :name => 'Counter 1',
    :location_id => 'B5E4484SHHNYH'
  }
}


result = devices_api.create_device_code(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Device Code

Retrieves DeviceCode with the associated ID.

```ruby
def get_device_code(id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | The unique identifier for the device code. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Get Device Code Response Hash`](../../doc/models/get-device-code-response.md).

## Example Usage

```ruby
id = 'id0'


result = devices_api.get_device_code(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Device

Retrieves Device with the associated `device_id`.

```ruby
def get_device(device_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `device_id` | `String` | Template, Required | The unique ID for the desired `Device`. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Get Device Response Hash`](../../doc/models/get-device-response.md).

## Example Usage

```ruby
device_id = 'device_id6'


result = devices_api.get_device(device_id: device_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

