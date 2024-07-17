# Invoices

```ruby
invoices_api = client.invoices
```

## Class Name

`InvoicesApi`

## Methods

* [List Invoices](../../doc/api/invoices.md#list-invoices)
* [Create Invoice](../../doc/api/invoices.md#create-invoice)
* [Search Invoices](../../doc/api/invoices.md#search-invoices)
* [Delete Invoice](../../doc/api/invoices.md#delete-invoice)
* [Get Invoice](../../doc/api/invoices.md#get-invoice)
* [Update Invoice](../../doc/api/invoices.md#update-invoice)
* [Create Invoice Attachment](../../doc/api/invoices.md#create-invoice-attachment)
* [Delete Invoice Attachment](../../doc/api/invoices.md#delete-invoice-attachment)
* [Cancel Invoice](../../doc/api/invoices.md#cancel-invoice)
* [Publish Invoice](../../doc/api/invoices.md#publish-invoice)


# List Invoices

Returns a list of invoices for a given location. The response
is paginated. If truncated, the response includes a `cursor` that you  
use in a subsequent request to retrieve the next set of invoices.

```ruby
def list_invoices(location_id:,
                  cursor: nil,
                  limit: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Query, Required | The ID of the location for which to list invoices. |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for your original query.<br><br>For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |
| `limit` | `Integer` | Query, Optional | The maximum number of invoices to return (200 is the maximum `limit`).<br>If not provided, the server uses a default limit of 100 invoices. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Invoices Response Hash`](../../doc/models/list-invoices-response.md).

## Example Usage

```ruby
location_id = 'location_id4'


result = invoices_api.list_invoices(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Invoice

Creates a draft [invoice](../../doc/models/invoice.md)
for an order created using the Orders API.

A draft invoice remains in your account and no action is taken.
You must publish the invoice before Square can process it (send it to the customer's email address or charge the customer’s card on file).

```ruby
def create_invoice(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Invoice Request Hash`](../../doc/models/create-invoice-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Invoice Response Hash`](../../doc/models/create-invoice-response.md).

## Example Usage

```ruby
body = {
  :invoice => {
    :location_id => 'ES0RJRZYEC39A',
    :order_id => 'CAISENgvlJ6jLWAzERDzjyHVybY',
    :primary_recipient => {
      :customer_id => 'JDKYHBWT1D4F8MFH63DBMEN8Y4'
    },
    :payment_requests => [
      {
        :request_type => 'BALANCE',
        :due_date => '2030-01-24',
        :tipping_enabled => true,
        :automatic_payment_source => 'NONE',
        :reminders => [
          {
            :relative_scheduled_days => -1,
            :message => 'Your invoice is due tomorrow'
          }
        ]
      }
    ],
    :delivery_method => 'EMAIL',
    :invoice_number => 'inv-100',
    :title => 'Event Planning Services',
    :description => 'We appreciate your business!',
    :scheduled_at => '2030-01-13T10:00:00Z',
    :accepted_payment_methods => {
      :card => true,
      :square_gift_card => false,
      :bank_account => false,
      :buy_now_pay_later => false,
      :cash_app_pay => false
    },
    :custom_fields => [
      {
        :label => 'Event Reference Number',
        :value => 'Ref. #1234',
        :placement => 'ABOVE_LINE_ITEMS'
      },
      {
        :label => 'Terms of Service',
        :value => 'The terms of service are...',
        :placement => 'BELOW_LINE_ITEMS'
      }
    ],
    :sale_or_service_date => '2030-01-24',
    :store_payment_method_enabled => false
  },
  :idempotency_key => 'ce3748f9-5fc1-4762-aa12-aae5e843f1f4'
}


result = invoices_api.create_invoice(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Invoices

Searches for invoices from a location specified in
the filter. You can optionally specify customers in the filter for whom to
retrieve invoices. In the current implementation, you can only specify one location and
optionally one customer.

The response is paginated. If truncated, the response includes a `cursor`
that you use in a subsequent request to retrieve the next set of invoices.

```ruby
def search_invoices(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Invoices Request Hash`](../../doc/models/search-invoices-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Search Invoices Response Hash`](../../doc/models/search-invoices-response.md).

## Example Usage

```ruby
body = {
  :query => {
    :filter => {
      :location_ids => [
        'ES0RJRZYEC39A'
      ],
      :customer_ids => [
        'JDKYHBWT1D4F8MFH63DBMEN8Y4'
      ]
    },
    :sort => {
      :field => 'INVOICE_SORT_DATE',
      :order => 'DESC'
    }
  }
}


result = invoices_api.search_invoices(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Invoice

Deletes the specified invoice. When an invoice is deleted, the
associated order status changes to CANCELED. You can only delete a draft
invoice (you cannot delete a published invoice, including one that is scheduled for processing).

```ruby
def delete_invoice(invoice_id:,
                   version: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the invoice to delete. |
| `version` | `Integer` | Query, Optional | The version of the [invoice](entity:Invoice) to delete.<br>If you do not know the version, you can call [GetInvoice](api-endpoint:Invoices-GetInvoice) or<br>[ListInvoices](api-endpoint:Invoices-ListInvoices). |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Delete Invoice Response Hash`](../../doc/models/delete-invoice-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'


result = invoices_api.delete_invoice(invoice_id: invoice_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Invoice

Retrieves an invoice by invoice ID.

```ruby
def get_invoice(invoice_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the invoice to retrieve. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Get Invoice Response Hash`](../../doc/models/get-invoice-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'


result = invoices_api.get_invoice(invoice_id: invoice_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Invoice

Updates an invoice. This endpoint supports sparse updates, so you only need
to specify the fields you want to change along with the required `version` field.
Some restrictions apply to updating invoices. For example, you cannot change the
`order_id` or `location_id` field.

```ruby
def update_invoice(invoice_id:,
                   body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the invoice to update. |
| `body` | [`Update Invoice Request Hash`](../../doc/models/update-invoice-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Update Invoice Response Hash`](../../doc/models/update-invoice-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'

body = {
  :invoice => {
    :version => 1,
    :payment_requests => [
      {
        :uid => '2da7964f-f3d2-4f43-81e8-5aa220bf3355',
        :tipping_enabled => false,
        :reminders => [
          {},
          {},
          {}
        ]
      }
    ]
  },
  :idempotency_key => '4ee82288-0910-499e-ab4c-5d0071dad1be'
}


result = invoices_api.update_invoice(
  invoice_id: invoice_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Invoice Attachment

Uploads a file and attaches it to an invoice. This endpoint accepts HTTP multipart/form-data file uploads
with a JSON `request` part and a `file` part. The `file` part must be a `readable stream` that contains a file
in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.

Invoices can have up to 10 attachments with a total file size of 25 MB. Attachments can be added only to invoices
in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.

```ruby
def create_invoice_attachment(invoice_id:,
                              request: nil,
                              image_file: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the [invoice](entity:Invoice) to attach the file to. |
| `request` | [`Create Invoice Attachment Request Hash`](../../doc/models/create-invoice-attachment-request.md) | Form (JSON-Encoded), Optional | Represents a [CreateInvoiceAttachment](../../doc/api/invoices.md#create-invoice-attachment) request. |
| `image_file` | `File \| UploadIO` | Form, Optional | - |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Invoice Attachment Response Hash`](../../doc/models/create-invoice-attachment-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'

request = {
  :idempotency_key => 'ae5e84f9-4742-4fc1-ba12-a3ce3748f1c3',
  :description => 'Service contract'
}


result = invoices_api.create_invoice_attachment(
  invoice_id: invoice_id,
  request: request
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Invoice Attachment

Removes an attachment from an invoice and permanently deletes the file. Attachments can be removed only
from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.

```ruby
def delete_invoice_attachment(invoice_id:,
                              attachment_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the [invoice](entity:Invoice) to delete the attachment from. |
| `attachment_id` | `String` | Template, Required | The ID of the [attachment](entity:InvoiceAttachment) to delete. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Delete Invoice Attachment Response Hash`](../../doc/models/delete-invoice-attachment-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'

attachment_id = 'attachment_id6'


result = invoices_api.delete_invoice_attachment(
  invoice_id: invoice_id,
  attachment_id: attachment_id
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Cancel Invoice

Cancels an invoice. The seller cannot collect payments for
the canceled invoice.

You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.

```ruby
def cancel_invoice(invoice_id:,
                   body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the [invoice](entity:Invoice) to cancel. |
| `body` | [`Cancel Invoice Request Hash`](../../doc/models/cancel-invoice-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Cancel Invoice Response Hash`](../../doc/models/cancel-invoice-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'

body = {
  :version => 0
}


result = invoices_api.cancel_invoice(
  invoice_id: invoice_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Publish Invoice

Publishes the specified draft invoice.

After an invoice is published, Square
follows up based on the invoice configuration. For example, Square
sends the invoice to the customer's email address, charges the customer's card on file, or does
nothing. Square also makes the invoice available on a Square-hosted invoice page.

The invoice `status` also changes from `DRAFT` to a status
based on the invoice configuration. For example, the status changes to `UNPAID` if
Square emails the invoice or `PARTIALLY_PAID` if Square charges a card on file for a portion of the
invoice amount.

In addition to the required `ORDERS_WRITE` and `INVOICES_WRITE` permissions, `CUSTOMERS_READ`
and `PAYMENTS_WRITE` are required when publishing invoices configured for card-on-file payments.

```ruby
def publish_invoice(invoice_id:,
                    body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invoice_id` | `String` | Template, Required | The ID of the invoice to publish. |
| `body` | [`Publish Invoice Request Hash`](../../doc/models/publish-invoice-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `\ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Publish Invoice Response Hash`](../../doc/models/publish-invoice-response.md).

## Example Usage

```ruby
invoice_id = 'invoice_id0'

body = {
  :version => 1,
  :idempotency_key => '32da42d0-1997-41b0-826b-f09464fc2c2e'
}


result = invoices_api.publish_invoice(
  invoice_id: invoice_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

