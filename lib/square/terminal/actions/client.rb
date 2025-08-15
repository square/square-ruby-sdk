
module Square
  module Terminal
    module Actions
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Terminal::Actions::Client]
        def initialize(client)
          @client = client
        end

        # Creates a Terminal action request and sends it to the specified device.
        #
        # @return [Square::CreateTerminalActionResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateTerminalActionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a filtered list of Terminal action requests created by the account making the request. Terminal action requests are available for 30 days.
        #
        # @return [Square::SearchTerminalActionsResponse]
        def search(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchTerminalActionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a Terminal action request by `action_id`. Terminal action requests are available for 30 days.
        #
        # @return [Square::GetTerminalActionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTerminalActionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Cancels a Terminal action request if the status of the request permits it.
        #
        # @return [Square::CancelTerminalActionResponse]
        def cancel(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CancelTerminalActionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
