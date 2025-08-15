
module Square
  module Terminal
    module Refunds
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Terminal::Refunds::Client]
        def initialize(client)
          @client = client
        end

        # Creates a request to refund an Interac payment completed on a Square Terminal. Refunds for Interac payments on a Square Terminal are supported only for Interac debit cards in Canada. Other refunds for Terminal payments should use the Refunds API. For more information, see [Refunds API](api:Refunds).
        #
        # @return [Square::CreateTerminalRefundResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateTerminalRefundResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a filtered list of Interac Terminal refund requests created by the seller making the request. Terminal refund requests are available for 30 days.
        #
        # @return [Square::SearchTerminalRefundsResponse]
        def search(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchTerminalRefundsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves an Interac Terminal refund object by ID. Terminal refund objects are available for 30 days.
        #
        # @return [Square::GetTerminalRefundResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTerminalRefundResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Cancels an Interac Terminal refund request by refund request ID if the status of the request permits it.
        #
        # @return [Square::CancelTerminalRefundResponse]
        def cancel(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CancelTerminalRefundResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
