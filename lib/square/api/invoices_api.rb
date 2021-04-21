module Square
  # InvoicesApi
  class InvoicesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Returns a list of invoices for a given location. The response
    # is paginated. If truncated, the response includes a `cursor` that you
    # use in a subsequent request to retrieve the next set of invoices.
    # @param [String] location_id Required parameter: The ID of the location for
    # which to list invoices.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint.  Provide this cursor to retrieve the
    # next set of results for your original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [Integer] limit Optional parameter: The maximum number of invoices
    # to return (200 is the maximum `limit`).  If not provided, the server uses
    # a default limit of 100 invoices.
    # @return [ListInvoicesResponse Hash] response from the API call
    def list_invoices(location_id:,
                      cursor: nil,
                      limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id,
        'cursor' => cursor,
        'limit' => limit
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Deletes the specified invoice. When an invoice is deleted, the
    # associated order status changes to CANCELED. You can only delete a draft
    # invoice (you cannot delete a published invoice, including one that is
    # scheduled for processing).
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # delete.
    # @param [Integer] version Optional parameter: The version of the
    # [invoice]($m/Invoice) to delete. If you do not know the version, you can
    # call [GetInvoice]($e/Invoices/GetInvoice) or 
    # [ListInvoices]($e/Invoices/ListInvoices).
    # @return [DeleteInvoiceResponse Hash] response from the API call
    def delete_invoice(invoice_id:,
                       version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices/{invoice_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'invoice_id' => { 'value' => invoice_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'version' => version
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves an invoice by invoice ID.
    # @param [String] invoice_id Required parameter: The ID of the invoice to
    # retrieve.
    # @return [GetInvoiceResponse Hash] response from the API call
    def get_invoice(invoice_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices/{invoice_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'invoice_id' => { 'value' => invoice_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices/{invoice_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'invoice_id' => { 'value' => invoice_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Cancels an invoice. The seller cannot collect payments for
    # the canceled invoice.
    # You cannot cancel an invoice in the `DRAFT` state or in a terminal state:
    # `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
    # @param [String] invoice_id Required parameter: The ID of the
    # [invoice]($m/Invoice) to cancel.
    # @param [CancelInvoiceRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CancelInvoiceResponse Hash] response from the API call
    def cancel_invoice(invoice_id:,
                       body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices/{invoice_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'invoice_id' => { 'value' => invoice_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/invoices/{invoice_id}/publish'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'invoice_id' => { 'value' => invoice_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
