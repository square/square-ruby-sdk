# frozen_string_literal: true

module Square
  module Payouts
    class Client
      # @return [Square::Payouts::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of all payouts for the default location.
      # You can filter payouts by location ID, status, time range, and order them in ascending or descending order.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::ListPayoutsResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[location_id status begin_time end_time sort_order cursor limit]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payouts",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListPayoutsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves details of a specific payout identified by a payout ID.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::GetPayoutResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payouts/#{params[:payout_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetPayoutResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a list of all payout entries for a specific payout.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::ListPayoutEntriesResponse]
      def list_entries(request_options: {}, **params)
        _query_param_names = %w[sort_order cursor limit]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payouts/#{params[:payout_id]}/payout-entries",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListPayoutEntriesResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
