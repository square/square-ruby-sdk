# frozen_string_literal: true

require_relative "wiremock_test_case"

class OAuthWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_o_auth_revoke_token_with_wiremock
    test_id = "o_auth.revoke_token.0"

    @client.o_auth.revoke_token(
      client_id: "CLIENT_ID",
      access_token: "ACCESS_TOKEN",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "o_auth.revoke_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth2/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_obtain_token_with_wiremock
    test_id = "o_auth.obtain_token.0"

    @client.o_auth.obtain_token(
      client_id: "sq0idp-uaPHILoPzWZk3tlJqlML0g",
      client_secret: "sq0csp-30a-4C_tVOnTh14Piza2BfTPBXyLafLPWSzY1qAjeBfM",
      code: "sq0cgb-l0SBqxs4uwxErTVyYOdemg",
      grant_type: "authorization_code",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "o_auth.obtain_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth2/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_retrieve_token_status_with_wiremock
    test_id = "o_auth.retrieve_token_status.0"

    @client.o_auth.retrieve_token_status(request_options: {
                                           additional_headers: {
                                             "X-Test-Id" => "o_auth.retrieve_token_status.0"
                                           }
                                         })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth2/token/status",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_authorize_with_wiremock
    test_id = "o_auth.authorize.0"

    @client.o_auth.authorize(request_options: {
                               additional_headers: {
                                 "X-Test-Id" => "o_auth.authorize.0"
                               }
                             })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/oauth2/authorize",
      query_params: nil,
      expected: 1
    )
  end
end
