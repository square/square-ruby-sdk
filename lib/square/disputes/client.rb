# frozen_string_literal: true
require_relative "../../requests"
require_relative "evidence/client"
require_relative "../types/dispute_state"
require_relative "../types/list_disputes_response"
require_relative "../types/get_dispute_response"
require_relative "../types/accept_dispute_response"
require_relative "../types/create_dispute_evidence_file_request"
require_relative "../types/create_dispute_evidence_file_response"
require_relative "../../core/file_utilities"
require_relative "../types/dispute_evidence_type"
require_relative "../types/create_dispute_evidence_text_response"
require_relative "../types/submit_evidence_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class DisputesClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client
  # @return [square.rb::Disputes::EvidenceClient] 
    attr_reader :evidence


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::DisputesClient]
    def initialize(request_client:)
      @request_client = request_client
      @evidence = square.rb::Disputes::EvidenceClient.new(request_client: request_client)
    end
# Returns a list of disputes associated with a particular account.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param states [square.rb::DisputeState] The dispute states used to filter the result. If not specified, the endpoint
#  returns all disputes.
    # @param location_id [String] The ID of the location for which to return a list of disputes.
#  If not specified, the endpoint returns disputes associated with all locations.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListDisputesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.list
    def list(cursor: nil, states: nil, location_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "states": states, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes"
end
      square.rb::ListDisputesResponse.from_json(json_object: response.body)
    end
# Returns details about a specific dispute.
    #
    # @param dispute_id [String] The ID of the dispute you want more details about.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetDisputeResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.get(dispute_id: "dispute_id")
    def get(dispute_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}"
end
      square.rb::GetDisputeResponse.from_json(json_object: response.body)
    end
# Accepts the loss on a dispute. Square returns the disputed amount to the
#  cardholder and
#  updates the dispute state to ACCEPTED.
#  Square debits the disputed amount from the seller’s Square account. If the
#  Square account
#  does not have sufficient funds, Square debits the associated bank account.
    #
    # @param dispute_id [String] The ID of the dispute you want to accept.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::AcceptDisputeResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.accept(dispute_id: "dispute_id")
    def accept(dispute_id:, request_options: nil)
      response = @request_client.conn.post do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/accept"
end
      square.rb::AcceptDisputeResponse.from_json(json_object: response.body)
    end
# Uploads a file to use as evidence in a dispute challenge. The endpoint accepts
#  HTTP
#  multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF
#  formats.
    #
    # @param dispute_id [String] The ID of the dispute for which you want to upload evidence.
    # @param request [Hash] Request of type square.rb::CreateDisputeEvidenceFileRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :evidence_type (square.rb::DisputeEvidenceType) 
    #   * :content_type (String) 
    # @param image_file [String, IO] 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateDisputeEvidenceFileResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.create_evidence_file(dispute_id: "dispute_id", image_file: my_file.txt)
    def create_evidence_file(dispute_id:, request: nil, image_file: nil, request_options: nil)
      response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  square.rb::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence-files"
end
      square.rb::CreateDisputeEvidenceFileResponse.from_json(json_object: response.body)
    end
# Uploads text to use as evidence for a dispute challenge.
    #
    # @param dispute_id [String] The ID of the dispute for which you want to upload evidence.
    # @param idempotency_key [String] A unique key identifying the request. For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param evidence_type [square.rb::DisputeEvidenceType] The type of evidence you are uploading.
#  See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    # @param evidence_text [String] The evidence string.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateDisputeEvidenceTextResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.create_evidence_text(
#    dispute_id: "dispute_id",
#    idempotency_key: "ed3ee3933d946f1514d505d173c82648",
#    evidence_type: TRACKING_NUMBER,
#    evidence_text: "1Z8888888888888888"
#  )
    def create_evidence_text(dispute_id:, idempotency_key:, evidence_type: nil, evidence_text:, request_options: nil)
      response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, evidence_type: evidence_type, evidence_text: evidence_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence-text"
end
      square.rb::CreateDisputeEvidenceTextResponse.from_json(json_object: response.body)
    end
# Submits evidence to the cardholder's bank.
#  The evidence submitted by this endpoint includes evidence uploaded
#  using the
#  [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) and
#  [CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText)
#  endpoints and
#  evidence automatically provided by Square, when available. Evidence cannot be
#  removed from
#  a dispute after submission.
    #
    # @param dispute_id [String] The ID of the dispute for which you want to submit evidence.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SubmitEvidenceResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.submit_evidence(dispute_id: "dispute_id")
    def submit_evidence(dispute_id:, request_options: nil)
      response = @request_client.conn.post do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/submit-evidence"
end
      square.rb::SubmitEvidenceResponse.from_json(json_object: response.body)
    end
  end
  class AsyncDisputesClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client
  # @return [square.rb::Disputes::EvidenceClient] 
    attr_reader :evidence


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncDisputesClient]
    def initialize(request_client:)
      @request_client = request_client
      @evidence = square.rb::Disputes::AsyncEvidenceClient.new(request_client: request_client)
    end
