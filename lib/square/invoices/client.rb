
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
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListInvoicesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Creates a draft [invoice](entity:Invoice) 
      # for an order created using the Orders API.
      # 
      # A draft invoice remains in your account and no action is taken. 
      # You must publish the invoice before Square can process it (send it to the customer's email address or charge the customer’s card on file).
      #
      # @return [Square::Types::CreateInvoiceResponse]
      def create(request_options: {}, **params)
        response = @client.send(
          Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            path: "/v2/invoices",
            method: "POST",
            body: params,
            request_options: request_options
          )
        )
        if response.code >= "200" && response.code < "300"
          return Square::Types::CreateInvoiceResponse.load(response.body)
        else
          raise response.body
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
      # @return [Square::Types::SearchInvoicesResponse]
      def search(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchInvoicesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves an invoice by invoice ID.
      #
      # @return [Square::Types::GetInvoiceResponse]
      def get(request_options: {}, **params)
        response = @client.send(
          Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            path: "/v2/invoices/#{params[:invoice_id]}",
            method: "GET",
            request_options: request_options
          )
        )
        if response.code >= "200" && response.code < "300"
          return Square::Types::GetInvoiceResponse.load(response.body)
        else
          raise response.body
        end
      end

      # Updates an invoice. This endpoint supports sparse updates, so you only need
      # to specify the fields you want to change along with the required `version` field.
      # Some restrictions apply to updating invoices. For example, you cannot change the
      # `order_id` or `location_id` field.
      #
      # @return [Square::Types::UpdateInvoiceResponse]
      def update(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateInvoiceResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Deletes the specified invoice. When an invoice is deleted, the 
      # associated order status changes to CANCELED. You can only delete a draft 
      # invoice (you cannot delete a published invoice, including one that is scheduled for processing).
      #
      # @return [Square::Types::DeleteInvoiceResponse]
      def delete(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteInvoiceResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Create an invoice attachment.
      #
      # @option invoice_id [String] The ID of the invoice to attach the file to.
      # @option request [Square::Invoices::CreateInvoiceAttachmentRequest, Hash[Symbol=>Object], nil] The request object.
      # @option image_file [Square::FileParam, nil] The image file to attach.
      # @option request_options [Square::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Square::Invoices::CreateInvoiceAttachmentResponse]
      def create_invoice_attachment(request_options: {}, **params)
        body = Internal::Multipart::FormData.new

        if params[:request]
          body.add(
            name: "request",
            value: JSON.generate(Types::CreateInvoiceAttachmentRequest.new(params[:request]).to_h),
            content_type: "application/json; charset=utf-8"
          )
        end

        if params[:image_file]
          body.add_part(params[:image_file].to_form_data_part(name: "image_file",
                                                              content_type: "image/jpeg"))
        end

        response = @client.send(
          Square::Internal::Multipart::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            path: "/v2/invoices/#{params[:invoice_id]}/attachments",
            method: "POST",
            body: body,
            request_options: request_options
          )
        )
        if response.code >= "200" && response.code < "300"
          Square::Types::CreateInvoiceAttachmentResponse.load(response.body)
        else
          raise response.body
        end
      end

      # Removes an attachment from an invoice and permanently deletes the file. Attachments can be removed only
      # from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
      #
      # @return [Square::Types::DeleteInvoiceAttachmentResponse]
      def delete_invoice_attachment(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteInvoiceAttachmentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Cancels an invoice. The seller cannot collect payments for 
      # the canceled invoice.
      # 
      # You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
      #
      # @return [Square::Types::CancelInvoiceResponse]
      def cancel(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelInvoiceResponse.load(_response.body)
        else
          raise _response.body
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
      # @return [Square::Types::PublishInvoiceResponse]
      def publish(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::PublishInvoiceResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
