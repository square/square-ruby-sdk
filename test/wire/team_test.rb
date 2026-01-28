# frozen_string_literal: true

require_relative "wiremock_test_case"

class TeamWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_team_list_jobs_with_wiremock
    test_id = "team.list_jobs.0"

    @client.team.list_jobs(
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "team.list_jobs.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/team-members/jobs",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_create_job_with_wiremock
    test_id = "team.create_job.0"

    @client.team.create_job(
      job: {
        title: "Cashier",
        is_tip_eligible: true
      },
      idempotency_key: "idempotency-key-0",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "team.create_job.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/team-members/jobs",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_retrieve_job_with_wiremock
    test_id = "team.retrieve_job.0"

    @client.team.retrieve_job(
      job_id: "job_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "team.retrieve_job.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/team-members/jobs/job_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_update_job_with_wiremock
    test_id = "team.update_job.0"

    @client.team.update_job(
      job_id: "job_id",
      job: {
        title: "Cashier 1",
        is_tip_eligible: true
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "team.update_job.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/team-members/jobs/job_id",
      query_params: nil,
      expected: 1
    )
  end
end
