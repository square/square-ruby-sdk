
# Address

Represents a postal address in a country.
For more information, see [Working with Addresses](https://developer.squareup.com/docs/build-basics/working-with-addresses).

## Structure

`Address`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `address_line_1` | `String` | Optional | The first line of the address.<br><br>Fields that start with `address_line` provide the address's most specific<br>details, like street number, street name, and building name. They do *not*<br>provide less specific details like city, state/province, or country (these<br>details are provided in other fields). |
| `address_line_2` | `String` | Optional | The second line of the address, if any. |
| `address_line_3` | `String` | Optional | The third line of the address, if any. |
| `locality` | `String` | Optional | The city or town of the address. For a full list of field meanings by country, see [Working with Addresses](https://developer.squareup.com/docs/build-basics/working-with-addresses). |
| `sublocality` | `String` | Optional | A civil region within the address's `locality`, if any. |
| `sublocality_2` | `String` | Optional | A civil region within the address's `sublocality`, if any. |
| `sublocality_3` | `String` | Optional | A civil region within the address's `sublocality_2`, if any. |
| `administrative_district_level_1` | `String` | Optional | A civil entity within the address's country. In the US, this<br>is the state. For a full list of field meanings by country, see [Working with Addresses](https://developer.squareup.com/docs/build-basics/working-with-addresses). |
| `administrative_district_level_2` | `String` | Optional | A civil entity within the address's `administrative_district_level_1`.<br>In the US, this is the county. |
| `administrative_district_level_3` | `String` | Optional | A civil entity within the address's `administrative_district_level_2`,<br>if any. |
| `postal_code` | `String` | Optional | The address's postal code. For a full list of field meanings by country, see [Working with Addresses](https://developer.squareup.com/docs/build-basics/working-with-addresses). |
| `country` | [`String (Country)`](../../doc/models/country.md) | Optional | Indicates the country associated with another entity, such as a business.<br>Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm). |
| `first_name` | `String` | Optional | Optional first name when it's representing recipient. |
| `last_name` | `String` | Optional | Optional last name when it's representing recipient. |

## Example (as JSON)

```json
{
  "address_line_1": "address_line_10",
  "address_line_2": "address_line_20",
  "address_line_3": "address_line_36",
  "locality": "locality0",
  "sublocality": "sublocality0",
  "sublocality_2": "sublocality_28",
  "sublocality_3": "sublocality_30",
  "administrative_district_level_1": "administrative_district_level_14",
  "administrative_district_level_2": "administrative_district_level_24",
  "administrative_district_level_3": "administrative_district_level_38",
  "postal_code": "postal_code2",
  "country": "FO",
  "first_name": "first_name0",
  "last_name": "last_name8"
}
```

