# Bookings

```ruby
bookings_api = client.bookings
```

## Class Name

`BookingsApi`

## Methods

* [Create Booking](/doc/api/bookings.md#create-booking)
* [Search Availability](/doc/api/bookings.md#search-availability)
* [Retrieve Business Booking Profile](/doc/api/bookings.md#retrieve-business-booking-profile)
* [List Team Member Booking Profiles](/doc/api/bookings.md#list-team-member-booking-profiles)
* [Retrieve Team Member Booking Profile](/doc/api/bookings.md#retrieve-team-member-booking-profile)
* [Retrieve Booking](/doc/api/bookings.md#retrieve-booking)
* [Update Booking](/doc/api/bookings.md#update-booking)
* [Cancel Booking](/doc/api/bookings.md#cancel-booking)


# Create Booking

Creates a booking.

```ruby
def create_booking(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Booking Request Hash`](/doc/models/create-booking-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Booking Response Hash`](/doc/models/create-booking-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:booking] = {}
body[:booking][:id] = 'id8'
body[:booking][:version] = 148
body[:booking][:status] = 'ACCEPTED'
body[:booking][:created_at] = 'created_at6'
body[:booking][:updated_at] = 'updated_at4'

result = bookings_api.create_booking(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Availability

Searches for availabilities for booking.

```ruby
def search_availability(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Availability Request Hash`](/doc/models/search-availability-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Availability Response Hash`](/doc/models/search-availability-response.md)

## Example Usage

```ruby
body = {}
body[:query] = {}
body[:query][:filter] = {}
body[:query][:filter][:start_at_range] = {}
body[:query][:filter][:start_at_range][:start_at] = 'start_at8'
body[:query][:filter][:start_at_range][:end_at] = 'end_at4'
body[:query][:filter][:location_id] = 'location_id6'
body[:query][:filter][:segment_filters] = []


body[:query][:filter][:segment_filters][0] = {}
body[:query][:filter][:segment_filters][0][:service_variation_id] = 'service_variation_id8'
body[:query][:filter][:segment_filters][0][:team_member_id_filter] = {}
body[:query][:filter][:segment_filters][0][:team_member_id_filter][:all] = ['all7']
body[:query][:filter][:segment_filters][0][:team_member_id_filter][:any] = ['any0', 'any1']
body[:query][:filter][:segment_filters][0][:team_member_id_filter][:none] = ['none5']

body[:query][:filter][:segment_filters][1] = {}
body[:query][:filter][:segment_filters][1][:service_variation_id] = 'service_variation_id7'
body[:query][:filter][:segment_filters][1][:team_member_id_filter] = {}
body[:query][:filter][:segment_filters][1][:team_member_id_filter][:all] = ['all6', 'all7', 'all8']
body[:query][:filter][:segment_filters][1][:team_member_id_filter][:any] = ['any1', 'any2', 'any3']
body[:query][:filter][:segment_filters][1][:team_member_id_filter][:none] = ['none6', 'none7']

body[:query][:filter][:booking_id] = 'booking_id6'

result = bookings_api.search_availability(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Business Booking Profile

Retrieves a seller's booking profile.

```ruby
def retrieve_business_booking_profile
```

## Response Type

[`Retrieve Business Booking Profile Response Hash`](/doc/models/retrieve-business-booking-profile-response.md)

## Example Usage

```ruby
result = bookings_api.retrieve_business_booking_profile()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Team Member Booking Profiles

Lists booking profiles for team members.

```ruby
def list_team_member_booking_profiles(bookable_only: false,
                                      limit: nil,
                                      cursor: nil,
                                      location_id: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `bookable_only` | `Boolean` | Query, Optional | Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).<br>**Default**: `false` |
| `limit` | `Integer` | Query, Optional | The maximum number of results to return. |
| `cursor` | `String` | Query, Optional | The cursor for paginating through the results. |
| `location_id` | `String` | Query, Optional | Indicates whether to include only team members enabled at the given location in the returned result. |

## Response Type

[`List Team Member Booking Profiles Response Hash`](/doc/models/list-team-member-booking-profiles-response.md)

## Example Usage

```ruby
bookable_only = false
limit = 172
cursor = 'cursor6'
location_id = 'location_id4'

result = bookings_api.list_team_member_booking_profiles(bookable_only: bookable_only, limit: limit, cursor: cursor, location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Team Member Booking Profile

Retrieves a team member's booking profile.

```ruby
def retrieve_team_member_booking_profile(team_member_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `team_member_id` | `String` | Template, Required | The ID of the team member to retrieve. |

## Response Type

[`Retrieve Team Member Booking Profile Response Hash`](/doc/models/retrieve-team-member-booking-profile-response.md)

## Example Usage

```ruby
team_member_id = 'team_member_id0'

result = bookings_api.retrieve_team_member_booking_profile(team_member_id: team_member_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Booking

Retrieves a booking.

```ruby
def retrieve_booking(booking_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `booking_id` | `String` | Template, Required | The ID of the [Booking](/doc/models/booking.md) object representing the to-be-retrieved booking. |

## Response Type

[`Retrieve Booking Response Hash`](/doc/models/retrieve-booking-response.md)

## Example Usage

```ruby
booking_id = 'booking_id4'

result = bookings_api.retrieve_booking(booking_id: booking_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Booking

Updates a booking.

```ruby
def update_booking(booking_id:,
                   body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `booking_id` | `String` | Template, Required | The ID of the [Booking](/doc/models/booking.md) object representing the to-be-updated booking. |
| `body` | [`Update Booking Request Hash`](/doc/models/update-booking-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Update Booking Response Hash`](/doc/models/update-booking-response.md)

## Example Usage

```ruby
booking_id = 'booking_id4'
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:booking] = {}
body[:booking][:id] = 'id8'
body[:booking][:version] = 148
body[:booking][:status] = 'ACCEPTED'
body[:booking][:created_at] = 'created_at6'
body[:booking][:updated_at] = 'updated_at4'

result = bookings_api.update_booking(booking_id: booking_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Cancel Booking

Cancels an existing booking.

```ruby
def cancel_booking(booking_id:,
                   body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `booking_id` | `String` | Template, Required | The ID of the [Booking](/doc/models/booking.md) object representing the to-be-cancelled booking. |
| `body` | [`Cancel Booking Request Hash`](/doc/models/cancel-booking-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Cancel Booking Response Hash`](/doc/models/cancel-booking-response.md)

## Example Usage

```ruby
booking_id = 'booking_id4'
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:booking_version] = 8

result = bookings_api.cancel_booking(booking_id: booking_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

