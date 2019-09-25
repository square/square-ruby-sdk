# Locations

```ruby
locations_api = client.locations
```

## Class Name

`LocationsApi`

## Methods

* [List Locations](/doc/locations.md#list-locations)
* [Retrieve Location](/doc/locations.md#retrieve-location)
* [Update Location](/doc/locations.md#update-location)

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

## Retrieve Location

Retrieves details of a location.

```ruby
def retrieve_location(location_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to retrieve. |

### Response Type

[`Retrieve Location Response Hash`](/doc/models/retrieve-location-response.md)

### Example Usage

```ruby
location_id = 'location_id4'

result = locations_api.retrieve_location(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Update Location

Updates the `Location` specified by the given ID.

```ruby
def update_location(location_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to update. |
| `body` | [`Update Location Request Hash`](/doc/models/update-location-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Update Location Response Hash`](/doc/models/update-location-response.md)

### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = locations_api.update_location(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

