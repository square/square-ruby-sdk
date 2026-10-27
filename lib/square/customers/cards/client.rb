# frozen_string_literal: true

module Square
  module Customers
    module Cards
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Adds a card on file to an existing customer.
        #
        # As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
        # calls with the same card nonce return the same card record that was created
        # with the provided nonce during the _first_ call.
        #
        # @param request_options [Hash]
        # @param params [Square::Customers::Cards::Types::CreateCustomerCardRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :customer_id
        #
        # @example
        #   client.customers.cards.create(
        #     customer_id: "customer_id",
        #     card_nonce: "YOUR_CARD_NONCE",
        #     billing_address: {
        #       address_line_1: "500 Electric Ave",
        #       address_line_2: "Suite 600",
        #       locality: "New York",
        #       administrative_district_level_1: "NY",
        #       postal_code: "10003",
        #       country: "US"
        #     },
        #     cardholder_name: "Amelia Earhart"
        #   )
        #
        # @return [Square::Types::CreateCustomerCardResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Customers::Cards::Types::CreateCustomerCardRequest.new(params).to_h
          non_body_param_names = %w[customer_id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}/cards",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateCustomerCardResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Removes a card on file from a customer.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :customer_id
        # @option params [String] :card_id
        #
        # @example
        #   client.customers.cards.delete(
        #     customer_id: "customer_id",
        #     card_id: "card_id"
        #   )
        #
        # @return [Square::Types::DeleteCustomerCardResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/customers/#{URI.encode_uri_component(params[:customer_id].to_s)}/cards/#{URI.encode_uri_component(params[:card_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteCustomerCardResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
