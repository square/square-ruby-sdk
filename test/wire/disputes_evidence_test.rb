# frozen_string_literal: true

require_relative "wiremock_test_case"

class DisputesEvidenceWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_disputes_evidence_list_with_wiremock
    test_id = "disputes.evidence.list.0"

    result = @client.disputes.evidence.list(
      dispute_id: "dispute_id",
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.evidence.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/disputes/dispute_id/evidence",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_evidence_get_with_wiremock
    test_id = "disputes.evidence.get.0"

    @client.disputes.evidence.get(
      dispute_id: "dispute_id",
      evidence_id: "evidence_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.evidence.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/disputes/dispute_id/evidence/evidence_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_evidence_delete_with_wiremock
    test_id = "disputes.evidence.delete.0"

    @client.disputes.evidence.delete(
      dispute_id: "dispute_id",
      evidence_id: "evidence_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.evidence.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/disputes/dispute_id/evidence/evidence_id",
      query_params: nil,
      expected: 1
    )
  end
end
