# Events

```ruby
events_api = client.events
```

## Class Name

`EventsApi`

## Methods

* [Search Events](../../doc/api/events.md#search-events)
* [Disable Events](../../doc/api/events.md#disable-events)
* [Enable Events](../../doc/api/events.md#enable-events)
* [List Event Types](../../doc/api/events.md#list-event-types)


# Search Events

Search for Square API events that occur within a 28-day timeframe.

```ruby
def search_events(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Events Request Hash`](../../doc/models/search-events-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Search Events Response Hash`](../../doc/models/search-events-response.md).

## Example Usage

```ruby
body = {}


result = events_api.search_events(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Disable Events

Disables events to prevent them from being searchable.
All events are disabled by default. You must enable events to make them searchable.
Disabling events for a specific time period prevents them from being searchable, even if you re-enable them later.

```ruby
def disable_events
```

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Disable Events Response Hash`](../../doc/models/disable-events-response.md).

## Example Usage

```ruby
result = events_api.disable_events

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Enable Events

Enables events to make them searchable. Only events that occur while in the enabled state are searchable.

```ruby
def enable_events
```

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Enable Events Response Hash`](../../doc/models/enable-events-response.md).

## Example Usage

```ruby
result = events_api.enable_events

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Event Types

Lists all event types that you can subscribe to as webhooks or query using the Events API.

```ruby
def list_event_types(api_version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `api_version` | `String` | Query, Optional | The API version for which to list event types. Setting this field overrides the default version used by the application. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Event Types Response Hash`](../../doc/models/list-event-types-response.md).

## Example Usage

```ruby
result = events_api.list_event_types

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

