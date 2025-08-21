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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/sites/#{params[:site_id]}/snippet"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetSnippetResponse.load(_response.body)
        end

        raise _response.body
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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/sites/#{params[:site_id]}/snippet",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpsertSnippetResponse.load(_response.body)
        end

        raise _response.body
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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/sites/#{params[:site_id]}/snippet"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteSnippetResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
