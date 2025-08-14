
module Square
    module Terminal
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Terminal::Client]
            def initialize(client)
                @client = client
            end

            # Dismisses a Terminal action request if the status and type of the request permits it.
            # 
            # See [Link and Dismiss Actions](https://developer.squareup.com/docs/terminal-api/advanced-features/custom-workflows/link-and-dismiss-actions) for more details.
            #
            # @return [Square::DismissTerminalActionResponse]
            def dismiss_terminal_action(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::DismissTerminalActionResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Dismisses a Terminal checkout request if the status and type of the request permits it.
            #
            # @return [Square::DismissTerminalCheckoutResponse]
            def dismiss_terminal_checkout(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::DismissTerminalCheckoutResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Dismisses a Terminal refund request if the status and type of the request permits it.
            #
            # @return [Square::DismissTerminalRefundResponse]
            def dismiss_terminal_refund(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::DismissTerminalRefundResponse.load(_response.body)

                else
                    raise _response.body
            end
        end
    end
end
