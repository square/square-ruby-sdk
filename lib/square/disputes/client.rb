# frozen_string_literal: true

module Square
  module Disputes
    class Client
      # @return [Square::Disputes::Client]
      def initialize(client:)
        @client = client
      end

      # Returns a list of disputes associated with a particular account.
      #
      # @return [Square::Types::ListDisputesResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[cursor states location_id]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/disputes",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListDisputesResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns details about a specific dispute.
      #
      # @return [Square::Types::GetDisputeResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/disputes/#{params[:dispute_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetDisputeResponse.load(_response.body)
        end

        raise _response.body
      end

      # Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and
      # updates the dispute state to ACCEPTED.
      #
      # Square debits the disputed amount from the seller’s Square account. If the Square account
      # does not have sufficient funds, Square debits the associated bank account.
      #
      # @return [Square::Types::AcceptDisputeResponse]
      def accept(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/accept"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::AcceptDisputeResponse.load(_response.body)
        end

        raise _response.body
      end

      # Uploads a file to use as evidence in a dispute challenge. The endpoint accepts HTTP
      # multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF formats.
      #
      # @return [Square::Types::CreateDisputeEvidenceFileResponse]
      def create_evidence_file(request_options: {}, **params)
        body = Internal::Multipart::FormData.new

        if params[:request]
          body.add(
            name: "request",
            value: params[:request],
            content_type: "application/json; charset=utf-8"
          )
        end
        body.add_part(params[:image_file].to_form_data_part(name: "image_file")) if params[:image_file]

        _request = Square::Internal::Multipart::Request.new(
          method: POST,
          path: "v2/disputes/#{params[:dispute_id]}/evidence-files",
          body: body
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateDisputeEvidenceFileResponse.load(_response.body)
        end

        raise _response.body
      end

      # Uploads text to use as evidence for a dispute challenge.
      #
      # @return [Square::Types::CreateDisputeEvidenceTextResponse]
      def create_evidence_text(request_options: {}, **params)
        _path_param_names = ["dispute_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/evidence-text",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateDisputeEvidenceTextResponse.load(_response.body)
        end

        raise _response.body
      end

      # Submits evidence to the cardholder's bank.
      #
      # The evidence submitted by this endpoint includes evidence uploaded
      # using the [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) and
      # [CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText) endpoints and
      # evidence automatically provided by Square, when available. Evidence cannot be removed from
      # a dispute after submission.
      #
      # @return [Square::Types::SubmitEvidenceResponse]
      def submit_evidence(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/submit-evidence"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SubmitEvidenceResponse.load(_response.body)
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
