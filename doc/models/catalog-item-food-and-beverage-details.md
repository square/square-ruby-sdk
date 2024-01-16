
# Catalog Item Food and Beverage Details

The food and beverage-specific details of a `FOOD_AND_BEV` item.

## Structure

`Catalog Item Food and Beverage Details`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `calorie_count` | `Integer` | Optional | The calorie count (in the unit of kcal) for the `FOOD_AND_BEV` type of items. |
| `dietary_preferences` | [`Array<Catalog Item Food and Beverage Details Dietary Preference Hash>`](../../doc/models/catalog-item-food-and-beverage-details-dietary-preference.md) | Optional | The dietary preferences for the `FOOD_AND_BEV` item. |
| `ingredients` | [`Array<Catalog Item Food and Beverage Details Ingredient Hash>`](../../doc/models/catalog-item-food-and-beverage-details-ingredient.md) | Optional | The ingredients for the `FOOD_AND_BEV` type item. |

## Example (as JSON)

```json
{
  "calorie_count": 36,
  "dietary_preferences": [
    {
      "type": "STANDARD",
      "standard_name": "VEGETARIAN",
      "custom_name": "custom_name8"
    }
  ],
  "ingredients": [
    {
      "type": "STANDARD",
      "standard_name": "MILK",
      "custom_name": "custom_name8"
    },
    {
      "type": "STANDARD",
      "standard_name": "MILK",
      "custom_name": "custom_name8"
    }
  ]
}
```

