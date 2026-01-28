# frozen_string_literal: true

module Square
  module Invoices
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns a list of invoices for a given location. The response
      # is paginated. If truncated, the response includes a `cursor` that you
      # use in a subsequent request to retrieve the next set of invoices.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      #
      # @return [Square::Types::ListInvoicesResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[location_id cursor limit]
        query_params = {}
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :invoices,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/invoices",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListInvoicesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Creates a draft [invoice](entity:Invoice)
      # for an order created using the Orders API.
      #
      # A draft invoice remains in your account and no action is taken.
      # You must publish the invoice before Square can process it (send it to the customer's email address or charge the
      # customer’s card on file).
      #
      # @param request_options [Hash]
      # @param params [Square::Invoices::Types::CreateInvoiceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateInvoiceResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices",
          body: Square::Invoices::Types::CreateInvoiceRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateInvoiceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Searches for invoices from a location specified in
      # the filter. You can optionally specify customers in the filter for whom to
      # retrieve invoices. In the current implementation, you can only specify one location and
      # optionally one customer.
      #
      # The response is paginated. If truncated, the response includes a `cursor`
      # that you use in a subsequent request to retrieve the next set of invoices.
      #
      # @param request_options [Hash]
      # @param params [Square::Invoices::Types::SearchInvoicesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::SearchInvoicesResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/search",
          body: Square::Invoices::Types::SearchInvoicesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchInvoicesResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves an invoice by invoice ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      #
      # @return [Square::Types::GetInvoiceResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/invoices/#{params[:invoice_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetInvoiceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates an invoice. This endpoint supports sparse updates, so you only need
      # to specify the fields you want to change along with the required `version` field.
      # Some restrictions apply to updating invoices. For example, you cannot change the
      # `order_id` or `location_id` field.
      #
      # @param request_options [Hash]
      # @param params [Square::Invoices::Types::UpdateInvoiceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      #
      # @return [Square::Types::UpdateInvoiceResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Invoices::Types::UpdateInvoiceRequest.new(params).to_h
        non_body_param_names = ["invoice_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/invoices/#{params[:invoice_id]}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateInvoiceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes the specified invoice. When an invoice is deleted, the
      # associated order status changes to CANCELED. You can only delete a draft
      # invoice (you cannot delete a published invoice, including one that is scheduled for processing).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      # @option params [Integer, nil] :version
      #
      # @return [Square::Types::DeleteInvoiceResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[version]
        query_params = {}
        query_params["version"] = params[:version] if params.key?(:version)
        params = params.except(*query_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/invoices/#{params[:invoice_id]}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteInvoiceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Uploads a file and attaches it to an invoice. This endpoint accepts HTTP multipart/form-data file uploads
      # with a JSON `request` part and a `file` part. The `file` part must be a `readable stream` that contains a file
      # in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.
      #
      # Invoices can have up to 10 attachments with a total file size of 25 MB. Attachments can be added only to
      # invoices
      # in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
      #
      # __NOTE:__ When testing in the Sandbox environment, the total file size is limited to 1 KB.
      #
      # @param request_options [Hash]
      # @param params [void]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      #
      # @return [Square::Types::CreateInvoiceAttachmentResponse]
      def create_invoice_attachment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        body = Internal::Multipart::FormData.new

        if params[:request]
          body.add(
            name: "request",
            value: params[:request],
            content_type: "application/json; charset=utf-8"
          )
        end
        body.add_part(params[:image_file].to_form_data_part(name: "image_file")) if params[:image_file]

        request = Square::Internal::Multipart::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/#{params[:invoice_id]}/attachments",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateInvoiceAttachmentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Removes an attachment from an invoice and permanently deletes the file. Attachments can be removed only
      # from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      # @option params [String] :attachment_id
      #
      # @return [Square::Types::DeleteInvoiceAttachmentResponse]
      def delete_invoice_attachment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/invoices/#{params[:invoice_id]}/attachments/#{params[:attachment_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteInvoiceAttachmentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels an invoice. The seller cannot collect payments for
      # the canceled invoice.
      #
      # You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or
      # `FAILED`.
      #
      # @param request_options [Hash]
      # @param params [Square::Invoices::Types::CancelInvoiceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      #
      # @return [Square::Types::CancelInvoiceResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Invoices::Types::CancelInvoiceRequest.new(params).to_h
        non_body_param_names = ["invoice_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/#{params[:invoice_id]}/cancel",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CancelInvoiceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
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
      # @param request_options [Hash]
      # @param params [Square::Invoices::Types::PublishInvoiceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :invoice_id
      #
      # @return [Square::Types::PublishInvoiceResponse]
      def publish(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Invoices::Types::PublishInvoiceRequest.new(params).to_h
        non_body_param_names = ["invoice_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/#{params[:invoice_id]}/publish",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::PublishInvoiceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
