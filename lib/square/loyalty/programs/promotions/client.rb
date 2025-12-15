# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      module Promotions
        class Client
          # @param client [Square::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Lists the loyalty promotions associated with a [loyalty program](entity:LoyaltyProgram).
          # Results are sorted by the `created_at` date in descending order (newest to oldest).
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :program_id
          # @option params [Square::Types::LoyaltyPromotionStatus, nil] :status
          # @option params [String, nil] :cursor
          # @option params [Integer, nil] :limit
          #
          # @return [Square::Types::ListLoyaltyPromotionsResponse]
          def list(request_options: {}, **params)
            params = Square::Internal::Types::Utils.symbolize_keys(params)
            query_param_names = %i[status cursor limit]
            query_params = {}
            query_params["status"] = params[:status] if params.key?(:status)
            query_params["cursor"] = params[:cursor] if params.key?(:cursor)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            params = params.except(*query_param_names)

            Square::Internal::CursorItemIterator.new(
              cursor_field: :cursor,
              item_field: :loyalty_promotions,
              initial_cursor: query_params[:cursor]
            ) do |next_cursor|
              query_params[:cursor] = next_cursor
              request = Square::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "GET",
                path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
                query: query_params,
                request_options: request_options
              )
              begin
                response = @client.send(request)
              rescue Net::HTTPRequestTimeout
                raise Square::Errors::TimeoutError
              end
              code = response.code.to_i
              if code.between?(200, 299)
                Square::Types::ListLoyaltyPromotionsResponse.load(response.body)
              else
                error_class = Square::Errors::ResponseError.subclass_for_code(code)
                raise error_class.new(response.body, code: code)
              end
            end
          end

          # Creates a loyalty promotion for a [loyalty program](entity:LoyaltyProgram). A loyalty promotion
          # enables buyers to earn points in addition to those earned from the base loyalty program.
          #
          # This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status, depending on the
          # `available_time` setting. A loyalty program can have a maximum of 10 loyalty promotions with an
          # `ACTIVE` or `SCHEDULED` status.
          #
          # @param request_options [Hash]
          # @param params [Square::Loyalty::Programs::Promotions::Types::CreateLoyaltyPromotionRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :program_id
          #
          # @return [Square::Types::CreateLoyaltyPromotionResponse]
          def create(request_options: {}, **params)
            path_param_names = %i[program_id]
            body_params = params.except(*path_param_names)
            body_prop_names = %i[loyalty_promotion idempotency_key]
            body_bag = body_params.slice(*body_prop_names)

            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              body: Square::Loyalty::Programs::Promotions::Types::CreateLoyaltyPromotionRequest.new(body_bag).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Square::Types::CreateLoyaltyPromotionResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieves a loyalty promotion.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :program_id
          # @option params [String] :promotion_id
          #
          # @return [Square::Types::GetLoyaltyPromotionResponse]
          def get(request_options: {}, **params)
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Square::Types::GetLoyaltyPromotionResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion earlier than the
          # end date, cancel an `ACTIVE` promotion when an end date is not specified, or cancel a `SCHEDULED` promotion.
          # Because updating a promotion is not supported, you can also use this endpoint to cancel a promotion before
          # you create a new one.
          #
          # This endpoint sets the loyalty promotion to the `CANCELED` state
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :program_id
          # @option params [String] :promotion_id
          #
          # @return [Square::Types::CancelLoyaltyPromotionResponse]
          def cancel(request_options: {}, **params)
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}/cancel",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Square::Types::CancelLoyaltyPromotionResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
