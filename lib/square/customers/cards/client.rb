# frozen_string_literal: true

module Square
  module Customers
    module Cards
      class Client
        # @return [Square::Customers::Cards::Client]
        def initialize(client:)
          @client = client
        end

        # Adds a card on file to an existing customer.
        #
        # As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
        # calls with the same card nonce return the same card record that was created
        # with the provided nonce during the _first_ call.
        #
        # @return [Square::Types::CreateCustomerCardResponse]
        def create(request_options: {}, **params)
          _path_param_names = ["customer_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/customers/#{params[:customer_id]}/cards",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateCustomerCardResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Removes a card on file from a customer.
        #
        # @return [Square::Types::DeleteCustomerCardResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/customers/#{params[:customer_id]}/cards/#{params[:card_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteCustomerCardResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
