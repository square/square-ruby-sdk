# frozen_string_literal: true

module Square
  module Terminal
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Dismisses a Terminal action request if the status and type of the request permits it.
      #
      # See [Link and Dismiss
      # Actions](https://developer.squareup.com/docs/terminal-api/advanced-features/custom-workflows/link-and-dismiss-actions)
      # for more details.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :action_id
      #
      # @example
      #   client.terminal.dismiss_terminal_action(action_id: "action_id")
      #
      # @return [Square::Types::DismissTerminalActionResponse]
      def dismiss_terminal_action(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/terminals/actions/#{URI.encode_uri_component(params[:action_id].to_s)}/dismiss",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DismissTerminalActionResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Dismisses a Terminal checkout request if the status and type of the request permits it.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :checkout_id
      #
      # @example
      #   client.terminal.dismiss_terminal_checkout(checkout_id: "checkout_id")
      #
      # @return [Square::Types::DismissTerminalCheckoutResponse]
      def dismiss_terminal_checkout(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/terminals/checkouts/#{URI.encode_uri_component(params[:checkout_id].to_s)}/dismiss",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DismissTerminalCheckoutResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Dismisses a Terminal refund request if the status and type of the request permits it.
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
      #   client.terminal.dismiss_terminal_refund(terminal_refund_id: "terminal_refund_id")
      #
      # @return [Square::Types::DismissTerminalRefundResponse]
      def dismiss_terminal_refund(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/terminals/refunds/#{URI.encode_uri_component(params[:terminal_refund_id].to_s)}/dismiss",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::DismissTerminalRefundResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::Actions::Client]
      def actions
        @actions ||= Square::Terminal::Actions::Client.new(client: @client)
      end

      # @return [Square::Checkouts::Client]
      def checkouts
        @checkouts ||= Square::Terminal::Checkouts::Client.new(client: @client)
      end

      # @return [Square::Refunds::Client]
      def refunds
        @refunds ||= Square::Terminal::Refunds::Client.new(client: @client)
      end
    end
  end
end
