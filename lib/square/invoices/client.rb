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
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Invoice` in the `invoices`
      # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListInvoicesResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
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
      # @example
      #   client.invoices.list(
      #     location_id: "location_id",
      #     cursor: "cursor",
      #     limit: 1
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :invoices,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListInvoicesResponse.load(response.body))
            [parsed_response, response]
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
      # @example
      #   client.invoices.create(
      #     invoice: {
      #       location_id: "ES0RJRZYEC39A",
      #       order_id: "CAISENgvlJ6jLWAzERDzjyHVybY",
      #       primary_recipient: {
      #         customer_id: "JDKYHBWT1D4F8MFH63DBMEN8Y4"
      #       },
      #       payment_requests: [{
      #         request_type: "BALANCE",
      #         due_date: "2030-01-24",
      #         tipping_enabled: true,
      #         automatic_payment_source: "NONE",
      #         reminders: [{
      #           relative_scheduled_days: -1,
      #           message: "Your invoice is due tomorrow"
      #         }]
      #       }],
      #       delivery_method: "EMAIL",
      #       invoice_number: "inv-100",
      #       title: "Event Planning Services",
      #       description: "We appreciate your business!",
      #       scheduled_at: "2030-01-13T10:00:00Z",
      #       accepted_payment_methods: {
      #         card: true,
      #         square_gift_card: false,
      #         bank_account: false,
      #         buy_now_pay_later: false,
      #         cash_app_pay: false
      #       },
      #       custom_fields: [{
      #         label: "Event Reference Number",
      #         value: "Ref. #1234",
      #         placement: "ABOVE_LINE_ITEMS"
      #       }, {
      #         label: "Terms of Service",
      #         value: "The terms of service are...",
      #         placement: "BELOW_LINE_ITEMS"
      #       }],
      #       sale_or_service_date: "2030-01-24",
      #       store_payment_method_enabled: false
      #     },
      #     idempotency_key: "ce3748f9-5fc1-4762-aa12-aae5e843f1f4"
      #   )
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
          (response.body.to_s.empty? ? nil : Square::Types::CreateInvoiceResponse.load(response.body))
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
      # @example
      #   client.invoices.search(
      #     query: {
      #       filter: {
      #         location_ids: ["ES0RJRZYEC39A"],
      #         customer_ids: ["JDKYHBWT1D4F8MFH63DBMEN8Y4"]
      #       },
      #       sort: {
      #         field: "INVOICE_SORT_DATE",
      #         order: "DESC"
      #       }
      #     },
      #     limit: 100
      #   )
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
          (response.body.to_s.empty? ? nil : Square::Types::SearchInvoicesResponse.load(response.body))
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
      # @example
      #   client.invoices.get(invoice_id: "invoice_id")
      #
      # @return [Square::Types::GetInvoiceResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetInvoiceResponse.load(response.body))
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
      # @example
      #   client.invoices.update(
      #     invoice_id: "invoice_id",
      #     invoice: {
      #       version: 1,
      #       payment_requests: [{
      #         uid: "2da7964f-f3d2-4f43-81e8-5aa220bf3355",
      #         tipping_enabled: false
      #       }]
      #     },
      #     idempotency_key: "4ee82288-0910-499e-ab4c-5d0071dad1be"
      #   )
      #
      # @return [Square::Types::UpdateInvoiceResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Invoices::Types::UpdateInvoiceRequest.new(params).to_h
        non_body_param_names = %w[invoice_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::UpdateInvoiceResponse.load(response.body))
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
      # @example
      #   client.invoices.delete(
      #     invoice_id: "invoice_id",
      #     version: 1
      #   )
      #
      # @return [Square::Types::DeleteInvoiceResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["version"] = params[:version] if params.key?(:version)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::DeleteInvoiceResponse.load(response.body))
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
      # @example
      #   client.invoices.create_invoice_attachment(invoice_id: "invoice_id")
      #
      # @return [Square::Types::CreateInvoiceAttachmentResponse]
      def create_invoice_attachment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        body = Internal::Multipart::FormData.new

        unless params[:request].nil?
          body.add(
            name: "request",
            value: params[:request],
            content_type: "application/json; charset=utf-8"
          )
        end
        if params[:image_file]
          body.add_file(
            name: "image_file",
            file: params[:image_file],
            content_type: "image/jpeg"
          )
        end

        request = Square::Internal::Multipart::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}/attachments",
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
          (response.body.to_s.empty? ? nil : Square::Types::CreateInvoiceAttachmentResponse.load(response.body))
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
      # @example
      #   client.invoices.delete_invoice_attachment(
      #     invoice_id: "invoice_id",
      #     attachment_id: "attachment_id"
      #   )
      #
      # @return [Square::Types::DeleteInvoiceAttachmentResponse]
      def delete_invoice_attachment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}/attachments/#{URI.encode_uri_component(params[:attachment_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DeleteInvoiceAttachmentResponse.load(response.body))
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
      # @example
      #   client.invoices.cancel(
      #     invoice_id: "invoice_id",
      #     version: 0
      #   )
      #
      # @return [Square::Types::CancelInvoiceResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Invoices::Types::CancelInvoiceRequest.new(params).to_h
        non_body_param_names = %w[invoice_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}/cancel",
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
          (response.body.to_s.empty? ? nil : Square::Types::CancelInvoiceResponse.load(response.body))
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
      # @example
      #   client.invoices.publish(
      #     invoice_id: "invoice_id",
      #     version: 1,
      #     idempotency_key: "32da42d0-1997-41b0-826b-f09464fc2c2e"
      #   )
      #
      # @return [Square::Types::PublishInvoiceResponse]
      def publish(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Invoices::Types::PublishInvoiceRequest.new(params).to_h
        non_body_param_names = %w[invoice_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/invoices/#{URI.encode_uri_component(params[:invoice_id].to_s)}/publish",
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
          (response.body.to_s.empty? ? nil : Square::Types::PublishInvoiceResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
