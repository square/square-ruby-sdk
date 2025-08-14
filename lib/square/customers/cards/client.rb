
module Square
    module Customers
        module Cards
            class Client
                # @option client [Square::Internal::Http::RawClient]
                #
                # @return [Square::Customers::Cards::Client]
                def initialize(client)
                    @client = client
                end

                # Adds a card on file to an existing customer.
                # 
                # As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
                # calls with the same card nonce return the same card record that was created
                # with the provided nonce during the _first_ call.
                #
                # @return [Square::CreateCustomerCardResponse]
                def create(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::CreateCustomerCardResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Removes a card on file from a customer.
                #
                # @return [Square::DeleteCustomerCardResponse]
                def delete(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::DeleteCustomerCardResponse.load(_response.body)

                    else
                        raise _response.body
                end
            end
        end
    end
end
