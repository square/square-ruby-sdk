
# List Workweek Configs Request

A request for a set of `WorkweekConfig` objects.

## Structure

`List Workweek Configs Request`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `limit` | `Integer` | Optional | The maximum number of `WorkweekConfigs` results to return per page. |
| `cursor` | `String` | Optional | A pointer to the next page of `WorkweekConfig` results to fetch. |

## Example (as JSON)

```json
{
  "limit": 172,
  "cursor": "cursor6"
}
```

