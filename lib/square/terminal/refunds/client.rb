# frozen_string_literal: true

module Square
  module Terminal
    module Refunds
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Creates a request to refund an Interac payment completed on a Square Terminal. Refunds for Interac payments on
        # a Square Terminal are supported only for Interac debit cards in Canada. Other refunds for Terminal payments
        # should use the Refunds API. For more information, see [Refunds API](api:Refunds).
        #
        # @param request_options [Hash]
        # @param params [Square::Terminal::Refunds::Types::CreateTerminalRefundRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.terminal.refunds.create(
        #     idempotency_key: "402a640b-b26f-401f-b406-46f839590c04",
        #     refund: {
        #       payment_id: "5O5OvgkcNUhl7JBuINflcjKqUzXZY",
        #       amount_money: {
        #         amount: 111,
        #         currency: "CAD"
        #       },
        #       reason: "Returning items",
        #       device_id: "f72dfb8e-4d65-4e56-aade-ec3fb8d33291"
        #     }
        #   )
        #
        # @return [Square::Types::CreateTerminalRefundResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/terminals/refunds",
            body: Square::Terminal::Refunds::Types::CreateTerminalRefundRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateTerminalRefundResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a filtered list of Interac Terminal refund requests created by the seller making the request.
        # Terminal refund requests are available for 30 days.
        #
        # @param request_options [Hash]
        # @param params [Square::Terminal::Refunds::Types::SearchTerminalRefundsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.terminal.refunds.search(
        #     query: {
        #       filter: {
        #         status: "COMPLETED"
        #       }
        #     },
        #     limit: 1
        #   )
        #
        # @return [Square::Types::SearchTerminalRefundsResponse]
        def search(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/terminals/refunds/search",
            body: Square::Terminal::Refunds::Types::SearchTerminalRefundsRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::SearchTerminalRefundsResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves an Interac Terminal refund object by ID. Terminal refund objects are available for 30 days.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :terminal_refund_id
        #
        # @example
        #   client.terminal.refunds.get(terminal_refund_id: "terminal_refund_id")
        #
        # @return [Square::Types::GetTerminalRefundResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/terminals/refunds/#{URI.encode_uri_component(params[:terminal_refund_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetTerminalRefundResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Cancels an Interac Terminal refund request by refund request ID if the status of the request permits it.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :terminal_refund_id
        #
        # @example
        #   client.terminal.refunds.cancel(terminal_refund_id: "terminal_refund_id")
        #
        # @return [Square::Types::CancelTerminalRefundResponse]
        def cancel(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/terminals/refunds/#{URI.encode_uri_component(params[:terminal_refund_id].to_s)}/cancel",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CancelTerminalRefundResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
