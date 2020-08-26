## List Cash Drawer Shifts Request

### Structure

`ListCashDrawerShiftsRequest`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` |  | The ID of the location to query for a list of cash drawer shifts. |
| `sort_order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `begin_time` | `String` | Optional | The inclusive start time of the query on opened_at, in ISO 8601 format. |
| `end_time` | `String` | Optional | The exclusive end date of the query on opened_at, in ISO 8601 format. |
| `limit` | `Integer` | Optional | Number of cash drawer shift events in a page of results (200 by<br>default, 1000 max). |
| `cursor` | `String` | Optional | Opaque cursor for fetching the next page of results. |

### Example (as JSON)

```json
{
  "location_id": "location_id4",
  "sort_order": "DESC",
  "begin_time": "begin_time2",
  "end_time": "end_time2",
  "limit": 172,
  "cursor": "cursor6"
}
```

