# frozen_string_literal: true

module Square
  module Checkout
    module PaymentLinks
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists all payment links.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::PaymentLink` in the
        # `payment_links` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
        # as a `Square::Types::ListPaymentLinksResponse`, including its other fields.
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
        # @option params [String, nil] :cursor
        # @option params [Integer, nil] :limit
        #
        # @example
        #   client.checkout.payment_links.list(
        #     cursor: "cursor",
        #     limit: 1
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["limit"] = params[:limit] if params.key?(:limit)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :payment_links,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/online-checkout/payment-links",
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
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListPaymentLinksResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a Square-hosted checkout page. Applications can share the resulting payment link with their buyer to
        # pay for goods and services.
        #
        # @param request_options [Hash]
        # @param params [Square::Checkout::PaymentLinks::Types::CreatePaymentLinkRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.checkout.payment_links.create(
        #     idempotency_key: "cd9e25dc-d9f2-4430-aedb-61605070e95f",
        #     quick_pay: {
        #       name: "Auto Detailing",
        #       price_money: {
        #         amount: 10000,
        #         currency: "USD"
        #       },
        #       location_id: "A9Y43N9ABXZBP"
        #     }
        #   )
        #
        # @return [Square::Types::CreatePaymentLinkResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/online-checkout/payment-links",
            body: Square::Checkout::PaymentLinks::Types::CreatePaymentLinkRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreatePaymentLinkResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a payment link.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.checkout.payment_links.get(id: "id")
        #
        # @return [Square::Types::GetPaymentLinkResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/online-checkout/payment-links/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetPaymentLinkResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates a payment link. You can update the `payment_link` fields such as
        # `description`, `checkout_options`, and  `pre_populated_data`.
        # You cannot update other fields such as the `order_id`, `version`, `URL`, or `timestamp` field.
        #
        # @param request_options [Hash]
        # @param params [Square::Checkout::PaymentLinks::Types::UpdatePaymentLinkRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.checkout.payment_links.update(
        #     id: "id",
        #     payment_link: {
        #       version: 1,
        #       checkout_options: {
        #         ask_for_shipping_address: true
        #       }
        #     }
        #   )
        #
        # @return [Square::Types::UpdatePaymentLinkResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Checkout::PaymentLinks::Types::UpdatePaymentLinkRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/online-checkout/payment-links/#{URI.encode_uri_component(params[:id].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpdatePaymentLinkResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a payment link.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.checkout.payment_links.delete(id: "id")
        #
        # @return [Square::Types::DeletePaymentLinkResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/online-checkout/payment-links/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeletePaymentLinkResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
