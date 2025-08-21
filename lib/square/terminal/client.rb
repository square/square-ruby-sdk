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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/terminals/actions/#{params[:action_id]}/dismiss"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DismissTerminalActionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Dismisses a Terminal checkout request if the status and type of the request permits it.
      #
      # @return [Square::Types::DismissTerminalCheckoutResponse]
      def dismiss_terminal_checkout(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/terminals/checkouts/#{params[:checkout_id]}/dismiss"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DismissTerminalCheckoutResponse.load(_response.body)
        end

        raise _response.body
      end

      # Dismisses a Terminal refund request if the status and type of the request permits it.
      #
      # @return [Square::Types::DismissTerminalRefundResponse]
      def dismiss_terminal_refund(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/terminals/refunds/#{params[:terminal_refund_id]}/dismiss"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DismissTerminalRefundResponse.load(_response.body)
        end

        raise _response.body
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
