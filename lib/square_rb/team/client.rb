# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/list_jobs_response"
require_relative "../types/job"
require_relative "../types/create_job_response"
require_relative "../types/retrieve_job_response"
require_relative "../types/update_job_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class TeamClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::TeamClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Lists jobs in a seller account. Results are sorted by title in ascending order.
    #
    # @param cursor [String] The pagination cursor returned by the previous call to this endpoint. Provide
#  this
#  cursor to retrieve the next page of results for your original request. For more
#  information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListJobsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.list_jobs
    def list_jobs(cursor: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs"
end
      SquareApiClient::ListJobsResponse.from_json(json_object: response.body)
    end
# Creates a job in a seller account. A job defines a title and tip eligibility.
#  Note that
#  compensation is defined in a [job assignment](entity:JobAssignment) in a team
#  member's wage setting.
    #
    # @param job [Hash] The job to create. The `title` field is required and `is_tip_eligible` defaults
#  to true.Request of type SquareApiClient::Job, as a Hash
    #   * :id (String) 
    #   * :title (String) 
    #   * :is_tip_eligible (Boolean) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :version (Integer) 
    # @param idempotency_key [String] A unique identifier for the `CreateJob` request. Keys can be any valid string,
#  but must be unique for each request. For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateJobResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.create_job(job: { title: "Cashier", is_tip_eligible: true }, idempotency_key: "idempotency-key-0")
    def create_job(job:, idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), job: job, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs"
end
      SquareApiClient::CreateJobResponse.from_json(json_object: response.body)
    end
# Retrieves a specified job.
    #
    # @param job_id [String] The ID of the job to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RetrieveJobResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.retrieve_job(job_id: "job_id")
    def retrieve_job(job_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs/#{job_id}"
end
      SquareApiClient::RetrieveJobResponse.from_json(json_object: response.body)
    end
# Updates the title or tip eligibility of a job. Changes to the title propagate to
#  all
#  `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job
#  ID. Changes to
#  tip eligibility propagate to all `TeamMemberWage` objects that reference the job
#  ID.
    #
    # @param job_id [String] The ID of the job to update.
    # @param job [Hash] The job with the updated fields, either `title`, `is_tip_eligible`, or both.
#  Only changed fields need
#  to be included in the request. Optionally include `version` to enable optimistic
#  concurrency control.Request of type SquareApiClient::Job, as a Hash
    #   * :id (String) 
    #   * :title (String) 
    #   * :is_tip_eligible (Boolean) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :version (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateJobResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.update_job(job_id: "job_id", job: { title: "Cashier 1", is_tip_eligible: true })
    def update_job(job_id:, job:, request_options: nil)
      response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), job: job }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs/#{job_id}"
end
      SquareApiClient::UpdateJobResponse.from_json(json_object: response.body)
    end
  end
  class AsyncTeamClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncTeamClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Lists jobs in a seller account. Results are sorted by title in ascending order.
    #
    # @param cursor [String] The pagination cursor returned by the previous call to this endpoint. Provide
#  this
#  cursor to retrieve the next page of results for your original request. For more
#  information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListJobsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.list_jobs
    def list_jobs(cursor: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs"
end
        SquareApiClient::ListJobsResponse.from_json(json_object: response.body)
      end
    end
# Creates a job in a seller account. A job defines a title and tip eligibility.
#  Note that
#  compensation is defined in a [job assignment](entity:JobAssignment) in a team
#  member's wage setting.
    #
    # @param job [Hash] The job to create. The `title` field is required and `is_tip_eligible` defaults
#  to true.Request of type SquareApiClient::Job, as a Hash
    #   * :id (String) 
    #   * :title (String) 
    #   * :is_tip_eligible (Boolean) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :version (Integer) 
    # @param idempotency_key [String] A unique identifier for the `CreateJob` request. Keys can be any valid string,
#  but must be unique for each request. For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateJobResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.create_job(job: { title: "Cashier", is_tip_eligible: true }, idempotency_key: "idempotency-key-0")
    def create_job(job:, idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), job: job, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs"
end
        SquareApiClient::CreateJobResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a specified job.
    #
    # @param job_id [String] The ID of the job to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RetrieveJobResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.retrieve_job(job_id: "job_id")
    def retrieve_job(job_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs/#{job_id}"
end
        SquareApiClient::RetrieveJobResponse.from_json(json_object: response.body)
      end
    end
# Updates the title or tip eligibility of a job. Changes to the title propagate to
#  all
#  `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job
#  ID. Changes to
#  tip eligibility propagate to all `TeamMemberWage` objects that reference the job
#  ID.
    #
    # @param job_id [String] The ID of the job to update.
    # @param job [Hash] The job with the updated fields, either `title`, `is_tip_eligible`, or both.
#  Only changed fields need
#  to be included in the request. Optionally include `version` to enable optimistic
#  concurrency control.Request of type SquareApiClient::Job, as a Hash
    #   * :id (String) 
    #   * :title (String) 
    #   * :is_tip_eligible (Boolean) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :version (Integer) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateJobResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team.update_job(job_id: "job_id", job: { title: "Cashier 1", is_tip_eligible: true })
    def update_job(job_id:, job:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), job: job }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/jobs/#{job_id}"
end
        SquareApiClient::UpdateJobResponse.from_json(json_object: response.body)
      end
    end
  end
end