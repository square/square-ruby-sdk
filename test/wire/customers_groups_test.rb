# frozen_string_literal: true

require_relative "wiremock_test_case"

class CustomersGroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_customers_groups_list_with_wiremock
    test_id = "customers.groups.list.0"

    result = @client.customers.groups.list(
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_create_with_wiremock
    test_id = "customers.groups.create.0"

    @client.customers.groups.create(
      group: {
        name: "Loyal Customers"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_get_with_wiremock
    test_id = "customers.groups.get.0"

    @client.customers.groups.get(
      group_id: "group_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_update_with_wiremock
    test_id = "customers.groups.update.0"

    @client.customers.groups.update(
      group_id: "group_id",
      group: {
        name: "Loyal Customers"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/customers/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_delete_with_wiremock
    test_id = "customers.groups.delete.0"

    @client.customers.groups.delete(
      group_id: "group_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_add_with_wiremock
    test_id = "customers.groups.add.0"

    @client.customers.groups.add(
      customer_id: "customer_id",
      group_id: "group_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.add.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/customers/customer_id/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_remove_with_wiremock
    test_id = "customers.groups.remove.0"

    @client.customers.groups.remove(
      customer_id: "customer_id",
      group_id: "group_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.groups.remove.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/customer_id/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end
end
