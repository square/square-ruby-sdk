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
          # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::LoyaltyPromotion` in the
          # `loyalty_promotions` field of every page, requesting pages as they are needed. Call `pages` on it to get
          # each page as a `Square::Types::ListLoyaltyPromotionsResponse`, including its other fields.
          #
          # No request is sent by this call. The first page is requested when you start iterating (or call
          # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
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
          # @example
          #   client.loyalty.programs.promotions.list(
          #     program_id: "program_id",
          #     status: "ACTIVE",
          #     cursor: "cursor",
          #     limit: 1
          #   )
          #
          # @return [Square::Internal::CursorItemIterator]
          def list(request_options: {}, **params)
            params = Square::Internal::Types::Utils.normalize_keys(params)
            query_params = {}
            query_params["status"] = params[:status] if params.key?(:status)
            query_params["cursor"] = params[:cursor] if params.key?(:cursor)
            query_params["limit"] = params[:limit] if params.key?(:limit)

            Square::Internal::CursorItemIterator.new(
              cursor_field: :cursor,
              item_field: :loyalty_promotions,
              initial_cursor: query_params["cursor"]
            ) do |next_cursor|
              query_params["cursor"] = next_cursor
              request = Square::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "GET",
                path: "v2/loyalty/programs/#{URI.encode_uri_component(params[:program_id].to_s)}/promotions",
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
                parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListLoyaltyPromotionsResponse.load(response.body))
                [parsed_response, response]
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
          # @example
          #   client.loyalty.programs.promotions.create(
          #     program_id: "program_id",
          #     loyalty_promotion: {
          #       name: "Tuesday Happy Hour Promo",
          #       incentive: {
          #         type: "POINTS_MULTIPLIER",
          #         points_multiplier_data: {
          #           multiplier: "3.0"
          #         }
          #       },
          #       available_time: {
          #         time_periods: ["BEGIN:VEVENT
          #         DTSTART:20220816T160000
          #         DURATION:PT2H
          #         RRULE:FREQ=WEEKLY;BYDAY=TU
          #         END:VEVENT"]
          #       },
          #       trigger_limit: {
          #         times: 1,
          #         interval: "DAY"
          #       },
          #       minimum_spend_amount_money: {
          #         amount: 2000,
          #         currency: "USD"
          #       },
          #       qualifying_category_ids: ["XTQPYLR3IIU9C44VRCB3XD12"]
          #     },
          #     idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996"
          #   )
          #
          # @return [Square::Types::CreateLoyaltyPromotionResponse]
          def create(request_options: {}, **params)
            params = Square::Internal::Types::Utils.normalize_keys(params)
            request_data = Square::Loyalty::Programs::Promotions::Types::CreateLoyaltyPromotionRequest.new(params).to_h
            non_body_param_names = %w[program_id]
            body = request_data.except(*non_body_param_names)

            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "v2/loyalty/programs/#{URI.encode_uri_component(params[:program_id].to_s)}/promotions",
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
              (response.body.to_s.empty? ? nil : Square::Types::CreateLoyaltyPromotionResponse.load(response.body))
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
          # @example
          #   client.loyalty.programs.promotions.get(
          #     program_id: "program_id",
          #     promotion_id: "promotion_id"
          #   )
          #
          # @return [Square::Types::GetLoyaltyPromotionResponse]
          def get(request_options: {}, **params)
            params = Square::Internal::Types::Utils.normalize_keys(params)
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/loyalty/programs/#{URI.encode_uri_component(params[:program_id].to_s)}/promotions/#{URI.encode_uri_component(params[:promotion_id].to_s)}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Square::Types::GetLoyaltyPromotionResponse.load(response.body))
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
          # @example
          #   client.loyalty.programs.promotions.cancel(
          #     program_id: "program_id",
          #     promotion_id: "promotion_id"
          #   )
          #
          # @return [Square::Types::CancelLoyaltyPromotionResponse]
          def cancel(request_options: {}, **params)
            params = Square::Internal::Types::Utils.normalize_keys(params)
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "v2/loyalty/programs/#{URI.encode_uri_component(params[:program_id].to_s)}/promotions/#{URI.encode_uri_component(params[:promotion_id].to_s)}/cancel",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Square::Types::CancelLoyaltyPromotionResponse.load(response.body))
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
