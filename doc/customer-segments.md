# Customer Segments

```ruby
customer_segments_api = client.customer_segments
```

## Class Name

`CustomerSegmentsApi`

## Methods

* [List Customer Segments](/doc/customer-segments.md#list-customer-segments)
* [Retrieve Customer Segment](/doc/customer-segments.md#retrieve-customer-segment)

## List Customer Segments

Retrieves the list of customer segments of a business.

```ruby
def list_customer_segments(cursor: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by previous calls to __ListCustomerSegments__.<br>Used to retrieve the next set of query results.<br><br>See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information. |

### Response Type

[`List Customer Segments Response Hash`](/doc/models/list-customer-segments-response.md)

### Example Usage

```ruby
cursor = 'cursor6'

result = customer_segments_api.list_customer_segments(cursor: cursor)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Retrieve Customer Segment

Retrieves a specific customer segment as identified by the `segment_id` value.

```ruby
def retrieve_customer_segment(segment_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `segment_id` | `String` | Template, Required | The Square-issued ID of the customer segment. |

### Response Type

[`Retrieve Customer Segment Response Hash`](/doc/models/retrieve-customer-segment-response.md)

### Example Usage

```ruby
segment_id = 'segment_id4'

result = customer_segments_api.retrieve_customer_segment(segment_id: segment_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

