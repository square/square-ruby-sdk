# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyProgramsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_loyalty_programs_list_with_wiremock
    test_id = "loyalty.programs.list.0"

    @client.loyalty.programs.list(request_options: {
                                    additional_headers: {
                                      "X-Test-Id" => "loyalty.programs.list.0"
                                    }
                                  })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_programs_get_with_wiremock
    test_id = "loyalty.programs.get.0"

    @client.loyalty.programs.get(
      program_id: "program_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs/program_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_programs_calculate_with_wiremock
    test_id = "loyalty.programs.calculate.0"

    @client.loyalty.programs.calculate(
      program_id: "program_id",
      order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY",
      loyalty_account_id: "79b807d2-d786-46a9-933b-918028d7a8c5",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.calculate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/calculate",
      query_params: nil,
      expected: 1
    )
  end
end
