## Measurement Unit

Represents a unit of measurement to use with a quantity, such as ounces
or inches. Exactly one of the following fields are required: `custom_unit`,
`area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.

The `family` field describes the type of measurement. For example,
ounces are in the weight family.

### Structure

`MeasurementUnit`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `custom_unit` | [`Measurement Unit Custom Hash`](/doc/models/measurement-unit-custom.md) | Optional | The information needed to define a custom unit, provided by the seller. |
| `area_unit` | [`String (Measurement Unit Area)`](/doc/models/measurement-unit-area.md) | Optional | Unit of area used to measure a quantity. |
| `length_unit` | [`String (Measurement Unit Length)`](/doc/models/measurement-unit-length.md) | Optional | The unit of length used to measure a quantity. |
| `volume_unit` | [`String (Measurement Unit Volume)`](/doc/models/measurement-unit-volume.md) | Optional | The unit of volume used to measure a quantity. |
| `weight_unit` | [`String (Measurement Unit Weight)`](/doc/models/measurement-unit-weight.md) | Optional | Unit of weight used to measure a quantity. |
| `generic_unit` | [`String (Measurement Unit Generic)`](/doc/models/measurement-unit-generic.md) | Optional | A custom unit of measurement defined by the user. |

### Example (as JSON)

```json
{
  "custom_unit": null,
  "area_unit": null,
  "length_unit": null,
  "volume_unit": null,
  "weight_unit": null,
  "generic_unit": null
}
```

