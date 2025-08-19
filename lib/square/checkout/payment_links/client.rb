
module Square
  module Checkout
    module PaymentLinks
      class Client
        # @return [Square::Checkout::PaymentLinks::Client]
        def initialize(client:)
          @client = client
        end

        # Lists all payment links.
        #
        # @return [Square::Types::ListPaymentLinksResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListPaymentLinksResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a Square-hosted checkout page. Applications can share the resulting payment link with their buyer to pay for goods and services.
        #
        # @return [Square::Types::CreatePaymentLinkResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreatePaymentLinkResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a payment link.
        #
        # @return [Square::Types::GetPaymentLinkResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetPaymentLinkResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a payment link. You can update the `payment_link` fields such as
        # `description`, `checkout_options`, and  `pre_populated_data`.
        # You cannot update other fields such as the `order_id`, `version`, `URL`, or `timestamp` field.
        #
        # @return [Square::Types::UpdatePaymentLinkResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdatePaymentLinkResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a payment link.
        #
        # @return [Square::Types::DeletePaymentLinkResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeletePaymentLinkResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
