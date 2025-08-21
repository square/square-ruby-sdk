# frozen_string_literal: true

module Square
  module Team
    class Client
      # @return [Square::Team::Client]
      def initialize(client:)
        @client = client
      end

      # Lists jobs in a seller account. Results are sorted by title in ascending order.
      #
      # @return [Square::Types::ListJobsResponse]
      def list_jobs(request_options: {}, **params)
        _query_param_names = ["cursor"]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/team-members/jobs",
          query: _query
        )
        _response = @client.send(_request)
        return Square::Types::ListJobsResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # Creates a job in a seller account. A job defines a title and tip eligibility. Note that
      # compensation is defined in a [job assignment](entity:JobAssignment) in a team member's wage setting.
      #
      # @return [Square::Types::CreateJobResponse]
      def create_job(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/team-members/jobs",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateJobResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a specified job.
      #
      # @return [Square::Types::RetrieveJobResponse]
      def retrieve_job(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/team-members/jobs/#{params[:job_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveJobResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates the title or tip eligibility of a job. Changes to the title propagate to all
      # `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job ID. Changes to
      # tip eligibility propagate to all `TeamMemberWage` objects that reference the job ID.
      #
      # @return [Square::Types::UpdateJobResponse]
      def update_job(request_options: {}, **params)
        _path_param_names = ["job_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/team-members/jobs/#{params[:job_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateJobResponse.load(_response.body)
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
