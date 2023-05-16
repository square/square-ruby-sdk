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
    # @return [ListInvoicesResponse Hash] response from the API call
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
    # @return [CreateInvoiceResponse Hash] response from the API call
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
    # @return [SearchInvoicesResponse Hash] response from the API call
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
    # @return [DeleteInvoiceResponse Hash] response from the API call
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
    # @return [GetInvoiceResponse Hash] response from the API call
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

    # Updates an invoice by modifying fields, clearing fields, or both. For most
    # updates, you can use a sparse
    # `Invoice` object to add fields or change values and use the
    # `fields_to_clear` field to specify fields to clear.
    # However, some restrictions apply. For example, you cannot change the
    # `order_id` or `location_id` field and you
    # must provide the complete `custom_fields` list to update a custom field.
    # Published invoices have additional restrictions.
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # update.
    # @param [UpdateInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateInvoiceResponse Hash] response from the API call
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

    # Cancels an invoice. The seller cannot collect payments for
    # the canceled invoice.
    # You cannot cancel an invoice in the `DRAFT` state or in a terminal state:
    # `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
    # @param [String] invoice_id Required parameter: The ID of the
    # [invoice](entity:Invoice) to cancel.
    # @param [CancelInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CancelInvoiceResponse Hash] response from the API call
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
    # Square emails the invoice or `PARTIALLY_PAID` if Square charge a card on
    # file for a portion of the
    # invoice amount.
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # publish.
    # @param [PublishInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [PublishInvoiceResponse Hash] response from the API call
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
