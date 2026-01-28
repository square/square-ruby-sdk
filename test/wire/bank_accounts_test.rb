# frozen_string_literal: true

require_relative "wiremock_test_case"

class BankAccountsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_bank_accounts_list_with_wiremock
    test_id = "bank_accounts.list.0"

    result = @client.bank_accounts.list(
      cursor: "cursor",
      limit: 1,
      location_id: "location_id",
      customer_id: "customer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_accounts.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bank-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_create_bank_account_with_wiremock
    test_id = "bank_accounts.create_bank_account.0"

    @client.bank_accounts.create_bank_account(
      idempotency_key: "4e43559a-f0fd-47d3-9da2-7ea1f97d94be",
      source_id: "bnon:CA4SEHsQwr0rx6DbWLD5BQaqMnoYAQ",
      customer_id: "HM3B2D5JKGZ69359BTEHXM2V8M",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_accounts.create_bank_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bank-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_get_by_v_1_id_with_wiremock
    test_id = "bank_accounts.get_by_v_1_id.0"

    @client.bank_accounts.get_by_v_1_id(
      v_1_bank_account_id: "v1_bank_account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_accounts.get_by_v_1_id.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bank-accounts/by-v1-id/v1_bank_account_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_get_with_wiremock
    test_id = "bank_accounts.get.0"

    @client.bank_accounts.get(
      bank_account_id: "bank_account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_accounts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bank-accounts/bank_account_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_accounts_disable_bank_account_with_wiremock
    test_id = "bank_accounts.disable_bank_account.0"

    @client.bank_accounts.disable_bank_account(
      bank_account_id: "bank_account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_accounts.disable_bank_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bank-accounts/bank_account_id/disable",
      query_params: nil,
      expected: 1
    )
  end
end
