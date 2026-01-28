# frozen_string_literal: true

require_relative "wiremock_test_case"

class DisputesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_disputes_list_with_wiremock
    test_id = "disputes.list.0"

    result = @client.disputes.list(
      cursor: "cursor",
      states: "INQUIRY_EVIDENCE_REQUIRED",
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/disputes",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_get_with_wiremock
    test_id = "disputes.get.0"

    @client.disputes.get(
      dispute_id: "dispute_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/disputes/dispute_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_accept_with_wiremock
    test_id = "disputes.accept.0"

    @client.disputes.accept(
      dispute_id: "dispute_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.accept.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/accept",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_create_evidence_file_with_wiremock
    test_id = "disputes.create_evidence_file.0"

    @client.disputes.create_evidence_file(
      dispute_id: "dispute_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.create_evidence_file.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/evidence-files",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_create_evidence_text_with_wiremock
    test_id = "disputes.create_evidence_text.0"

    @client.disputes.create_evidence_text(
      dispute_id: "dispute_id",
      idempotency_key: "ed3ee3933d946f1514d505d173c82648",
      evidence_type: "TRACKING_NUMBER",
      evidence_text: "1Z8888888888888888",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.create_evidence_text.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/evidence-text",
      query_params: nil,
      expected: 1
    )
  end

  def test_disputes_submit_evidence_with_wiremock
    test_id = "disputes.submit_evidence.0"

    @client.disputes.submit_evidence(
      dispute_id: "dispute_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "disputes.submit_evidence.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/disputes/dispute_id/submit-evidence",
      query_params: nil,
      expected: 1
    )
  end
end
