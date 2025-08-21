# frozen_string_literal: true

module Square
  module OAuth
    class Client
      # @return [Square::OAuth::Client]
      def initialize(client:)
        @client = client
      end

      # Revokes an access token generated with the OAuth flow.
      #
      # If an account has more than one OAuth access token for your application, this
      # endpoint revokes all of them, regardless of which token you specify.
      #
      # __Important:__ The `Authorization` header for this endpoint must have the
      # following format:
      #
      # ```
      # Authorization: Client APPLICATION_SECRET
      # ```
      #
      # Replace `APPLICATION_SECRET` with the application secret on the **OAuth**
      # page for your application in the Developer Dashboard.
      #
      # @return [Square::Types::RevokeTokenResponse]
      def revoke_token(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "oauth2/revoke",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RevokeTokenResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns an OAuth access token and refresh token using the `authorization_code`
      # or `refresh_token` grant type.
      #
      # When `grant_type` is `authorization_code`:
      # - With the [code flow](https://developer.squareup.com/docs/oauth-api/overview#code-flow),
      # provide `code`, `client_id`, and `client_secret`.
      # - With the [PKCE flow](https://developer.squareup.com/docs/oauth-api/overview#pkce-flow),
      # provide `code`, `client_id`, and `code_verifier`.
      #
      # When `grant_type` is `refresh_token`:
      # - With the code flow, provide `refresh_token`, `client_id`, and `client_secret`.
      # The response returns the same refresh token provided in the request.
      # - With the PKCE flow, provide `refresh_token` and `client_id`. The response returns
      # a new refresh token.
      #
      # You can use the `scopes` parameter to limit the set of permissions authorized by the
      # access token. You can use the `short_lived` parameter to create an access token that
      # expires in 24 hours.
      #
      # __Important:__ OAuth tokens should be encrypted and stored on a secure server.
      # Application clients should never interact directly with OAuth tokens.
      #
      # @return [Square::Types::ObtainTokenResponse]
      def obtain_token(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "oauth2/token",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ObtainTokenResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns information about an [OAuth access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token) or an application’s [personal access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).
      #
      # Add the access token to the Authorization header of the request.
      #
      # __Important:__ The `Authorization` header you provide to this endpoint must have the following format:
      #
      # ```
      # Authorization: Bearer ACCESS_TOKEN
      # ```
      #
      # where `ACCESS_TOKEN` is a
      # [valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).
      #
      # If the access token is expired or not a valid access token, the endpoint returns an `UNAUTHORIZED` error.
      #
      # @return [Square::Types::RetrieveTokenStatusResponse]
      def retrieve_token_status(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "oauth2/token/status"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveTokenStatusResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [untyped]
      def authorize(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "oauth2/authorize"
        )
        _response = @client.send(_request)
        return if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # @return [Square::Mobile::Client]
      def mobile
        @mobile ||= Square::Mobile::Client.new(client: @raw_client)
      end

      # @return [Square::OAuth::Client]
      def oAuth
        @oAuth ||= Square::OAuth::Client.new(client: @raw_client)
      end

      # @return [Square::V1Transactions::Client]
      def v1Transactions
        @v1Transactions ||= Square::V1Transactions::Client.new(client: @raw_client)
      end

      # @return [Square::ApplePay::Client]
      def applePay
        @applePay ||= Square::ApplePay::Client.new(client: @raw_client)
      end

      # @return [Square::BankAccounts::Client]
      def bankAccounts
        @bankAccounts ||= Square::BankAccounts::Client.new(client: @raw_client)
      end

      # @return [Square::Bookings::Client]
      def bookings
        @bookings ||= Square::Bookings::Client.new(client: @raw_client)
      end

      # @return [Square::Cards::Client]
      def cards
        @cards ||= Square::Cards::Client.new(client: @raw_client)
      end

      # @return [Square::Catalog::Client]
      def catalog
        @catalog ||= Square::Catalog::Client.new(client: @raw_client)
      end

      # @return [Square::Customers::Client]
      def customers
        @customers ||= Square::Customers::Client.new(client: @raw_client)
      end

      # @return [Square::Devices::Client]
      def devices
        @devices ||= Square::Devices::Client.new(client: @raw_client)
      end

      # @return [Square::Disputes::Client]
      def disputes
        @disputes ||= Square::Disputes::Client.new(client: @raw_client)
      end

      # @return [Square::Employees::Client]
      def employees
        @employees ||= Square::Employees::Client.new(client: @raw_client)
      end

      # @return [Square::Events::Client]
      def events
        @events ||= Square::Events::Client.new(client: @raw_client)
      end

      # @return [Square::GiftCards::Client]
      def giftCards
        @giftCards ||= Square::GiftCards::Client.new(client: @raw_client)
      end

      # @return [Square::Inventory::Client]
      def inventory
        @inventory ||= Square::Inventory::Client.new(client: @raw_client)
      end

      # @return [Square::Invoices::Client]
      def invoices
        @invoices ||= Square::Invoices::Client.new(client: @raw_client)
      end

      # @return [Square::Labor::Client]
      def labor
        @labor ||= Square::Labor::Client.new(client: @raw_client)
      end

      # @return [Square::Locations::Client]
      def locations
        @locations ||= Square::Locations::Client.new(client: @raw_client)
      end

      # @return [Square::Loyalty::Client]
      def loyalty
        @loyalty ||= Square::Loyalty::Client.new(client: @raw_client)
      end

      # @return [Square::Merchants::Client]
      def merchants
        @merchants ||= Square::Merchants::Client.new(client: @raw_client)
      end

      # @return [Square::Checkout::Client]
      def checkout
        @checkout ||= Square::Checkout::Client.new(client: @raw_client)
      end

      # @return [Square::Orders::Client]
      def orders
        @orders ||= Square::Orders::Client.new(client: @raw_client)
      end

      # @return [Square::Payments::Client]
      def payments
        @payments ||= Square::Payments::Client.new(client: @raw_client)
      end

      # @return [Square::Payouts::Client]
      def payouts
        @payouts ||= Square::Payouts::Client.new(client: @raw_client)
      end

      # @return [Square::Refunds::Client]
      def refunds
        @refunds ||= Square::Refunds::Client.new(client: @raw_client)
      end

      # @return [Square::Sites::Client]
      def sites
        @sites ||= Square::Sites::Client.new(client: @raw_client)
      end

      # @return [Square::Snippets::Client]
      def snippets
        @snippets ||= Square::Snippets::Client.new(client: @raw_client)
      end

      # @return [Square::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Square::Subscriptions::Client.new(client: @raw_client)
      end

      # @return [Square::TeamMembers::Client]
      def teamMembers
        @teamMembers ||= Square::TeamMembers::Client.new(client: @raw_client)
      end

      # @return [Square::Team::Client]
      def team
        @team ||= Square::Team::Client.new(client: @raw_client)
      end

      # @return [Square::Terminal::Client]
      def terminal
        @terminal ||= Square::Terminal::Client.new(client: @raw_client)
      end

      # @return [Square::Vendors::Client]
      def vendors
        @vendors ||= Square::Vendors::Client.new(client: @raw_client)
      end

      # @return [Square::CashDrawers::Client]
      def cashDrawers
        @cashDrawers ||= Square::CashDrawers::Client.new(client: @raw_client)
      end

      # @return [Square::Webhooks::Client]
      def webhooks
        @webhooks ||= Square::Webhooks::Client.new(client: @raw_client)
      end
    end
  end
end
