
# HttpRequest

Represents a single Http Request.

## Properties

| Name | Type | Tag | Description |
|  --- | --- | --- | --- |
| http_method | HttpMethodEnum |  | The HTTP method of the request. |
| query_url | String |  | The endpoint URL for the API request. |
| headers | Hash | Optional | Request headers. |
| parameters | Hash | Optional | Request body. |
| context | Hash | Optional | Request context for passing meta information about the request. |

