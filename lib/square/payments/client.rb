# frozen_string_literal: true

module Square
  module Payments
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of payments taken by the account making the request.
      #
      # Results are eventually consistent, and new payments or changes to payments might take several
      # seconds to appear.
      #
      # The maximum results per page is 100.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :begin_time
      # @option params [String, nil] :end_time
      # @option params [String, nil] :sort_order
      # @option params [String, nil] :cursor
      # @option params [String, nil] :location_id
      # @option params [Integer, nil] :total
      # @option params [String, nil] :last_4
      # @option params [String, nil] :card_brand
      # @option params [Integer, nil] :limit
      # @option params [Boolean, nil] :is_offline_payment
      # @option params [String, nil] :offline_begin_time
      # @option params [String, nil] :offline_end_time
      # @option params [String, nil] :updated_at_begin_time
      # @option params [String, nil] :updated_at_end_time
      # @option params [Square::Types::ListPaymentsRequestSortField, nil] :sort_field
      #
      # @return [Square::Types::ListPaymentsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[begin_time end_time sort_order cursor location_id total last_4 card_brand limit is_offline_payment offline_begin_time offline_end_time updated_at_begin_time updated_at_end_time sort_field]
        query_params = {}
        query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
        query_params["end_time"] = params[:end_time] if params.key?(:end_time)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["total"] = params[:total] if params.key?(:total)
        query_params["last_4"] = params[:last_4] if params.key?(:last_4)
        query_params["card_brand"] = params[:card_brand] if params.key?(:card_brand)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["is_offline_payment"] = params[:is_offline_payment] if params.key?(:is_offline_payment)
        query_params["offline_begin_time"] = params[:offline_begin_time] if params.key?(:offline_begin_time)
        query_params["offline_end_time"] = params[:offline_end_time] if params.key?(:offline_end_time)
        query_params["updated_at_begin_time"] = params[:updated_at_begin_time] if params.key?(:updated_at_begin_time)
        query_params["updated_at_end_time"] = params[:updated_at_end_time] if params.key?(:updated_at_end_time)
        query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :payments,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/payments",
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
            Square::Types::ListPaymentsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Creates a payment using the provided source. You can use this endpoint
      # to charge a card (credit/debit card or
      # Square gift card) or record a payment that the seller received outside of Square
      # (cash payment from a buyer or a payment that an external entity
      # processed on behalf of the seller).
      #
      # The endpoint creates a
      # `Payment` object and returns it in the response.
      #
      # @param request_options [Hash]
      # @param params [Square::Payments::Types::CreatePaymentRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreatePaymentResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/payments",
          body: Square::Payments::Types::CreatePaymentRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreatePaymentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels (voids) a payment identified by the idempotency key that is specified in the
      # request.
      #
      # Use this method when the status of a `CreatePayment` request is unknown (for example, after you send a
      # `CreatePayment` request, a network error occurs and you do not get a response). In this case, you can
      # direct Square to cancel the payment using this endpoint. In the request, you provide the same
      # idempotency key that you provided in your `CreatePayment` request that you want to cancel. After
      # canceling the payment, you can submit your `CreatePayment` request again.
      #
      # Note that if no payment with the specified idempotency key is found, no action is taken and the endpoint
      # returns successfully.
      #
      # @param request_options [Hash]
      # @param params [Square::Payments::Types::CancelPaymentByIdempotencyKeyRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CancelPaymentByIdempotencyKeyResponse]
      def cancel_by_idempotency_key(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/payments/cancel",
          body: Square::Payments::Types::CancelPaymentByIdempotencyKeyRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CancelPaymentByIdempotencyKeyResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves details for a specific payment.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_id
      #
      # @return [Square::Types::GetPaymentResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/payments/#{params[:payment_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetPaymentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a payment with the APPROVED status.
      # You can update the `amount_money` and `tip_money` using this endpoint.
      #
      # @param request_options [Hash]
      # @param params [Square::Payments::Types::UpdatePaymentRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_id
      #
      # @return [Square::Types::UpdatePaymentResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Payments::Types::UpdatePaymentRequest.new(params).to_h
        non_body_param_names = ["payment_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/payments/#{params[:payment_id]}",
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
          Square::Types::UpdatePaymentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels (voids) a payment. You can use this endpoint to cancel a payment with
      # the APPROVED `status`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_id
      #
      # @return [Square::Types::CancelPaymentResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/payments/#{params[:payment_id]}/cancel",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CancelPaymentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Completes (captures) a payment.
      # By default, payments are set to complete immediately after they are created.
      #
      # You can use this endpoint to complete a payment with the APPROVED `status`.
      #
      # @param request_options [Hash]
      # @param params [Square::Payments::Types::CompletePaymentRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_id
      #
      # @return [Square::Types::CompletePaymentResponse]
      def complete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Payments::Types::CompletePaymentRequest.new(params).to_h
        non_body_param_names = ["payment_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/payments/#{params[:payment_id]}/complete",
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
          Square::Types::CompletePaymentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
