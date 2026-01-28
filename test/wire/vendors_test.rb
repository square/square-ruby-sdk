# frozen_string_literal: true

require_relative "wiremock_test_case"

class VendorsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_vendors_batch_create_with_wiremock
    test_id = "vendors.batch_create.0"

    @client.vendors.batch_create(
      vendors: {
        "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe" => {
          name: "Joe's Fresh Seafood",
          address: {
            address_line_1: "505 Electric Ave",
            address_line_2: "Suite 600",
            locality: "New York",
            administrative_district_level_1: "NY",
            postal_code: "10003",
            country: "US"
          },
          contacts: [{
            name: "Joe Burrow",
            email_address: "joe@joesfreshseafood.com",
            phone_number: "1-212-555-4250",
            ordinal: 1
          }],
          account_number: "4025391",
          note: "a vendor"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "vendors.batch_create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/bulk-create",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_batch_get_with_wiremock
    test_id = "vendors.batch_get.0"

    @client.vendors.batch_get(
      vendor_ids: ["INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "vendors.batch_get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/bulk-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_batch_update_with_wiremock
    test_id = "vendors.batch_update.0"

    @client.vendors.batch_update(
      vendors: {
        FMCYHBWT1TPL8MFH52PBMEN92A: {
          vendor: {}
        },
        INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4: {
          vendor: {}
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "vendors.batch_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/vendors/bulk-update",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_create_with_wiremock
    test_id = "vendors.create.0"

    @client.vendors.create(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      vendor: {
        name: "Joe's Fresh Seafood",
        address: {
          address_line_1: "505 Electric Ave",
          address_line_2: "Suite 600",
          locality: "New York",
          administrative_district_level_1: "NY",
          postal_code: "10003",
          country: "US"
        },
        contacts: [{
          name: "Joe Burrow",
          email_address: "joe@joesfreshseafood.com",
          phone_number: "1-212-555-4250",
          ordinal: 1
        }],
        account_number: "4025391",
        note: "a vendor"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "vendors.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_search_with_wiremock
    test_id = "vendors.search.0"

    @client.vendors.search(request_options: {
                             additional_headers: {
                               "X-Test-Id" => "vendors.search.0"
                             }
                           })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_get_with_wiremock
    test_id = "vendors.get.0"

    @client.vendors.get(
      vendor_id: "vendor_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "vendors.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/vendors/vendor_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_update_with_wiremock
    test_id = "vendors.update.0"

    @client.vendors.update(
      vendor_id: "vendor_id",
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      vendor: {
        id: "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4",
        name: "Jack's Chicken Shack",
        version: 1,
        status: "ACTIVE"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "vendors.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/vendors/vendor_id",
      query_params: nil,
      expected: 1
    )
  end
end
