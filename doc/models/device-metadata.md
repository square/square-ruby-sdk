
# Device Metadata

## Structure

`Device Metadata`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `battery_percentage` | `String` | Optional | The Terminal’s remaining battery percentage, between 1-100. |
| `charging_state` | `String` | Optional | The current charging state of the Terminal.<br>Options: `CHARGING`, `NOT_CHARGING` |
| `location_id` | `String` | Optional | The ID of the Square seller business location associated with the Terminal. |
| `merchant_id` | `String` | Optional | The ID of the Square merchant account that is currently signed-in to the Terminal. |
| `network_connection_type` | `String` | Optional | The Terminal’s current network connection type.<br>Options: `WIFI`, `ETHERNET` |
| `payment_region` | `String` | Optional | The country in which the Terminal is authorized to take payments. |
| `serial_number` | `String` | Optional | The unique identifier assigned to the Terminal, which can be found on the lower back<br>of the device. |
| `os_version` | `String` | Optional | The current version of the Terminal’s operating system. |
| `app_version` | `String` | Optional | The current version of the application running on the Terminal. |
| `wifi_network_name` | `String` | Optional | The name of the Wi-Fi network to which the Terminal is connected. |
| `wifi_network_strength` | `String` | Optional | The signal strength of the Wi-FI network connection.<br>Options: `POOR`, `FAIR`, `GOOD`, `EXCELLENT` |
| `ip_address` | `String` | Optional | The IP address of the Terminal. |

## Example (as JSON)

```json
{
  "battery_percentage": null,
  "charging_state": null,
  "location_id": null,
  "merchant_id": null,
  "network_connection_type": null,
  "payment_region": null,
  "serial_number": null,
  "os_version": null,
  "app_version": null,
  "wifi_network_name": null,
  "wifi_network_strength": null,
  "ip_address": null
}
```

