# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/list_invoices_response"
require_relative "../types/invoice"
require_relative "../types/create_invoice_response"
require_relative "../types/invoice_query"
require_relative "../types/search_invoices_response"
require_relative "../types/get_invoice_response"
require_relative "../types/update_invoice_response"
require_relative "../types/delete_invoice_response"
require_relative "../types/create_invoice_attachment_request_data"
require_relative "../types/create_invoice_attachment_response"
require_relative "../../core/file_utilities"
require_relative "../types/delete_invoice_attachment_response"
require_relative "../types/cancel_invoice_response"
require_relative "../types/publish_invoice_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class InvoicesClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::InvoicesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of invoices for a given location. The response
#  is paginated. If truncated, the response includes a `cursor` that you
#  use in a subsequent request to retrieve the next set of invoices.
    #
    # @param location_id [String] The ID of the location for which to list invoices.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The maximum number of invoices to return (200 is the maximum `limit`).
#  If not provided, the server uses a default limit of 100 invoices.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListInvoicesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.list(location_id: "location_id")
    def list(location_id:, cursor: nil, limit: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices"
end
      SquareApiClient::ListInvoicesResponse.from_json(json_object: response.body)
    end
# Creates a draft [invoice](entity:Invoice)
#  for an order created using the Orders API.
#  A draft invoice remains in your account and no action is taken.
#  You must publish the invoice before Square can process it (send it to the
#  customer's email address or charge the customer’s card on file).
    #
    # @param invoice [Hash] The invoice to create.Request of type SquareApiClient::Invoice, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :location_id (String) 
    #   * :order_id (String) 
    #   * :primary_recipient (Hash)
    #     * :customer_id (String) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :address (Hash)
    #       * :address_line_1 (String) 
    #       * :address_line_2 (String) 
    #       * :address_line_3 (String) 
    #       * :locality (String) 
    #       * :sublocality (String) 
    #       * :sublocality_2 (String) 
    #       * :sublocality_3 (String) 
    #       * :administrative_district_level_1 (String) 
    #       * :administrative_district_level_2 (String) 
    #       * :administrative_district_level_3 (String) 
    #       * :postal_code (String) 
    #       * :country (SquareApiClient::Country) 
    #       * :first_name (String) 
    #       * :last_name (String) 
    #     * :phone_number (String) 
    #     * :company_name (String) 
    #     * :tax_ids (Hash)
    #       * :eu_vat (String) 
    #   * :payment_requests (Array<SquareApiClient::InvoicePaymentRequest>) 
    #   * :delivery_method (SquareApiClient::InvoiceDeliveryMethod) 
    #   * :invoice_number (String) 
    #   * :title (String) 
    #   * :description (String) 
    #   * :scheduled_at (String) 
    #   * :public_url (String) 
    #   * :next_payment_amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    #   * :status (SquareApiClient::InvoiceStatus) 
    #   * :timezone (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :accepted_payment_methods (Hash)
    #     * :card (Boolean) 
    #     * :square_gift_card (Boolean) 
    #     * :bank_account (Boolean) 
    #     * :buy_now_pay_later (Boolean) 
    #     * :cash_app_pay (Boolean) 
    #   * :custom_fields (Array<SquareApiClient::InvoiceCustomField>) 
    #   * :subscription_id (String) 
    #   * :sale_or_service_date (String) 
    #   * :payment_conditions (String) 
    #   * :store_payment_method_enabled (Boolean) 
    #   * :attachments (Array<SquareApiClient::InvoiceAttachment>) 
    #   * :creator_team_member_id (String) 
    # @param idempotency_key [String] A unique string that identifies the `CreateInvoice` request. If you do not
#  provide `idempotency_key` (or provide an empty string as the value), the
#  endpoint
#  treats each request as independent.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.create(invoice: { location_id: "ES0RJRZYEC39A", order_id: "CAISENgvlJ6jLWAzERDzjyHVybY", primary_recipient: { customer_id: "JDKYHBWT1D4F8MFH63DBMEN8Y4" }, payment_requests: [{ request_type: BALANCE, due_date: "2030-01-24", tipping_enabled: true, automatic_payment_source: NONE, reminders: [{ relative_scheduled_days: -1, message: "Your invoice is due tomorrow" }] }], delivery_method: EMAIL, invoice_number: "inv-100", title: "Event Planning Services", description: "We appreciate your business!", scheduled_at: "2030-01-13T10:00:00Z", accepted_payment_methods: { card: true, square_gift_card: false, bank_account: false, buy_now_pay_later: false, cash_app_pay: false }, custom_fields: [{ label: "Event Reference Number", value: "Ref. #1234", placement: ABOVE_LINE_ITEMS }, { label: "Terms of Service", value: "The terms of service are...", placement: BELOW_LINE_ITEMS }], sale_or_service_date: "2030-01-24", store_payment_method_enabled: false }, idempotency_key: "ce3748f9-5fc1-4762-aa12-aae5e843f1f4")
    def create(invoice:, idempotency_key: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), invoice: invoice, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices"
end
      SquareApiClient::CreateInvoiceResponse.from_json(json_object: response.body)
    end
# Searches for invoices from a location specified in
#  the filter. You can optionally specify customers in the filter for whom to
#  retrieve invoices. In the current implementation, you can only specify one
#  location and
#  optionally one customer.
#  The response is paginated. If truncated, the response includes a `cursor`
#  that you use in a subsequent request to retrieve the next set of invoices.
    #
    # @param query [Hash] Describes the query criteria for searching invoices.Request of type SquareApiClient::InvoiceQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :customer_ids (Array<String>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::INVOICE_SORT_FIELD) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param limit [Integer] The maximum number of invoices to return (200 is the maximum `limit`).
#  If not provided, the server uses a default limit of 100 invoices.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchInvoicesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.search(query: { filter: { location_ids: ["ES0RJRZYEC39A"], customer_ids: ["JDKYHBWT1D4F8MFH63DBMEN8Y4"] }, sort: { field: "INVOICE_SORT_DATE", order: DESC } }, limit: 100)
    def search(query:, limit: nil, cursor: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/search"
end
      SquareApiClient::SearchInvoicesResponse.from_json(json_object: response.body)
    end
# Retrieves an invoice by invoice ID.
    #
    # @param invoice_id [String] The ID of the invoice to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.get(invoice_id: "invoice_id")
    def get(invoice_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}"
end
      SquareApiClient::GetInvoiceResponse.from_json(json_object: response.body)
    end
# Updates an invoice. This endpoint supports sparse updates, so you only need
#  to specify the fields you want to change along with the required `version`
#  field.
#  Some restrictions apply to updating invoices. For example, you cannot change the
#  `order_id` or `location_id` field.
    #
    # @param invoice_id [String] The ID of the invoice to update.
    # @param invoice [Hash] The invoice fields to add, change, or clear. Fields can be cleared using
#  null values or the `remove` field (for individual payment requests or
#  reminders).
#  The current invoice `version` is also required. For more information, including
#  requirements,
#  limitations, and more examples, see [Update an
#  Invoice](https://developer.squareup.com/docs/invoices-api/update-invoices).Request of type SquareApiClient::Invoice, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :location_id (String) 
    #   * :order_id (String) 
    #   * :primary_recipient (Hash)
    #     * :customer_id (String) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :address (Hash)
    #       * :address_line_1 (String) 
    #       * :address_line_2 (String) 
    #       * :address_line_3 (String) 
    #       * :locality (String) 
    #       * :sublocality (String) 
    #       * :sublocality_2 (String) 
    #       * :sublocality_3 (String) 
    #       * :administrative_district_level_1 (String) 
    #       * :administrative_district_level_2 (String) 
    #       * :administrative_district_level_3 (String) 
    #       * :postal_code (String) 
    #       * :country (SquareApiClient::Country) 
    #       * :first_name (String) 
    #       * :last_name (String) 
    #     * :phone_number (String) 
    #     * :company_name (String) 
    #     * :tax_ids (Hash)
    #       * :eu_vat (String) 
    #   * :payment_requests (Array<SquareApiClient::InvoicePaymentRequest>) 
    #   * :delivery_method (SquareApiClient::InvoiceDeliveryMethod) 
    #   * :invoice_number (String) 
    #   * :title (String) 
    #   * :description (String) 
    #   * :scheduled_at (String) 
    #   * :public_url (String) 
    #   * :next_payment_amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    #   * :status (SquareApiClient::InvoiceStatus) 
    #   * :timezone (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :accepted_payment_methods (Hash)
    #     * :card (Boolean) 
    #     * :square_gift_card (Boolean) 
    #     * :bank_account (Boolean) 
    #     * :buy_now_pay_later (Boolean) 
    #     * :cash_app_pay (Boolean) 
    #   * :custom_fields (Array<SquareApiClient::InvoiceCustomField>) 
    #   * :subscription_id (String) 
    #   * :sale_or_service_date (String) 
    #   * :payment_conditions (String) 
    #   * :store_payment_method_enabled (Boolean) 
    #   * :attachments (Array<SquareApiClient::InvoiceAttachment>) 
    #   * :creator_team_member_id (String) 
    # @param idempotency_key [String] A unique string that identifies the `UpdateInvoice` request. If you do not
#  provide `idempotency_key` (or provide an empty string as the value), the
#  endpoint
#  treats each request as independent.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param fields_to_clear [Array<String>] The list of fields to clear. Although this field is currently supported, we
#  recommend using null values or the `remove` field when possible. For examples,
#  see
#  [Update an
#  Invoice](https://developer.squareup.com/docs/invoices-api/update-invoices).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.update(
#    invoice_id: "invoice_id",
#    invoice: { version: 1, payment_requests: [{ uid: "2da7964f-f3d2-4f43-81e8-5aa220bf3355", tipping_enabled: false }] },
#    idempotency_key: "4ee82288-0910-499e-ab4c-5d0071dad1be"
#  )
    def update(invoice_id:, invoice:, idempotency_key: nil, fields_to_clear: nil, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), invoice: invoice, idempotency_key: idempotency_key, fields_to_clear: fields_to_clear }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}"
