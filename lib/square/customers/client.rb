# frozen_string_literal: true

module Square
  module Customers
    class Client
      # @return [Square::Customers::Client]
      def initialize(client:)
        @client = client
      end

      # Lists customer profiles associated with a Square account.
      #
      # Under normal operating conditions, newly created or updated customer profiles become available
      # for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated
      # profiles can take closer to one minute or longer, especially during network incidents and outages.
      #
      # @return [Square::Types::ListCustomersResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[cursor limit sort_field sort_order count]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/customers",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListCustomersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a new customer for a business.
      #
      # You must provide at least one of the following values in your request to this
      # endpoint:
      #
      # - `given_name`
      # - `family_name`
      # - `company_name`
      # - `email_address`
      # - `phone_number`
      #
      # @return [Square::Types::CreateCustomerResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/customers",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateCustomerResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates multiple [customer profiles](entity:Customer) for a business.
      #
      # This endpoint takes a map of individual create requests and returns a map of responses.
      #
      # You must provide at least one of the following values in each create request:
      #
      # - `given_name`
      # - `family_name`
      # - `company_name`
      # - `email_address`
      # - `phone_number`
      #
      # @return [Square::Types::BulkCreateCustomersResponse]
      def batch_create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/customers/bulk-create",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkCreateCustomersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deletes multiple customer profiles.
      #
      # The endpoint takes a list of customer IDs and returns a map of responses.
      #
      # @return [Square::Types::BulkDeleteCustomersResponse]
      def bulk_delete_customers(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/customers/bulk-delete",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkDeleteCustomersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves multiple customer profiles.
      #
      # This endpoint takes a list of customer IDs and returns a map of responses.
      #
      # @return [Square::Types::BulkRetrieveCustomersResponse]
      def bulk_retrieve_customers(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/customers/bulk-retrieve",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkRetrieveCustomersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates multiple customer profiles.
      #
      # This endpoint takes a map of individual update requests and returns a map of responses.
      #
      # @return [Square::Types::BulkUpdateCustomersResponse]
      def bulk_update_customers(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/customers/bulk-update",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkUpdateCustomersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Searches the customer profiles associated with a Square account using one or more supported query filters.
      #
      # Calling `SearchCustomers` without any explicit query filter returns all
      # customer profiles ordered alphabetically based on `given_name` and
      # `family_name`.
      #
      # Under normal operating conditions, newly created or updated customer profiles become available
      # for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated
      # profiles can take closer to one minute or longer, especially during network incidents and outages.
      #
      # @return [Square::Types::SearchCustomersResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/customers/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchCustomersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns details for a single customer.
      #
      # @return [Square::Types::GetCustomerResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/customers/#{params[:customer_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetCustomerResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a customer profile. This endpoint supports sparse updates, so only new or changed fields are required in the request.
      # To add or update a field, specify the new value. To remove a field, specify `null`.
      #
      # To update a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
      #
      # @return [Square::Types::UpdateCustomerResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["customer_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/customers/#{params[:customer_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateCustomerResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deletes a customer profile from a business.
      #
      # To delete a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
      #
      # @return [Square::Types::DeleteCustomerResponse]
      def delete(request_options: {}, **params)
        _query_param_names = ["version"]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/customers/#{params[:customer_id]}",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteCustomerResponse.load(_response.body)
        end

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
