
module Square
    module GiftCards
        module Activities
            class Client
                # @option client [Square::Internal::Http::RawClient]
                #
                # @return [Square::GiftCards::Activities::Client]
                def initialize(client)
                    @client = client
                end

                # Lists gift card activities. By default, you get gift card activities for all
                # gift cards in the seller's account. You can optionally specify query parameters to
                # filter the list. For example, you can get a list of gift card activities for a gift card,
                # for all gift cards in a specific region, or for activities within a time window.
                #
                # @return [Square::ListGiftCardActivitiesResponse]
                def list(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::ListGiftCardActivitiesResponse.load(_response.body)

                    else
                        raise _response.body
                end

                # Creates a gift card activity to manage the balance or state of a [gift card](entity:GiftCard).
                # For example, create an `ACTIVATE` activity to activate a gift card with an initial balance before first use.
                #
                # @return [Square::CreateGiftCardActivityResponse]
                def create(request_options: {}, **params)
                    _request = params

                    _response = @client.send(_request)
                    if _response.code >= "200" && _response.code < "300"
                        return Square::Types::CreateGiftCardActivityResponse.load(_response.body)

                    else
                        raise _response.body
                end
            end
        end
    end
end
