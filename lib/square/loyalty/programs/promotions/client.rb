
module Square
  module Loyalty
    module Programs
      module Promotions
        class Client
          # @option client [Square::Internal::Http::RawClient]
          #
          # @return [Square::Loyalty::Programs::Promotions::Client]
          def initialize(client)
            @client = client
          end

          # Lists the loyalty promotions associated with a [loyalty program](entity:LoyaltyProgram).
          # Results are sorted by the `created_at` date in descending order (newest to oldest).
          #
          # @return [Square::Types::ListLoyaltyPromotionsResponse]
          def list(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::ListLoyaltyPromotionsResponse.load(_response.body)
            else
              raise _response.body
            end
          end

          # Creates a loyalty promotion for a [loyalty program](entity:LoyaltyProgram). A loyalty promotion
          # enables buyers to earn points in addition to those earned from the base loyalty program.
          # 
          # This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status, depending on the
          # `available_time` setting. A loyalty program can have a maximum of 10 loyalty promotions with an
          # `ACTIVE` or `SCHEDULED` status.
          #
          # @return [Square::Types::CreateLoyaltyPromotionResponse]
          def create(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::CreateLoyaltyPromotionResponse.load(_response.body)
            else
              raise _response.body
            end
          end

          # Retrieves a loyalty promotion.
          #
          # @return [Square::Types::GetLoyaltyPromotionResponse]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::GetLoyaltyPromotionResponse.load(_response.body)
            else
              raise _response.body
            end
          end

          # Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion earlier than the
          # end date, cancel an `ACTIVE` promotion when an end date is not specified, or cancel a `SCHEDULED` promotion.
          # Because updating a promotion is not supported, you can also use this endpoint to cancel a promotion before
          # you create a new one.
          # 
          # This endpoint sets the loyalty promotion to the `CANCELED` state
          #
          # @return [Square::Types::CancelLoyaltyPromotionResponse]
          def cancel(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::CancelLoyaltyPromotionResponse.load(_response.body)
            else
              raise _response.body
            end
          end

        end
      end
    end
  end
end
