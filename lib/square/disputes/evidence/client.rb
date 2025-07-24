# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_dispute_evidence_response"
require_relative "../../types/get_dispute_evidence_response"
require_relative "../../types/delete_dispute_evidence_response"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Disputes
    class EvidenceClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Disputes::EvidenceClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a list of evidence associated with a dispute.
      #
      # @param dispute_id [String] The ID of the dispute.
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListDisputeEvidenceResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.evidence.list(dispute_id: "dispute_id")
      def list(dispute_id:, cursor: nil, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence"
end
        square.rb::ListDisputeEvidenceResponse.from_json(json_object: response.body)
      end
# Returns the metadata for the evidence specified in the request URL path.
#  You must maintain a copy of any evidence uploaded if you want to reference it
#  later. Evidence cannot be downloaded after you upload it.
      #
      # @param dispute_id [String] The ID of the dispute from which you want to retrieve evidence metadata.
      # @param evidence_id [String] The ID of the evidence to retrieve.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetDisputeEvidenceResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.evidence.get(dispute_id: "dispute_id", evidence_id: "evidence_id")
      def get(dispute_id:, evidence_id:, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence/#{evidence_id}"
end
        square.rb::GetDisputeEvidenceResponse.from_json(json_object: response.body)
      end
# Removes specified evidence from a dispute.
#  Square does not send the bank any evidence that is removed.
      #
      # @param dispute_id [String] The ID of the dispute from which you want to remove evidence.
      # @param evidence_id [String] The ID of the evidence you want to remove.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteDisputeEvidenceResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.evidence.delete(dispute_id: "dispute_id", evidence_id: "evidence_id")
      def delete(dispute_id:, evidence_id:, request_options: nil)
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence/#{evidence_id}"
end
        square.rb::DeleteDisputeEvidenceResponse.from_json(json_object: response.body)
      end
    end
    class AsyncEvidenceClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Disputes::AsyncEvidenceClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a list of evidence associated with a dispute.
      #
      # @param dispute_id [String] The ID of the dispute.
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListDisputeEvidenceResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.evidence.list(dispute_id: "dispute_id")
      def list(dispute_id:, cursor: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence"
end
          square.rb::ListDisputeEvidenceResponse.from_json(json_object: response.body)
        end
      end
# Returns the metadata for the evidence specified in the request URL path.
#  You must maintain a copy of any evidence uploaded if you want to reference it
#  later. Evidence cannot be downloaded after you upload it.
      #
      # @param dispute_id [String] The ID of the dispute from which you want to retrieve evidence metadata.
      # @param evidence_id [String] The ID of the evidence to retrieve.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetDisputeEvidenceResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.evidence.get(dispute_id: "dispute_id", evidence_id: "evidence_id")
      def get(dispute_id:, evidence_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence/#{evidence_id}"
end
          square.rb::GetDisputeEvidenceResponse.from_json(json_object: response.body)
        end
      end
# Removes specified evidence from a dispute.
#  Square does not send the bank any evidence that is removed.
      #
      # @param dispute_id [String] The ID of the dispute from which you want to remove evidence.
      # @param evidence_id [String] The ID of the evidence you want to remove.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteDisputeEvidenceResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.evidence.delete(dispute_id: "dispute_id", evidence_id: "evidence_id")
      def delete(dispute_id:, evidence_id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence/#{evidence_id}"
end
          square.rb::DeleteDisputeEvidenceResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end