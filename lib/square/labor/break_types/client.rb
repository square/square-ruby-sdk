
module Square
  module Labor
    module BreakTypes
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Labor::BreakTypes::Client]
        def initialize(client)
          @client = client
        end

        # Returns a paginated list of `BreakType` instances for a business.
        #
        # @return [Square::ListBreakTypesResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListBreakTypesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new `BreakType`.
        # 
        # A `BreakType` is a template for creating `Break` objects.
        # You must provide the following values in your request to this
        # endpoint:
        # 
        # - `location_id`
        # - `break_name`
        # - `expected_duration`
        # - `is_paid`
        # 
        # You can only have three `BreakType` instances per location. If you attempt to add a fourth
        # `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3 breaks per location."
        # is returned.
        #
        # @return [Square::CreateBreakTypeResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateBreakTypeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Returns a single `BreakType` specified by `id`.
        #
        # @return [Square::GetBreakTypeResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetBreakTypeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates an existing `BreakType`.
        #
        # @return [Square::UpdateBreakTypeResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateBreakTypeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes an existing `BreakType`.
        # 
        # A `BreakType` can be deleted even if it is referenced from a `Shift`.
        #
        # @return [Square::DeleteBreakTypeResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteBreakTypeResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
