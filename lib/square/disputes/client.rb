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

      # @return [Square::Evidence::Client]
      def evidence
        @evidence ||= Square::Evidence::Client.new(client: @raw_client)
      end
    end
  end
end
