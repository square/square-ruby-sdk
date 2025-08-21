# frozen_string_literal: true

module Square
  module Invoices
    class Client
      # @return [Square::Invoices::Client]
      def initialize(client:)
        @client = client
      end

      # Returns a list of invoices for a given location. The response
      # is paginated. If truncated, the response includes a `cursor` that you
      # use in a subsequent request to retrieve the next set of invoices.
      #
      # @return [Square::Types::ListInvoicesResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[location_id cursor limit]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/invoices",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListInvoicesResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a draft [invoice](entity:Invoice)
      # for an order created using the Orders API.
      #
      # A draft invoice remains in your account and no action is taken.
      # You must publish the invoice before Square can process it (send it to the customer's email address or charge the customer’s card on file).
      #
      # @return [Square::Types::CreateInvoiceResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/invoices",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateInvoiceResponse.load(_response.body)
        end

        raise _response.body
      end

      # Searches for invoices from a location specified in
      # the filter. You can optionally specify customers in the filter for whom to
      # retrieve invoices. In the current implementation, you can only specify one location and
      # optionally one customer.
      #
      # The response is paginated. If truncated, the response includes a `cursor`
      # that you use in a subsequent request to retrieve the next set of invoices.
      #
      # @return [Square::Types::SearchInvoicesResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/invoices/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchInvoicesResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves an invoice by invoice ID.
      #
      # @return [Square::Types::GetInvoiceResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/invoices/#{params[:invoice_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetInvoiceResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates an invoice. This endpoint supports sparse updates, so you only need
      # to specify the fields you want to change along with the required `version` field.
      # Some restrictions apply to updating invoices. For example, you cannot change the
      # `order_id` or `location_id` field.
      #
      # @return [Square::Types::UpdateInvoiceResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["invoice_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/invoices/#{params[:invoice_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateInvoiceResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deletes the specified invoice. When an invoice is deleted, the
      # associated order status changes to CANCELED. You can only delete a draft
      # invoice (you cannot delete a published invoice, including one that is scheduled for processing).
      #
      # @return [Square::Types::DeleteInvoiceResponse]
      def delete(request_options: {}, **params)
        _query_param_names = ["version"]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/invoices/#{params[:invoice_id]}",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteInvoiceResponse.load(_response.body)
        end

        raise _response.body
      end

      # Uploads a file and attaches it to an invoice. This endpoint accepts HTTP multipart/form-data file uploads
      # with a JSON `request` part and a `file` part. The `file` part must be a `readable stream` that contains a file
      # in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.
      #
      # Invoices can have up to 10 attachments with a total file size of 25 MB. Attachments can be added only to invoices
      # in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
      #
      # __NOTE:__ When testing in the Sandbox environment, the total file size is limited to 1 KB.
      #
      # @return [Square::Types::CreateInvoiceAttachmentResponse]
      def create_invoice_attachment(request_options: {}, **params)
        body = Internal::Multipart::FormData.new

        if params[:request]
          body.add(
            name: "request",
            value: params[:request],
            content_type: "application/json; charset=utf-8"
          )
        end
        body.add_part(params[:image_file].to_form_data_part(name: "image_file")) if params[:image_file]

        _request = Square::Internal::Multipart::Request.new(
          method: POST,
          path: "v2/invoices/#{params[:invoice_id]}/attachments",
          body: body
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateInvoiceAttachmentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Removes an attachment from an invoice and permanently deletes the file. Attachments can be removed only
      # from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
      #
      # @return [Square::Types::DeleteInvoiceAttachmentResponse]
      def delete_invoice_attachment(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/invoices/#{params[:invoice_id]}/attachments/#{params[:attachment_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteInvoiceAttachmentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Cancels an invoice. The seller cannot collect payments for
      # the canceled invoice.
      #
      # You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
      #
      # @return [Square::Types::CancelInvoiceResponse]
      def cancel(request_options: {}, **params)
        _path_param_names = ["invoice_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/invoices/#{params[:invoice_id]}/cancel",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelInvoiceResponse.load(_response.body)
        end

        raise _response.body
      end

      # Publishes the specified draft invoice.
      #
      # After an invoice is published, Square
      # follows up based on the invoice configuration. For example, Square
      # sends the invoice to the customer's email address, charges the customer's card on file, or does
      # nothing. Square also makes the invoice available on a Square-hosted invoice page.
      #
      # The invoice `status` also changes from `DRAFT` to a status
      # based on the invoice configuration. For example, the status changes to `UNPAID` if
      # Square emails the invoice or `PARTIALLY_PAID` if Square charges a card on file for a portion of the
      # invoice amount.
      #
      # In addition to the required `ORDERS_WRITE` and `INVOICES_WRITE` permissions, `CUSTOMERS_READ`
      # and `PAYMENTS_WRITE` are required when publishing invoices configured for card-on-file payments.
      #
      # @return [Square::Types::PublishInvoiceResponse]
      def publish(request_options: {}, **params)
        _path_param_names = ["invoice_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/invoices/#{params[:invoice_id]}/publish",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::PublishInvoiceResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
