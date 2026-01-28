# frozen_string_literal: true

module Square
  module Snippets
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet
      # applications, but you can retrieve only the snippet that was added by your application.
      #
      # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information,
      # see [Early access program for Square Online
      # APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :site_id
      #
      # @return [Square::Types::GetSnippetResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/sites/#{params[:site_id]}/snippet",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetSnippetResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Adds a snippet to a Square Online site or updates the existing snippet on the site.
      # The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages.
      # A snippet application can add one snippet to a given site.
      #
      # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information,
      # see [Early access program for Square Online
      # APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @param request_options [Hash]
      # @param params [Square::Snippets::Types::UpsertSnippetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :site_id
      #
      # @return [Square::Types::UpsertSnippetResponse]
      def upsert(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Snippets::Types::UpsertSnippetRequest.new(params).to_h
        non_body_param_names = ["site_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/sites/#{params[:site_id]}/snippet",
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
          Square::Types::UpsertSnippetResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Removes your snippet from a Square Online site.
      #
      # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information,
      # see [Early access program for Square Online
      # APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :site_id
      #
      # @return [Square::Types::DeleteSnippetResponse]
      def delete(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/sites/#{params[:site_id]}/snippet",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteSnippetResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
