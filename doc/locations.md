# Locations

```ruby
locations_api = client.locations
```

## Class Name

`LocationsApi`

## List Locations

Provides the details for all of a business's locations.

Most other Connect API endpoints have a required `location_id` path parameter.
The `id` field of the [`Location`](#type-location) objects returned by this
endpoint correspond to that `location_id` parameter.

```ruby
def list_locations
```

### Response Type

[`List Locations Response Hash`](/doc/models/list-locations-response.md)

### Example Usage

```ruby
result = locations_api.list_locations()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

