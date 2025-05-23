# Gift Card Activities

```ruby
gift_card_activities_api = client.gift_card_activities
```

## Class Name

`GiftCardActivitiesApi`

## Methods

* [List Gift Card Activities](../../doc/api/gift-card-activities.md#list-gift-card-activities)
* [Create Gift Card Activity](../../doc/api/gift-card-activities.md#create-gift-card-activity)


# List Gift Card Activities

Lists gift card activities. By default, you get gift card activities for all
gift cards in the seller's account. You can optionally specify query parameters to
filter the list. For example, you can get a list of gift card activities for a gift card,
for all gift cards in a specific region, or for activities within a time window.

```ruby
def list_gift_card_activities(gift_card_id: nil,
                              type: nil,
                              location_id: nil,
                              begin_time: nil,
                              end_time: nil,
                              limit: nil,
                              cursor: nil,
                              sort_order: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `gift_card_id` | `String` | Query, Optional | If a gift card ID is provided, the endpoint returns activities related<br>to the specified gift card. Otherwise, the endpoint returns all gift card activities for<br>the seller. |
| `type` | `String` | Query, Optional | If a [type](entity:GiftCardActivityType) is provided, the endpoint returns gift card activities of the specified type.<br>Otherwise, the endpoint returns all types of gift card activities. |
| `location_id` | `String` | Query, Optional | If a location ID is provided, the endpoint returns gift card activities for the specified location.<br>Otherwise, the endpoint returns gift card activities for all locations. |
| `begin_time` | `String` | Query, Optional | The timestamp for the beginning of the reporting period, in RFC 3339 format.<br>This start time is inclusive. The default value is the current time minus one year. |
| `end_time` | `String` | Query, Optional | The timestamp for the end of the reporting period, in RFC 3339 format.<br>This end time is inclusive. The default value is the current time. |
| `limit` | `Integer` | Query, Optional | If a limit is provided, the endpoint returns the specified number<br>of results (or fewer) per page. The maximum value is 100. The default value is 50.<br>For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for the original query.<br>If a cursor is not provided, the endpoint returns the first page of the results.<br>For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). |
| `sort_order` | `String` | Query, Optional | The order in which the endpoint returns the activities, based on `created_at`.<br><br>- `ASC` - Oldest to newest.<br>- `DESC` - Newest to oldest (default). |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Gift Card Activities Response Hash`](../../doc/models/list-gift-card-activities-response.md).

## Example Usage

```ruby
result = gift_card_activities_api.list_gift_card_activities

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Gift Card Activity

Creates a gift card activity to manage the balance or state of a [gift card](../../doc/models/gift-card.md).
For example, create an `ACTIVATE` activity to activate a gift card with an initial balance before first use.

```ruby
def create_gift_card_activity(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Gift Card Activity Request Hash`](../../doc/models/create-gift-card-activity-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Gift Card Activity Response Hash`](../../doc/models/create-gift-card-activity-response.md).

## Example Usage

```ruby
body = {
  :idempotency_key => 'U16kfr-kA70er-q4Rsym-7U7NnY',
  :gift_card_activity => {
    :type => 'ACTIVATE',
    :location_id => '81FN9BNFZTKS4',
    :gift_card_id => 'gftc:6d55a72470d940c6ba09c0ab8ad08d20',
    :activate_activity_details => {
      :order_id => 'jJNGHm4gLI6XkFbwtiSLqK72KkAZY',
      :line_item_uid => 'eIWl7X0nMuO9Ewbh0ChIx'
    }
  }
}


result = gift_card_activities_api.create_gift_card_activity(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

