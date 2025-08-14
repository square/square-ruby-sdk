
module Square
    module Webhooks
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Webhooks::Client]
            def initialize(client)
                @client = client
            end
        end
    end
end
