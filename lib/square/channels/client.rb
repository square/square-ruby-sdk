# frozen_string_literal: true

module Square
  module Channels
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Channel` in the `channels`
      # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListChannelsResponse`, including its other fields.
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
      # @option params [Square::Types::ReferenceType, nil] :reference_type
      # @option params [String, nil] :reference_id
      # @option params [Square::Types::ChannelStatus, nil] :status
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      #
      # @example
      #   client.channels.list(
      #     reference_type: "UNKNOWN_TYPE",
      #     reference_id: "reference_id",
      #     status: "ACTIVE",
      #     cursor: "cursor",
      #     limit: 1
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["reference_type"] = params[:reference_type] if params.key?(:reference_type)
        query_params["reference_id"] = params[:reference_id] if params.key?(:reference_id)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :channels,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/channels",
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListChannelsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # @param request_options [Hash]
      # @param params [Square::Channels::Types::BulkRetrieveChannelsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.channels.bulk_retrieve(channel_ids: %w[CH_9C03D0B59 CH_6X139B5MN NOT_EXISTING])
      #
      # @return [Square::Types::BulkRetrieveChannelsResponse]
      def bulk_retrieve(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/channels/bulk-retrieve",
          body: Square::Channels::Types::BulkRetrieveChannelsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkRetrieveChannelsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :channel_id
      #
      # @example
      #   client.channels.get(channel_id: "channel_id")
      #
      # @return [Square::Types::RetrieveChannelResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/channels/#{URI.encode_uri_component(params[:channel_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::RetrieveChannelResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
