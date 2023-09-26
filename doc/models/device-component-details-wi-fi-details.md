
# Device Component Details Wi Fi Details

## Structure

`Device Component Details Wi Fi Details`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `active` | `TrueClass \| FalseClass` | Optional | A boolean to represent whether the WiFI interface is currently active. |
| `ssid` | `String` | Optional | The name of the connected WIFI network. |
| `ip_address_v4` | `String` | Optional | The string representation of the device’s IPv4 address. |
| `secure_connection` | `String` | Optional | The security protocol for a secure connection (e.g. WPA2). None provided if the connection<br>is unsecured. |
| `signal_strength` | [`Device Component Details Measurement Hash`](../../doc/models/device-component-details-measurement.md) | Optional | A value qualified by unit of measure. |

## Example (as JSON)

```json
{
  "active": false,
  "ssid": "ssid6",
  "ip_address_v4": "ip_address_v40",
  "secure_connection": "secure_connection6",
  "signal_strength": {
    "value": 222
  }
}
```

