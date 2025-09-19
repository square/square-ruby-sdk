# frozen_string_literal: true

module Square
  module Terminal
    class Client
      # @return [Square::Terminal::Client]
      def initialize(client:)
        @client = client
      end

      # Dismisses a Terminal action request if the status and type of the request permits it.
      #
      # See [Link and Dismiss Actions](https://developer.squareup.com/docs/terminal-api/advanced-features/custom-workflows/link-and-dismiss-actions) for more details.
      #
      # @return [Square::Types::DismissTerminalActionResponse]
      def dismiss_terminal_action(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/terminals/actions/#{params[:action_id]}/dismiss"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::DismissTerminalActionResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Dismisses a Terminal checkout request if the status and type of the request permits it.
      #
      # @return [Square::Types::DismissTerminalCheckoutResponse]
      def dismiss_terminal_checkout(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/terminals/checkouts/#{params[:checkout_id]}/dismiss"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::DismissTerminalCheckoutResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Dismisses a Terminal refund request if the status and type of the request permits it.
      #
      # @return [Square::Types::DismissTerminalRefundResponse]
      def dismiss_terminal_refund(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/terminals/refunds/#{params[:terminal_refund_id]}/dismiss"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::DismissTerminalRefundResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
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
