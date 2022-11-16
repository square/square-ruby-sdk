
# HttpResponse

Http response received.

## Properties

| Name | Type | Description |
|  --- | --- | --- |
| status_code | Integer | The status code returned by the server. |
| reason_phrase | String | The reason phrase returned by the server. |
| headers | Hash | Response headers. |
| raw_body | String | Response body. |
| request | [`HttpRequest`](http-request.md) | The request that resulted in this response. |

