
module Square
  module CashDrawers
    module Shifts
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::CashDrawers::Shifts::Client]
        def initialize(client)
          @client = client
        end

        # Provides the details for all of the cash drawer shifts for a location
        # in a date range.
        #
        # @return [Square::ListCashDrawerShiftsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCashDrawerShiftsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Provides the summary details for a single cash drawer shift. See
        # [ListCashDrawerShiftEvents](api-endpoint:CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
        #
        # @return [Square::GetCashDrawerShiftResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCashDrawerShiftResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Provides a paginated list of events for a single cash drawer shift.
        #
        # @return [Square::ListCashDrawerShiftEventsResponse]
        def list_events(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCashDrawerShiftEventsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
