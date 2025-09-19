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
        _query_param_names = [
          %w[cursor states location_id],
          %i[cursor states location_id]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/disputes",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::ListDisputesResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns details about a specific dispute.
      #
      # @return [Square::Types::GetDisputeResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/disputes/#{params[:dispute_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetDisputeResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
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
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/accept"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::AcceptDisputeResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
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
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateDisputeEvidenceFileResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Uploads text to use as evidence for a dispute challenge.
      #
      # @return [Square::Types::CreateDisputeEvidenceTextResponse]
      def create_evidence_text(request_options: {}, **params)
        _path_param_names = ["dispute_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/evidence-text",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateDisputeEvidenceTextResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
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
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/submit-evidence"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::SubmitEvidenceResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [Square::Evidence::Client]
      def evidence
        @evidence ||= Square::Disputes::Evidence::Client.new(client: @client)
      end
    end
  end
end
