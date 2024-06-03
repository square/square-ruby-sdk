
# Event Data

## Structure

`Event Data`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `type` | `String` | Optional | The name of the affected object’s type. |
| `id` | `String` | Optional | The ID of the affected object. |
| `deleted` | `TrueClass \| FalseClass` | Optional | This is true if the affected object has been deleted; otherwise, it's absent. |
| `object` | `Hash` | Optional | An object containing fields and values relevant to the event. It is absent if the affected object has been deleted. |

## Example (as JSON)

```json
{
  "type": "type2",
  "id": "id8",
  "deleted": false,
  "object": {
    "key1": "val1",
    "key2": "val2"
  }
}
```

