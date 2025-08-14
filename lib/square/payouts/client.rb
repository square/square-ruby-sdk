
module Square
    module Payouts
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Payouts::Client]
            def initialize(client)
                @client = client
            end

            # Retrieves a list of all payouts for the default location.
            # You can filter payouts by location ID, status, time range, and order them in ascending or descending order.
            # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
            #
            # @return [Square::ListPayoutsResponse]
            def list(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ListPayoutsResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves details of a specific payout identified by a payout ID.
            # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
            #
            # @return [Square::GetPayoutResponse]
            def get(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetPayoutResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves a list of all payout entries for a specific payout.
            # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
            #
            # @return [Square::ListPayoutEntriesResponse]
            def list_entries(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ListPayoutEntriesResponse.load(_response.body)

                else
                    raise _response.body
            end
        end
    end
end
