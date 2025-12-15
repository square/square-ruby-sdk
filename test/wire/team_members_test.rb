# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class TeamMembersWireTest < Minitest::Test
  WIREMOCK_BASE_URL = "http://localhost:8080"
  WIREMOCK_ADMIN_URL = "http://localhost:8080/__admin"

  def setup
    super
    return if ENV["RUN_WIRE_TESTS"] == "true"

    skip "Wire tests are disabled by default. Set RUN_WIRE_TESTS=true to enable them."
  end

  def verify_request_count(test_id:, method:, url_path:, expected:, query_params: nil)
    uri = URI("#{WIREMOCK_ADMIN_URL}/requests/find")
    http = Net::HTTP.new(uri.host, uri.port)
    post_request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })

    request_body = { "method" => method, "urlPath" => url_path }
    request_body["headers"] = { "X-Test-Id" => { "equalTo" => test_id } }
    request_body["queryParameters"] = query_params.transform_values { |v| { "equalTo" => v } } if query_params

    post_request.body = request_body.to_json
    response = http.request(post_request)
    result = JSON.parse(response.body)
    requests = result["requests"] || []

    assert_equal expected, requests.length, "Expected #{expected} requests, found #{requests.length}"
  end

  def test_team_members_create_with_wiremock
    test_id = "team_members.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.create(
      idempotency_key: "idempotency-key-0",
      team_member: {
        reference_id: "reference_id_1",
        status: "ACTIVE",
        given_name: "Joe",
        family_name: "Doe",
        email_address: "joe_doe@gmail.com",
        phone_number: "+14159283333",
        assigned_locations: {
          assignment_type: "EXPLICIT_LOCATIONS",
          location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
        },
        wage_setting: {
          job_assignments: [{
            pay_type: "SALARY",
            annual_rate: {
              amount: 3_000_000,
              currency: "USD"
            },
            weekly_hours: 40,
            job_id: "FjS8x95cqHiMenw4f1NAUH4P"
          }, {
            pay_type: "HOURLY",
            hourly_rate: {
              amount: 2000,
              currency: "USD"
            },
            job_id: "VDNpRv8da51NU8qZFC5zDWpF"
          }],
          is_overtime_exempt: true
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/team-members",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_members_batch_create_with_wiremock
    test_id = "team_members.batch_create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.batch_create(
      team_members: {
        "idempotency-key-1" => {
          team_member: {
            reference_id: "reference_id_1",
            given_name: "Joe",
            family_name: "Doe",
            email_address: "joe_doe@gmail.com",
            phone_number: "+14159283333",
            assigned_locations: {
              assignment_type: "EXPLICIT_LOCATIONS",
              location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
            }
          }
        },
        "idempotency-key-2" => {
          team_member: {
            reference_id: "reference_id_2",
            given_name: "Jane",
            family_name: "Smith",
            email_address: "jane_smith@gmail.com",
            phone_number: "+14159223334",
            assigned_locations: {
              assignment_type: "ALL_CURRENT_AND_FUTURE_LOCATIONS"
            }
          }
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.batch_create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/team-members/bulk-create",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_members_batch_update_with_wiremock
    test_id = "team_members.batch_update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.batch_update(
      team_members: {
        "AFMwA08kR-MIF-3Vs0OE" => {
          team_member: {
            reference_id: "reference_id_2",
            is_owner: false,
            status: "ACTIVE",
            given_name: "Jane",
            family_name: "Smith",
            email_address: "jane_smith@gmail.com",
            phone_number: "+14159223334",
            assigned_locations: {
              assignment_type: "ALL_CURRENT_AND_FUTURE_LOCATIONS"
            }
          }
        },
        "fpgteZNMaf0qOK-a4t6P" => {
          team_member: {
            reference_id: "reference_id_1",
            is_owner: false,
            status: "ACTIVE",
            given_name: "Joe",
            family_name: "Doe",
            email_address: "joe_doe@gmail.com",
            phone_number: "+14159283333",
            assigned_locations: {
              assignment_type: "EXPLICIT_LOCATIONS",
              location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
            }
          }
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.batch_update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/team-members/bulk-update",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_members_search_with_wiremock
    test_id = "team_members.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.search(
      query: {
        filter: {
          location_ids: ["0G5P3VGACMMQZ"],
          status: "ACTIVE"
        }
      },
      limit: 10,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/team-members/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_members_get_with_wiremock
    test_id = "team_members.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.get(
      team_member_id: "team_member_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/team-members/team_member_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_members_update_with_wiremock
    test_id = "team_members.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.update(
      team_member_id: "team_member_id",
      team_member: {
        reference_id: "reference_id_1",
        status: "ACTIVE",
        given_name: "Joe",
        family_name: "Doe",
        email_address: "joe_doe@gmail.com",
        phone_number: "+14159283333",
        assigned_locations: {
          assignment_type: "EXPLICIT_LOCATIONS",
          location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
        },
        wage_setting: {
          job_assignments: [{
            pay_type: "SALARY",
            annual_rate: {
              amount: 3_000_000,
              currency: "USD"
            },
            weekly_hours: 40,
            job_id: "FjS8x95cqHiMenw4f1NAUH4P"
          }, {
            pay_type: "HOURLY",
            hourly_rate: {
              amount: 1200,
              currency: "USD"
            },
            job_id: "VDNpRv8da51NU8qZFC5zDWpF"
          }],
          is_overtime_exempt: true
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/team-members/team_member_id",
      query_params: nil,
      expected: 1
    )
  end
end
