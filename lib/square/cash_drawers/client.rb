
module Square
    module CashDrawers
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::CashDrawers::Client]
            def initialize(client)
                @client = client
            end
        end
    end
end
