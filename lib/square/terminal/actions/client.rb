# frozen_string_literal: true

module Square
  module Terminal
    module Actions
      class Client
        # @return [Square::Terminal::Actions::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a Terminal action request and sends it to the specified device.
        #
        # @return [Square::Types::CreateTerminalActionResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/actions",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateTerminalActionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a filtered list of Terminal action requests created by the account making the request. Terminal action requests are available for 30 days.
        #
        # @return [Square::Types::SearchTerminalActionsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/actions/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchTerminalActionsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a Terminal action request by `action_id`. Terminal action requests are available for 30 days.
        #
        # @return [Square::Types::GetTerminalActionResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/terminals/actions/#{params[:action_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTerminalActionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Cancels a Terminal action request if the status of the request permits it.
        #
        # @return [Square::Types::CancelTerminalActionResponse]
        def cancel(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/actions/#{params[:action_id]}/cancel"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CancelTerminalActionResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
