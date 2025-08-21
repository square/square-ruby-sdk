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
            _query_param_names = %w[status cursor limit]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              query: _query
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::ListLoyaltyPromotionsResponse.load(_response.body)
            end

            raise _response.body
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
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              body: params.except(*_path_param_names)
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::CreateLoyaltyPromotionResponse.load(_response.body)
            end

            raise _response.body
          end

          # Retrieves a loyalty promotion.
          #
          # @return [Square::Types::GetLoyaltyPromotionResponse]
          def get(request_options: {}, **params)
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}"
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::GetLoyaltyPromotionResponse.load(_response.body)
            end

            raise _response.body
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
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}/cancel"
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::CancelLoyaltyPromotionResponse.load(_response.body)
            end

            raise _response.body
          end
        end
      end
    end
  end
end