end
      SquareApiClient::UpdateInvoiceResponse.from_json(json_object: response.body)
    end
# Deletes the specified invoice. When an invoice is deleted, the
#  associated order status changes to CANCELED. You can only delete a draft
#  invoice (you cannot delete a published invoice, including one that is scheduled
#  for processing).
    #
    # @param invoice_id [String] The ID of the invoice to delete.
    # @param version [Integer] The version of the [invoice](entity:Invoice) to delete.
#  If you do not know the version, you can call
#  [GetInvoice](api-endpoint:Invoices-GetInvoice) or
#  [ListInvoices](api-endpoint:Invoices-ListInvoices).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.delete(invoice_id: "invoice_id")
    def delete(invoice_id:, version: nil, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}"
end
      SquareApiClient::DeleteInvoiceResponse.from_json(json_object: response.body)
    end
# Uploads a file and attaches it to an invoice. This endpoint accepts HTTP
#  multipart/form-data file uploads
#  with a JSON `request` part and a `file` part. The `file` part must be a
#  `readable stream` that contains a file
#  in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.
#  Invoices can have up to 10 attachments with a total file size of 25 MB.
#  Attachments can be added only to invoices
#  in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
#  __NOTE:__ When testing in the Sandbox environment, the total file size is
#  limited to 1 KB.
    #
    # @param invoice_id [String] The ID of the [invoice](entity:Invoice) to attach the file to.
    # @param request [Hash] Request of type SquareApiClient::CreateInvoiceAttachmentRequestData, as a Hash
    #   * :idempotency_key (String) 
    #   * :description (String) 
    # @param image_file [String, IO] 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateInvoiceAttachmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.create_invoice_attachment(invoice_id: "invoice_id", image_file: my_file.txt)
    def create_invoice_attachment(invoice_id:, request: nil, image_file: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  SquareApiClient::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/attachments"
end
      SquareApiClient::CreateInvoiceAttachmentResponse.from_json(json_object: response.body)
    end
# Removes an attachment from an invoice and permanently deletes the file.
#  Attachments can be removed only
#  from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
    #
    # @param invoice_id [String] The ID of the [invoice](entity:Invoice) to delete the attachment from.
    # @param attachment_id [String] The ID of the [attachment](entity:InvoiceAttachment) to delete.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteInvoiceAttachmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.delete_invoice_attachment(invoice_id: "invoice_id", attachment_id: "attachment_id")
    def delete_invoice_attachment(invoice_id:, attachment_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/attachments/#{attachment_id}"
end
      SquareApiClient::DeleteInvoiceAttachmentResponse.from_json(json_object: response.body)
    end
# Cancels an invoice. The seller cannot collect payments for
#  the canceled invoice.
#  You cannot cancel an invoice in the `DRAFT` state or in a terminal state:
#  `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
    #
    # @param invoice_id [String] The ID of the [invoice](entity:Invoice) to cancel.
    # @param version [Integer] The version of the [invoice](entity:Invoice) to cancel.
#  If you do not know the version, you can call
#  [GetInvoice](api-endpoint:Invoices-GetInvoice) or
#  [ListInvoices](api-endpoint:Invoices-ListInvoices).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CancelInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.cancel(invoice_id: "invoice_id", version: 0)
    def cancel(invoice_id:, version:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), version: version }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/cancel"
end
      SquareApiClient::CancelInvoiceResponse.from_json(json_object: response.body)
    end
# Publishes the specified draft invoice.
#  After an invoice is published, Square
#  follows up based on the invoice configuration. For example, Square
#  sends the invoice to the customer's email address, charges the customer's card
#  on file, or does
#  nothing. Square also makes the invoice available on a Square-hosted invoice
#  page.
#  The invoice `status` also changes from `DRAFT` to a status
#  based on the invoice configuration. For example, the status changes to `UNPAID`
#  if
#  Square emails the invoice or `PARTIALLY_PAID` if Square charges a card on file
#  for a portion of the
#  invoice amount.
#  In addition to the required `ORDERS_WRITE` and `INVOICES_WRITE` permissions,
#  `CUSTOMERS_READ`
#  and `PAYMENTS_WRITE` are required when publishing invoices configured for
#  card-on-file payments.
    #
    # @param invoice_id [String] The ID of the invoice to publish.
    # @param version [Integer] The version of the [invoice](entity:Invoice) to publish.
#  This must match the current version of the invoice; otherwise, the request is
#  rejected.
    # @param idempotency_key [String] A unique string that identifies the `PublishInvoice` request. If you do not
#  provide `idempotency_key` (or provide an empty string as the value), the
#  endpoint
#  treats each request as independent.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::PublishInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.publish(
#    invoice_id: "invoice_id",
#    version: 1,
#    idempotency_key: "32da42d0-1997-41b0-826b-f09464fc2c2e"
#  )
    def publish(invoice_id:, version:, idempotency_key: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), version: version, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/publish"
end
      SquareApiClient::PublishInvoiceResponse.from_json(json_object: response.body)
    end
  end
  class AsyncInvoicesClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncInvoicesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of invoices for a given location. The response
#  is paginated. If truncated, the response includes a `cursor` that you
#  use in a subsequent request to retrieve the next set of invoices.
    #
    # @param location_id [String] The ID of the location for which to list invoices.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The maximum number of invoices to return (200 is the maximum `limit`).
#  If not provided, the server uses a default limit of 100 invoices.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListInvoicesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.list(location_id: "location_id")
    def list(location_id:, cursor: nil, limit: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices"
end
        SquareApiClient::ListInvoicesResponse.from_json(json_object: response.body)
      end
    end
# Creates a draft [invoice](entity:Invoice)
#  for an order created using the Orders API.
#  A draft invoice remains in your account and no action is taken.
#  You must publish the invoice before Square can process it (send it to the
#  customer's email address or charge the customer’s card on file).
    #
    # @param invoice [Hash] The invoice to create.Request of type SquareApiClient::Invoice, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :location_id (String) 
    #   * :order_id (String) 
    #   * :primary_recipient (Hash)
    #     * :customer_id (String) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :address (Hash)
    #       * :address_line_1 (String) 
    #       * :address_line_2 (String) 
    #       * :address_line_3 (String) 
    #       * :locality (String) 
    #       * :sublocality (String) 
    #       * :sublocality_2 (String) 
    #       * :sublocality_3 (String) 
    #       * :administrative_district_level_1 (String) 
    #       * :administrative_district_level_2 (String) 
    #       * :administrative_district_level_3 (String) 
    #       * :postal_code (String) 
    #       * :country (SquareApiClient::Country) 
    #       * :first_name (String) 
    #       * :last_name (String) 
    #     * :phone_number (String) 
    #     * :company_name (String) 
    #     * :tax_ids (Hash)
    #       * :eu_vat (String) 
    #   * :payment_requests (Array<SquareApiClient::InvoicePaymentRequest>) 
    #   * :delivery_method (SquareApiClient::InvoiceDeliveryMethod) 
    #   * :invoice_number (String) 
    #   * :title (String) 
    #   * :description (String) 
    #   * :scheduled_at (String) 
    #   * :public_url (String) 
    #   * :next_payment_amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    #   * :status (SquareApiClient::InvoiceStatus) 
    #   * :timezone (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :accepted_payment_methods (Hash)
    #     * :card (Boolean) 
    #     * :square_gift_card (Boolean) 
    #     * :bank_account (Boolean) 
    #     * :buy_now_pay_later (Boolean) 
    #     * :cash_app_pay (Boolean) 
    #   * :custom_fields (Array<SquareApiClient::InvoiceCustomField>) 
    #   * :subscription_id (String) 
    #   * :sale_or_service_date (String) 
    #   * :payment_conditions (String) 
    #   * :store_payment_method_enabled (Boolean) 
    #   * :attachments (Array<SquareApiClient::InvoiceAttachment>) 
    #   * :creator_team_member_id (String) 
    # @param idempotency_key [String] A unique string that identifies the `CreateInvoice` request. If you do not
#  provide `idempotency_key` (or provide an empty string as the value), the
#  endpoint
#  treats each request as independent.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.create(invoice: { location_id: "ES0RJRZYEC39A", order_id: "CAISENgvlJ6jLWAzERDzjyHVybY", primary_recipient: { customer_id: "JDKYHBWT1D4F8MFH63DBMEN8Y4" }, payment_requests: [{ request_type: BALANCE, due_date: "2030-01-24", tipping_enabled: true, automatic_payment_source: NONE, reminders: [{ relative_scheduled_days: -1, message: "Your invoice is due tomorrow" }] }], delivery_method: EMAIL, invoice_number: "inv-100", title: "Event Planning Services", description: "We appreciate your business!", scheduled_at: "2030-01-13T10:00:00Z", accepted_payment_methods: { card: true, square_gift_card: false, bank_account: false, buy_now_pay_later: false, cash_app_pay: false }, custom_fields: [{ label: "Event Reference Number", value: "Ref. #1234", placement: ABOVE_LINE_ITEMS }, { label: "Terms of Service", value: "The terms of service are...", placement: BELOW_LINE_ITEMS }], sale_or_service_date: "2030-01-24", store_payment_method_enabled: false }, idempotency_key: "ce3748f9-5fc1-4762-aa12-aae5e843f1f4")
    def create(invoice:, idempotency_key: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), invoice: invoice, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices"
end
        SquareApiClient::CreateInvoiceResponse.from_json(json_object: response.body)
      end
    end
# Searches for invoices from a location specified in
#  the filter. You can optionally specify customers in the filter for whom to
#  retrieve invoices. In the current implementation, you can only specify one
#  location and
#  optionally one customer.
#  The response is paginated. If truncated, the response includes a `cursor`
#  that you use in a subsequent request to retrieve the next set of invoices.
    #
    # @param query [Hash] Describes the query criteria for searching invoices.Request of type SquareApiClient::InvoiceQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :customer_ids (Array<String>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::INVOICE_SORT_FIELD) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param limit [Integer] The maximum number of invoices to return (200 is the maximum `limit`).
#  If not provided, the server uses a default limit of 100 invoices.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchInvoicesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.search(query: { filter: { location_ids: ["ES0RJRZYEC39A"], customer_ids: ["JDKYHBWT1D4F8MFH63DBMEN8Y4"] }, sort: { field: "INVOICE_SORT_DATE", order: DESC } }, limit: 100)
    def search(query:, limit: nil, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/search"
end
        SquareApiClient::SearchInvoicesResponse.from_json(json_object: response.body)
      end
    end
# Retrieves an invoice by invoice ID.
    #
    # @param invoice_id [String] The ID of the invoice to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.get(invoice_id: "invoice_id")
    def get(invoice_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}"
end
        SquareApiClient::GetInvoiceResponse.from_json(json_object: response.body)
      end
    end
# Updates an invoice. This endpoint supports sparse updates, so you only need
#  to specify the fields you want to change along with the required `version`
#  field.
#  Some restrictions apply to updating invoices. For example, you cannot change the
#  `order_id` or `location_id` field.
    #
    # @param invoice_id [String] The ID of the invoice to update.
    # @param invoice [Hash] The invoice fields to add, change, or clear. Fields can be cleared using
#  null values or the `remove` field (for individual payment requests or
#  reminders).
#  The current invoice `version` is also required. For more information, including
#  requirements,
#  limitations, and more examples, see [Update an
#  Invoice](https://developer.squareup.com/docs/invoices-api/update-invoices).Request of type SquareApiClient::Invoice, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :location_id (String) 
    #   * :order_id (String) 
    #   * :primary_recipient (Hash)
    #     * :customer_id (String) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :address (Hash)
    #       * :address_line_1 (String) 
    #       * :address_line_2 (String) 
    #       * :address_line_3 (String) 
    #       * :locality (String) 
    #       * :sublocality (String) 
    #       * :sublocality_2 (String) 
    #       * :sublocality_3 (String) 
    #       * :administrative_district_level_1 (String) 
    #       * :administrative_district_level_2 (String) 
    #       * :administrative_district_level_3 (String) 
    #       * :postal_code (String) 
    #       * :country (SquareApiClient::Country) 
    #       * :first_name (String) 
    #       * :last_name (String) 
    #     * :phone_number (String) 
    #     * :company_name (String) 
    #     * :tax_ids (Hash)
    #       * :eu_vat (String) 
    #   * :payment_requests (Array<SquareApiClient::InvoicePaymentRequest>) 
    #   * :delivery_method (SquareApiClient::InvoiceDeliveryMethod) 
    #   * :invoice_number (String) 
    #   * :title (String) 
    #   * :description (String) 
    #   * :scheduled_at (String) 
    #   * :public_url (String) 
    #   * :next_payment_amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    #   * :status (SquareApiClient::InvoiceStatus) 
    #   * :timezone (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :accepted_payment_methods (Hash)
    #     * :card (Boolean) 
    #     * :square_gift_card (Boolean) 
    #     * :bank_account (Boolean) 
    #     * :buy_now_pay_later (Boolean) 
    #     * :cash_app_pay (Boolean) 
    #   * :custom_fields (Array<SquareApiClient::InvoiceCustomField>) 
    #   * :subscription_id (String) 
    #   * :sale_or_service_date (String) 
    #   * :payment_conditions (String) 
    #   * :store_payment_method_enabled (Boolean) 
    #   * :attachments (Array<SquareApiClient::InvoiceAttachment>) 
    #   * :creator_team_member_id (String) 
    # @param idempotency_key [String] A unique string that identifies the `UpdateInvoice` request. If you do not
#  provide `idempotency_key` (or provide an empty string as the value), the
#  endpoint
#  treats each request as independent.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param fields_to_clear [Array<String>] The list of fields to clear. Although this field is currently supported, we
#  recommend using null values or the `remove` field when possible. For examples,
#  see
#  [Update an
#  Invoice](https://developer.squareup.com/docs/invoices-api/update-invoices).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.update(
#    invoice_id: "invoice_id",
#    invoice: { version: 1, payment_requests: [{ uid: "2da7964f-f3d2-4f43-81e8-5aa220bf3355", tipping_enabled: false }] },
#    idempotency_key: "4ee82288-0910-499e-ab4c-5d0071dad1be"
#  )
    def update(invoice_id:, invoice:, idempotency_key: nil, fields_to_clear: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), invoice: invoice, idempotency_key: idempotency_key, fields_to_clear: fields_to_clear }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}"
end
        SquareApiClient::UpdateInvoiceResponse.from_json(json_object: response.body)
      end
    end
# Deletes the specified invoice. When an invoice is deleted, the
#  associated order status changes to CANCELED. You can only delete a draft
#  invoice (you cannot delete a published invoice, including one that is scheduled
#  for processing).
    #
    # @param invoice_id [String] The ID of the invoice to delete.
    # @param version [Integer] The version of the [invoice](entity:Invoice) to delete.
#  If you do not know the version, you can call
#  [GetInvoice](api-endpoint:Invoices-GetInvoice) or
#  [ListInvoices](api-endpoint:Invoices-ListInvoices).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.delete(invoice_id: "invoice_id")
    def delete(invoice_id:, version: nil, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}"
end
        SquareApiClient::DeleteInvoiceResponse.from_json(json_object: response.body)
      end
    end
# Uploads a file and attaches it to an invoice. This endpoint accepts HTTP
#  multipart/form-data file uploads
#  with a JSON `request` part and a `file` part. The `file` part must be a
#  `readable stream` that contains a file
#  in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.
#  Invoices can have up to 10 attachments with a total file size of 25 MB.
#  Attachments can be added only to invoices
#  in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
#  __NOTE:__ When testing in the Sandbox environment, the total file size is
#  limited to 1 KB.
    #
    # @param invoice_id [String] The ID of the [invoice](entity:Invoice) to attach the file to.
    # @param request [Hash] Request of type SquareApiClient::CreateInvoiceAttachmentRequestData, as a Hash
    #   * :idempotency_key (String) 
    #   * :description (String) 
    # @param image_file [String, IO] 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateInvoiceAttachmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.create_invoice_attachment(invoice_id: "invoice_id", image_file: my_file.txt)
    def create_invoice_attachment(invoice_id:, request: nil, image_file: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  SquareApiClient::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/attachments"
end
        SquareApiClient::CreateInvoiceAttachmentResponse.from_json(json_object: response.body)
      end
    end
# Removes an attachment from an invoice and permanently deletes the file.
#  Attachments can be removed only
#  from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
    #
    # @param invoice_id [String] The ID of the [invoice](entity:Invoice) to delete the attachment from.
    # @param attachment_id [String] The ID of the [attachment](entity:InvoiceAttachment) to delete.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteInvoiceAttachmentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.delete_invoice_attachment(invoice_id: "invoice_id", attachment_id: "attachment_id")
    def delete_invoice_attachment(invoice_id:, attachment_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/attachments/#{attachment_id}"
end
        SquareApiClient::DeleteInvoiceAttachmentResponse.from_json(json_object: response.body)
      end
    end
# Cancels an invoice. The seller cannot collect payments for
#  the canceled invoice.
#  You cannot cancel an invoice in the `DRAFT` state or in a terminal state:
#  `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
    #
    # @param invoice_id [String] The ID of the [invoice](entity:Invoice) to cancel.
    # @param version [Integer] The version of the [invoice](entity:Invoice) to cancel.
#  If you do not know the version, you can call
#  [GetInvoice](api-endpoint:Invoices-GetInvoice) or
#  [ListInvoices](api-endpoint:Invoices-ListInvoices).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CancelInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.cancel(invoice_id: "invoice_id", version: 0)
    def cancel(invoice_id:, version:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), version: version }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/cancel"
end
        SquareApiClient::CancelInvoiceResponse.from_json(json_object: response.body)
      end
    end
# Publishes the specified draft invoice.
#  After an invoice is published, Square
#  follows up based on the invoice configuration. For example, Square
#  sends the invoice to the customer's email address, charges the customer's card
#  on file, or does
#  nothing. Square also makes the invoice available on a Square-hosted invoice
#  page.
#  The invoice `status` also changes from `DRAFT` to a status
#  based on the invoice configuration. For example, the status changes to `UNPAID`
#  if
#  Square emails the invoice or `PARTIALLY_PAID` if Square charges a card on file
#  for a portion of the
#  invoice amount.
#  In addition to the required `ORDERS_WRITE` and `INVOICES_WRITE` permissions,
#  `CUSTOMERS_READ`
#  and `PAYMENTS_WRITE` are required when publishing invoices configured for
#  card-on-file payments.
    #
    # @param invoice_id [String] The ID of the invoice to publish.
    # @param version [Integer] The version of the [invoice](entity:Invoice) to publish.
#  This must match the current version of the invoice; otherwise, the request is
#  rejected.
    # @param idempotency_key [String] A unique string that identifies the `PublishInvoice` request. If you do not
#  provide `idempotency_key` (or provide an empty string as the value), the
#  endpoint
#  treats each request as independent.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::PublishInvoiceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.invoices.publish(
#    invoice_id: "invoice_id",
#    version: 1,
#    idempotency_key: "32da42d0-1997-41b0-826b-f09464fc2c2e"
#  )
    def publish(invoice_id:, version:, idempotency_key: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), version: version, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/invoices/#{invoice_id}/publish"
end
        SquareApiClient::PublishInvoiceResponse.from_json(json_object: response.body)
      end
    end
  end
end