# Locations

```ruby
locations_api = client.locations
```

## Class Name

`LocationsApi`

## Methods

* [List Locations](../../doc/api/locations.md#list-locations)
* [Create Location](../../doc/api/locations.md#create-location)
* [Retrieve Location](../../doc/api/locations.md#retrieve-location)
* [Update Location](../../doc/api/locations.md#update-location)


# List Locations

Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
including those with an inactive status. Locations are listed alphabetically by `name`.

```ruby
def list_locations
```

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Locations Response Hash`](../../doc/models/list-locations-response.md).

## Example Usage

```ruby
result = locations_api.list_locations

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Location

Creates a [location](https://developer.squareup.com/docs/locations-api).
Creating new locations allows for separate configuration of receipt layouts, item prices,
and sales reports. Developers can use locations to separate sales activity through applications
that integrate with Square from sales activity elsewhere in a seller's account.
Locations created programmatically with the Locations API last forever and
are visible to the seller for their own management. Therefore, ensure that
each location has a sensible and unique name.

```ruby
def create_location(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Location Request Hash`](../../doc/models/create-location-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Location Response Hash`](../../doc/models/create-location-response.md).

## Example Usage

```ruby
body = {
  :location => {
    :name => 'Midtown',
    :address => {
      :address_line_1 => '1234 Peachtree St. NE',
      :locality => 'Atlanta',
      :administrative_district_level_1 => 'GA',
      :postal_code => '30309'
    },
    :description => 'Midtown Atlanta store'
  }
}


result = locations_api.create_location(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Location

Retrieves details of a single location. Specify "main"
as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).

```ruby
def retrieve_location(location_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to retrieve. Specify the string<br>"main" to return the main location. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Retrieve Location Response Hash`](../../doc/models/retrieve-location-response.md).

## Example Usage

```ruby
location_id = 'location_id4'


result = locations_api.retrieve_location(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Location

Updates a [location](https://developer.squareup.com/docs/locations-api).

```ruby
def update_location(location_id:,
                    body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to update. |
| `body` | [`Update Location Request Hash`](../../doc/models/update-location-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Update Location Response Hash`](../../doc/models/update-location-response.md).

## Example Usage

```ruby
location_id = 'location_id4'

body = {
  :location => {
    :business_hours => {
      :periods => [
        {
          :day_of_week => 'FRI',
          :start_local_time => '07:00',
          :end_local_time => '18:00'
        },
        {
          :day_of_week => 'SAT',
          :start_local_time => '07:00',
          :end_local_time => '18:00'
        },
        {
          :day_of_week => 'SUN',
          :start_local_time => '09:00',
          :end_local_time => '15:00'
        }
      ]
    },
    :description => 'Midtown Atlanta store - Open weekends'
  }
}


result = locations_api.update_location(
  location_id: location_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

