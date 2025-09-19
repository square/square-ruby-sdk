# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      module Promotions
        class Client
          # @return [Square::Loyalty::Programs::Promotions::Client]
          def initialize(client:)
            @client = client
          end

          # Lists the loyalty promotions associated with a [loyalty program](entity:LoyaltyProgram).
          # Results are sorted by the `created_at` date in descending order (newest to oldest).
          #
          # @return [Square::Types::ListLoyaltyPromotionsResponse]
          def list(request_options: {}, **params)
            _query_param_names = [
              %w[status cursor limit],
              %i[status cursor limit]
            ].flatten
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListLoyaltyPromotionsResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
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
            _path_param_names = ["program_id"]

            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              body: params.except(*_path_param_names)
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::CreateLoyaltyPromotionResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Retrieves a loyalty promotion.
          #
          # @return [Square::Types::GetLoyaltyPromotionResponse]
          def get(request_options: {}, **params)
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::GetLoyaltyPromotionResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
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
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}/cancel"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::CancelLoyaltyPromotionResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end
      end
    end
  end
end