# Returns a list of disputes associated with a particular account.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param states [square.rb::DisputeState] The dispute states used to filter the result. If not specified, the endpoint
#  returns all disputes.
    # @param location_id [String] The ID of the location for which to return a list of disputes.
#  If not specified, the endpoint returns disputes associated with all locations.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListDisputesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.list
    def list(cursor: nil, states: nil, location_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "states": states, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes"
end
        square.rb::ListDisputesResponse.from_json(json_object: response.body)
      end
    end
# Returns details about a specific dispute.
    #
    # @param dispute_id [String] The ID of the dispute you want more details about.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetDisputeResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.get(dispute_id: "dispute_id")
    def get(dispute_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}"
end
        square.rb::GetDisputeResponse.from_json(json_object: response.body)
      end
    end
# Accepts the loss on a dispute. Square returns the disputed amount to the
#  cardholder and
#  updates the dispute state to ACCEPTED.
#  Square debits the disputed amount from the seller’s Square account. If the
#  Square account
#  does not have sufficient funds, Square debits the associated bank account.
    #
    # @param dispute_id [String] The ID of the dispute you want to accept.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::AcceptDisputeResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.accept(dispute_id: "dispute_id")
    def accept(dispute_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/accept"
end
        square.rb::AcceptDisputeResponse.from_json(json_object: response.body)
      end
    end
# Uploads a file to use as evidence in a dispute challenge. The endpoint accepts
#  HTTP
#  multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF
#  formats.
    #
    # @param dispute_id [String] The ID of the dispute for which you want to upload evidence.
    # @param request [Hash] Request of type square.rb::CreateDisputeEvidenceFileRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :evidence_type (square.rb::DisputeEvidenceType) 
    #   * :content_type (String) 
    # @param image_file [String, IO] 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateDisputeEvidenceFileResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.create_evidence_file(dispute_id: "dispute_id", image_file: my_file.txt)
    def create_evidence_file(dispute_id:, request: nil, image_file: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  square.rb::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence-files"
end
        square.rb::CreateDisputeEvidenceFileResponse.from_json(json_object: response.body)
      end
    end
# Uploads text to use as evidence for a dispute challenge.
    #
    # @param dispute_id [String] The ID of the dispute for which you want to upload evidence.
    # @param idempotency_key [String] A unique key identifying the request. For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param evidence_type [square.rb::DisputeEvidenceType] The type of evidence you are uploading.
#  See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    # @param evidence_text [String] The evidence string.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateDisputeEvidenceTextResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.create_evidence_text(
#    dispute_id: "dispute_id",
#    idempotency_key: "ed3ee3933d946f1514d505d173c82648",
#    evidence_type: TRACKING_NUMBER,
#    evidence_text: "1Z8888888888888888"
#  )
    def create_evidence_text(dispute_id:, idempotency_key:, evidence_type: nil, evidence_text:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, evidence_type: evidence_type, evidence_text: evidence_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/evidence-text"
end
        square.rb::CreateDisputeEvidenceTextResponse.from_json(json_object: response.body)
      end
    end
# Submits evidence to the cardholder's bank.
#  The evidence submitted by this endpoint includes evidence uploaded
#  using the
#  [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) and
#  [CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText)
#  endpoints and
#  evidence automatically provided by Square, when available. Evidence cannot be
#  removed from
#  a dispute after submission.
    #
    # @param dispute_id [String] The ID of the dispute for which you want to submit evidence.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SubmitEvidenceResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.disputes.submit_evidence(dispute_id: "dispute_id")
    def submit_evidence(dispute_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/disputes/#{dispute_id}/submit-evidence"
end
        square.rb::SubmitEvidenceResponse.from_json(json_object: response.body)
      end
    end
  end
end