
module Square
    module Labor
        module WorkweekConfigs
            class Client
                # @option client [Square::Internal::Http::RawClient]
                #
                # @return [Square::Labor::WorkweekConfigs::Client]
                def initialize(client)
                    @client = client
                end

                # Returns a list of `WorkweekConfig` instances for a business.
                #
                # @return [Square::ListWorkweekConfigsResponse]
                def list(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::ListWorkweekConfigsResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Updates a `WorkweekConfig`.
                #
                # @return [Square::UpdateWorkweekConfigResponse]
                def get(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::UpdateWorkweekConfigResponse.load(_response.body)

                    else
                        raise _response.body
                end
            end
        end
    end
end
