
module Square
    module GiftCards
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::GiftCards::Client]
            def initialize(client)
                @client = client
            end

            # Lists all gift cards. You can specify optional filters to retrieve 
            # a subset of the gift cards. Results are sorted by `created_at` in ascending order.
            #
            # @return [Square::ListGiftCardsResponse]
            def list(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ListGiftCardsResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Creates a digital gift card or registers a physical (plastic) gift card. The resulting gift card
            # has a `PENDING` state. To activate a gift card so that it can be redeemed for purchases, call
            # [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity) and create an `ACTIVATE`
            # activity with the initial balance. Alternatively, you can use [RefundPayment](api-endpoint:Refunds-RefundPayment)
            # to refund a payment to the new gift card.
            #
            # @return [Square::CreateGiftCardResponse]
            def create(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CreateGiftCardResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Retrieves a gift card using the gift card account number (GAN).
            #
            # @return [Square::GetGiftCardFromGanResponse]
            def get_from_gan(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetGiftCardFromGanResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Retrieves a gift card using a secure payment token that represents the gift card.
            #
            # @return [Square::GetGiftCardFromNonceResponse]
            def get_from_nonce(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetGiftCardFromNonceResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Links a customer to a gift card, which is also referred to as adding a card on file.
            #
            # @return [Square::LinkCustomerToGiftCardResponse]
            def link_customer(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::LinkCustomerToGiftCardResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Unlinks a customer from a gift card, which is also referred to as removing a card on file.
            #
            # @return [Square::UnlinkCustomerFromGiftCardResponse]
            def unlink_customer(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::UnlinkCustomerFromGiftCardResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Retrieves a gift card using the gift card ID.
            #
            # @return [Square::GetGiftCardResponse]
            def get(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetGiftCardResponse.load(_response.body)

                else
                    raise _response.body
                end
            end
        end
    end
end
