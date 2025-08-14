
module Square
    module Devices
        module Codes
            class Client
                # @option client [Square::Internal::Http::RawClient]
                #
                # @return [Square::Devices::Codes::Client]
                def initialize(client)
                    @client = client
                end

                # Lists all DeviceCodes associated with the merchant.
                #
                # @return [Square::ListDeviceCodesResponse]
                def list(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::ListDeviceCodesResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Creates a DeviceCode that can be used to login to a Square Terminal device to enter the connected
                # terminal mode.
                #
                # @return [Square::CreateDeviceCodeResponse]
                def create(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::CreateDeviceCodeResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Retrieves DeviceCode with the associated ID.
                #
                # @return [Square::GetDeviceCodeResponse]
                def get(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::GetDeviceCodeResponse.load(_response.body)

                    else
                        raise _response.body
                end
            end
        end
    end
end
