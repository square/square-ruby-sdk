
# Utility Classes Documentation

## ApiHelper Class

API utility class.

## Methods

| Name | Return Type | Description |
|  --- | --- | --- |
| json_deserialize | Hash | Deserializes a JSON string to a Ruby Hash. |
| rfc3339 | DateTime | Safely converts a string into an RFC3339 DateTime object. |

## DateTimeHelper Class

DateTime utility class.

## Methods

| Name | Return Type | Description |
|  --- | --- | --- |
| from_rfc3339 | DateTime | Safely converts a string into an RFC3339 DateTime object. |
| from_rfc1123 | DateTime | Safely converts a string into an RFC1123 DateTime object. |
| from_unix | DateTime | Safely converts a string into an Unix DateTime object. |
| to_rfc3339 | DateTime_String | Safely converts a RFC3339 DateTime object into a DateTime string. |
| to_rfc1123 | DateTime_String | Safely converts a RFC1123 DateTime object into a DateTime string. |
| to_unix | DateTime_String | Safely converts a Unix DateTime object into a DateTime string. |
| to_rfc3339_map | Map_Of_DateTime_String | Safely converts a map of RFC3339 DateTime object into a map of RFC3339 formatted DateTime string. |
| to_rfc3339_array | Array_Of_DateTime_String | Safely converts an array of RFC3339 DateTime object into an array of RFC3339 formatted DateTime string. |
| to_rfc1123_map | Map_Of_DateTime_String | Safely converts a map of RFC1123 DateTime object into map of RFC1123 formatted DateTime string. |
| to_rfc1123_array | Array_Of_DateTime_String | Safely converts an array of RFC1123 DateTime object into an array of RFC1123 formatted DateTime string. |
| to_unix_map | Map_Of_DateTime_String | Safely converts a map of Unix DateTime object into a map of Unix formatted DateTime string. |
| to_unix_array | Array_Of_DateTime_String | Safely converts an array of Unix DateTime object into an array of Unix formatted DateTime string. |

