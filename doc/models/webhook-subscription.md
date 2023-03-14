
# Webhook Subscription

Represents the details of a webhook subscription, including notification URL,
event types, and signature key.

## Structure

`Webhook Subscription`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | A Square-generated unique ID for the subscription.<br>**Constraints**: *Maximum Length*: `64` |
| `name` | `String` | Optional | The name of this subscription.<br>**Constraints**: *Maximum Length*: `64` |
| `enabled` | `TrueClass\|FalseClass` | Optional | Indicates whether the subscription is enabled (`true`) or not (`false`). |
| `event_types` | `Array<String>` | Optional | The event types associated with this subscription. |
| `notification_url` | `String` | Optional | The URL to which webhooks are sent. |
| `api_version` | `String` | Optional | The API version of the subscription.<br>This field is optional for `CreateWebhookSubscription`.<br>The value defaults to the API version used by the application. |
| `signature_key` | `String` | Optional | The Square-generated signature key used to validate the origin of the webhook event. |
| `created_at` | `String` | Optional | The timestamp of when the subscription was created, in RFC 3339 format. For example, "2016-09-04T23:59:33.123Z". |
| `updated_at` | `String` | Optional | The timestamp of when the subscription was last updated, in RFC 3339 format.<br>For example, "2016-09-04T23:59:33.123Z". |

## Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "enabled": null,
  "event_types": null,
  "notification_url": null,
  "api_version": null,
  "signature_key": null,
  "created_at": null,
  "updated_at": null
}
```

