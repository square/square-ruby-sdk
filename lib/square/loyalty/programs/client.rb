
module Square
  module Loyalty
    module Programs
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Loyalty::Programs::Client]
        def initialize(client)
          @client = client
        end

        # Returns a list of loyalty programs in the seller's account.
        # Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
        # 
        # 
        # Replaced with [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when used with the keyword `main`.
        #
        # @return [Square::Types::ListLoyaltyProgramsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListLoyaltyProgramsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`.
        # 
        # Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
        #
        # @return [Square::Types::GetLoyaltyProgramResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetLoyaltyProgramResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Calculates the number of points a buyer can earn from a purchase. Applications might call this endpoint
        # to display the points to the buyer.
        # 
        # - If you are using the Orders API to manage orders, provide the `order_id` and (optional) `loyalty_account_id`.
        # Square reads the order to compute the points earned from the base loyalty program and an associated
        # [loyalty promotion](entity:LoyaltyPromotion).
        # 
        # - If you are not using the Orders API to manage orders, provide `transaction_amount_money` with the
        # purchase amount. Square uses this amount to calculate the points earned from the base loyalty program,
        # but not points earned from a loyalty promotion. For spend-based and visit-based programs, the `tax_mode`
        # setting of the accrual rule indicates how taxes should be treated for loyalty points accrual.
        # If the purchase qualifies for program points, call
        # [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) and perform a client-side computation
        # to calculate whether the purchase also qualifies for promotion points. For more information, see
        # [Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
        #
        # @return [Square::Types::CalculateLoyaltyPointsResponse]
        def calculate(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CalculateLoyaltyPointsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
