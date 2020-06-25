# V1 Locations

```ruby
v1_locations_api = client.v1_locations
```

## Class Name

`V1LocationsApi`

## Methods

* [Retrieve Business](/doc/v1-locations.md#retrieve-business)
* [List Locations](/doc/v1-locations.md#list-locations)

## Retrieve Business

Get the general information for a business.

```ruby
def retrieve_business
```

### Response Type

[`V1 Merchant Hash`](/doc/models/v1-merchant.md)

### Example Usage

```ruby
result = v1_locations_api.retrieve_business()

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Locations

Provides details for all business locations associated with a Square
account, including the Square-assigned object ID for the location.

```ruby
def list_locations
```

### Response Type

[`Array<V1 Merchant Hash>`](/doc/models/v1-merchant.md)

### Example Usage

```ruby
result = v1_locations_api.list_locations()

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

