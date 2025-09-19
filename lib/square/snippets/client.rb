# frozen_string_literal: true

module Square
  module Snippets
    class Client
      # @return [Square::Snippets::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet applications, but you can retrieve only the snippet that was added by your application.
      #
      # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @return [Square::Types::GetSnippetResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/sites/#{params[:site_id]}/snippet"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetSnippetResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Adds a snippet to a Square Online site or updates the existing snippet on the site.
      # The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages. A snippet application can add one snippet to a given site.
      #
      # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @return [Square::Types::UpsertSnippetResponse]
      def upsert(request_options: {}, **params)
        _path_param_names = ["site_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/sites/#{params[:site_id]}/snippet",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpsertSnippetResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Removes your snippet from a Square Online site.
      #
      # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @return [Square::Types::DeleteSnippetResponse]
      def delete(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "DELETE",
          path: "v2/sites/#{params[:site_id]}/snippet"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteSnippetResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
