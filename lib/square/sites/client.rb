# frozen_string_literal: true

module Square
  module Sites
    class Client
      # @return [Square::Sites::Client]
      def initialize(client:)
        @client = client
      end

      # Lists the Square Online sites that belong to a seller. Sites are listed in descending order by the `created_at` date.
      #
      #
      # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
      #
      # @return [Square::Types::ListSitesResponse]
      def list(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/sites"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListSitesResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
