# frozen_string_literal: true

module Square
  module Terminal
    module Checkouts
      class Client
        # @return [Square::Terminal::Checkouts::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a Terminal checkout request and sends it to the specified device to take a payment
        # for the requested amount.
        #
        # @return [Square::Types::CreateTerminalCheckoutResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/checkouts",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateTerminalCheckoutResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a filtered list of Terminal checkout requests created by the application making the request. Only Terminal checkout requests created for the merchant scoped to the OAuth token are returned. Terminal checkout requests are available for 30 days.
        #
        # @return [Square::Types::SearchTerminalCheckoutsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/checkouts/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchTerminalCheckoutsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout requests are available for 30 days.
        #
        # @return [Square::Types::GetTerminalCheckoutResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/terminals/checkouts/#{params[:checkout_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTerminalCheckoutResponse.load(_response.body)
          end

          raise _response.body
        end

        # Cancels a Terminal checkout request if the status of the request permits it.
        #
        # @return [Square::Types::CancelTerminalCheckoutResponse]
        def cancel(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/checkouts/#{params[:checkout_id]}/cancel"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CancelTerminalCheckoutResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
