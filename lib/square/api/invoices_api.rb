module Square
  # InvoicesApi
  class InvoicesApi < BaseApi
    # Returns a list of invoices for a given location. The response
    # is paginated. If truncated, the response includes a `cursor` that you
    # use in a subsequent request to retrieve the next set of invoices.
    # @param [String] location_id Required parameter: The ID of the location for
    # which to list invoices.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint.  Provide this cursor to retrieve the
    # next set of results for your original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [Integer] limit Optional parameter: The maximum number of invoices
    # to return (200 is the maximum `limit`).  If not provided, the server uses
    # a default limit of 100 invoices.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_invoices(location_id:,
                      cursor: nil,
                      limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/invoices',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a draft [invoice]($m/Invoice)
    # for an order created using the Orders API.
    # A draft invoice remains in your account and no action is taken.
    # You must publish the invoice before Square can process it (send it to the
    # customer's email address or charge the customer’s card on file).
    # @param [CreateInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_invoice(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/invoices',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Searches for invoices from a location specified in
    # the filter. You can optionally specify customers in the filter for whom to
    # retrieve invoices. In the current implementation, you can only specify one
    # location and
    # optionally one customer.
    # The response is paginated. If truncated, the response includes a `cursor`
    # that you use in a subsequent request to retrieve the next set of invoices.
    # @param [SearchInvoicesRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_invoices(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/invoices/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deletes the specified invoice. When an invoice is deleted, the
    # associated order status changes to CANCELED. You can only delete a draft
    # invoice (you cannot delete a published invoice, including one that is
    # scheduled for processing).
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # delete.
    # @param [Integer] version Optional parameter: The version of the
    # [invoice](entity:Invoice) to delete. If you do not know the version, you
    # can call [GetInvoice](api-endpoint:Invoices-GetInvoice) or
    # [ListInvoices](api-endpoint:Invoices-ListInvoices).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_invoice(invoice_id:,
                       version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/invoices/{invoice_id}',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .query_param(new_parameter(version, key: 'version'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves an invoice by invoice ID.
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_invoice(invoice_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/invoices/{invoice_id}',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates an invoice. This endpoint supports sparse updates, so you only
    # need
    # to specify the fields you want to change along with the required `version`
    # field.
    # Some restrictions apply to updating invoices. For example, you cannot
    # change the
    # `order_id` or `location_id` field.
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # update.
    # @param [UpdateInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_invoice(invoice_id:,
                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/invoices/{invoice_id}',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Uploads a file and attaches it to an invoice. This endpoint accepts HTTP
    # multipart/form-data file uploads
    # with a JSON `request` part and a `file` part. The `file` part must be a
    # `readable stream` that contains a file
    # in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.
    # Invoices can have up to 10 attachments with a total file size of 25 MB.
    # Attachments can be added only to invoices
    # in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
    # @param [String] invoice_id Required parameter: The ID of the
    # [invoice](entity:Invoice) to attach the file to.
    # @param [CreateInvoiceAttachmentRequest] request Optional parameter:
    # Represents a
    # [CreateInvoiceAttachment]($e/Invoices/CreateInvoiceAttachment) request.
    # @param [File | UploadIO] image_file Optional parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_invoice_attachment(invoice_id:,
                                  request: nil,
                                  image_file: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/invoices/{invoice_id}/attachments',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .multipart_param(new_parameter(StringIO.new(request.to_json), key: 'request')
                                     .default_content_type('application/json; charset=utf-8'))
                   .multipart_param(new_parameter(image_file, key: 'image_file')
                                     .default_content_type('image/jpeg'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Removes an attachment from an invoice and permanently deletes the file.
    # Attachments can be removed only
    # from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID`
    # state.
    # @param [String] invoice_id Required parameter: The ID of the
    # [invoice](entity:Invoice) to delete the attachment from.
    # @param [String] attachment_id Required parameter: The ID of the
    # [attachment](entity:InvoiceAttachment) to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_invoice_attachment(invoice_id:,
                                  attachment_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/invoices/{invoice_id}/attachments/{attachment_id}',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .template_param(new_parameter(attachment_id, key: 'attachment_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Cancels an invoice. The seller cannot collect payments for
    # the canceled invoice.
    # You cannot cancel an invoice in the `DRAFT` state or in a terminal state:
    # `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
    # @param [String] invoice_id Required parameter: The ID of the
    # [invoice](entity:Invoice) to cancel.
    # @param [CancelInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_invoice(invoice_id:,
                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/invoices/{invoice_id}/cancel',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Publishes the specified draft invoice.
    # After an invoice is published, Square
    # follows up based on the invoice configuration. For example, Square
    # sends the invoice to the customer's email address, charges the customer's
    # card on file, or does
    # nothing. Square also makes the invoice available on a Square-hosted
    # invoice page.
    # The invoice `status` also changes from `DRAFT` to a status
    # based on the invoice configuration. For example, the status changes to
    # `UNPAID` if
    # Square emails the invoice or `PARTIALLY_PAID` if Square charges a card on
    # file for a portion of the
    # invoice amount.
    # In addition to the required `ORDERS_WRITE` and `INVOICES_WRITE`
    # permissions, `CUSTOMERS_READ`
    # and `PAYMENTS_WRITE` are required when publishing invoices configured for
    # card-on-file payments.
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # publish.
    # @param [PublishInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def publish_invoice(invoice_id:,
                        body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/invoices/{invoice_id}/publish',
                                     'default')
                   .template_param(new_parameter(invoice_id, key: 'invoice_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
