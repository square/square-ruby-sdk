# frozen_string_literal: true

module Square
  module Disputes
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns a list of disputes associated with a particular account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :cursor
      # @option params [Square::Types::DisputeState, nil] :states
      # @option params [String, nil] :location_id
      #
      # @return [Square::Types::ListDisputesResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[cursor states location_id]
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["states"] = params[:states] if params.key?(:states)
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :disputes,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/disputes",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListDisputesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Returns details about a specific dispute.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :dispute_id
      #
      # @return [Square::Types::GetDisputeResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/disputes/#{params[:dispute_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetDisputeResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and
      # updates the dispute state to ACCEPTED.
      #
      # Square debits the disputed amount from the seller’s Square account. If the Square account
      # does not have sufficient funds, Square debits the associated bank account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :dispute_id
      #
      # @return [Square::Types::AcceptDisputeResponse]
      def accept(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/accept",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::AcceptDisputeResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Uploads a file to use as evidence in a dispute challenge. The endpoint accepts HTTP
      # multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF formats.
      #
      # @param request_options [Hash]
      # @param params [void]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :dispute_id
      #
      # @return [Square::Types::CreateDisputeEvidenceFileResponse]
      def create_evidence_file(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        body = Internal::Multipart::FormData.new

        if params[:request]
          body.add(
            name: "request",
            value: params[:request],
            content_type: "application/json; charset=utf-8"
          )
        end
        body.add_part(params[:image_file].to_form_data_part(name: "image_file")) if params[:image_file]

        request = Square::Internal::Multipart::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/evidence-files",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateDisputeEvidenceFileResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Uploads text to use as evidence for a dispute challenge.
      #
      # @param request_options [Hash]
      # @param params [Square::Disputes::Types::CreateDisputeEvidenceTextRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :dispute_id
      #
      # @return [Square::Types::CreateDisputeEvidenceTextResponse]
      def create_evidence_text(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Disputes::Types::CreateDisputeEvidenceTextRequest.new(params).to_h
        non_body_param_names = ["dispute_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/evidence-text",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateDisputeEvidenceTextResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :dispute_id
      #
      # @return [Square::Types::SubmitEvidenceResponse]
      def submit_evidence(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/disputes/#{params[:dispute_id]}/submit-evidence",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SubmitEvidenceResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::Evidence::Client]
      def evidence
        @evidence ||= Square::Disputes::Evidence::Client.new(client: @client)
      end
    end
  end
end
