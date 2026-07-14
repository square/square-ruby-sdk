# frozen_string_literal: true

require_relative "wiremock_test_case"

class InventoryWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_inventory_list_inventory_adjustment_reasons_with_wiremock
    test_id = "inventory.list_inventory_adjustment_reasons.0"

    @client.inventory.list_inventory_adjustment_reasons(
      include_deleted: true,
      include_system_codes: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.list_inventory_adjustment_reasons.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/adjustment-reasons",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_create_inventory_adjustment_reason_with_wiremock
    test_id = "inventory.create_inventory_adjustment_reason.0"

    @client.inventory.create_inventory_adjustment_reason(
      idempotency_key: "27b2f2b1-1c2a-4b9e-8f3a-0d9c3a1e5b47",
      adjustment_reason: {
        id: {
          type: "CUSTOM"
        },
        name: "Donated to charity",
        direction: "DECREASE"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.create_inventory_adjustment_reason.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/adjustment-reasons/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_delete_inventory_adjustment_reason_with_wiremock
    test_id = "inventory.delete_inventory_adjustment_reason.0"

    @client.inventory.delete_inventory_adjustment_reason(
      reason_id: {
        type: "CUSTOM",
        custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.delete_inventory_adjustment_reason.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/adjustment-reasons/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_restore_inventory_adjustment_reason_with_wiremock
    test_id = "inventory.restore_inventory_adjustment_reason.0"

    @client.inventory.restore_inventory_adjustment_reason(
      reason_id: {
        type: "CUSTOM",
        custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.restore_inventory_adjustment_reason.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/adjustment-reasons/restore",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_retrieve_inventory_adjustment_reason_with_wiremock
    test_id = "inventory.retrieve_inventory_adjustment_reason.0"

    @client.inventory.retrieve_inventory_adjustment_reason(
      reason_id: {
        type: "CUSTOM",
        custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.retrieve_inventory_adjustment_reason.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/adjustment-reasons/retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_update_inventory_adjustment_reason_with_wiremock
    test_id = "inventory.update_inventory_adjustment_reason.0"

    @client.inventory.update_inventory_adjustment_reason(
      reason_id: {
        type: "CUSTOM",
        custom_reason_id: "R5BX3PDCZ6EXAMPLE"
      },
      adjustment_reason: {
        id: {
          type: "CUSTOM",
          custom_reason_id: "R5BX3PDCZ6EXAMPLE"
        },
        name: "Charitable donation"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.update_inventory_adjustment_reason.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/inventory/adjustment-reasons/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_get_adjustment_with_wiremock
    test_id = "inventory.deprecated_get_adjustment.0"

    @client.inventory.deprecated_get_adjustment(
      adjustment_id: "adjustment_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.deprecated_get_adjustment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/adjustment/adjustment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_update_inventory_adjustment_with_wiremock
    test_id = "inventory.update_inventory_adjustment.0"

    @client.inventory.update_inventory_adjustment(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      adjustment: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.update_inventory_adjustment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/inventory/adjustments/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_adjustment_with_wiremock
    test_id = "inventory.get_adjustment.0"

    @client.inventory.get_adjustment(
      adjustment_id: "adjustment_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.get_adjustment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/adjustments/adjustment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_batch_change_with_wiremock
    test_id = "inventory.deprecated_batch_change.0"

    @client.inventory.deprecated_batch_change(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      changes: [{
        type: "PHYSICAL_COUNT",
        physical_count: {
          reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92",
          catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI",
          state: "IN_STOCK",
          location_id: "C6W5YS5QM06F5",
          quantity: "53",
          team_member_id: "LRK57NSQ5X7PUD05",
          occurred_at: "2016-11-16T22:25:24.878Z"
        }
      }],
      ignore_unchanged_counts: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.deprecated_batch_change.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/batch-change",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_batch_get_changes_with_wiremock
    test_id = "inventory.deprecated_batch_get_changes.0"

    @client.inventory.deprecated_batch_get_changes(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["C6W5YS5QM06F5"],
      types: ["PHYSICAL_COUNT"],
      states: ["IN_STOCK"],
      updated_after: "2016-11-01T00:00:00.000Z",
      updated_before: "2016-12-01T00:00:00.000Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.deprecated_batch_get_changes.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/batch-retrieve-changes",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_batch_get_counts_with_wiremock
    test_id = "inventory.deprecated_batch_get_counts.0"

    @client.inventory.deprecated_batch_get_counts(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["59TNP9SA8VGDA"],
      updated_after: "2016-11-16T00:00:00.000Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.deprecated_batch_get_counts.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/batch-retrieve-counts",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_batch_create_changes_with_wiremock
    test_id = "inventory.batch_create_changes.0"

    @client.inventory.batch_create_changes(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      changes: [{
        type: "PHYSICAL_COUNT",
        physical_count: {
          reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92",
          catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI",
          state: "IN_STOCK",
          location_id: "C6W5YS5QM06F5",
          quantity: "53",
          team_member_id: "LRK57NSQ5X7PUD05",
          occurred_at: "2016-11-16T22:25:24.878Z"
        }
      }],
      ignore_unchanged_counts: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.batch_create_changes.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/changes/batch-create",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_batch_get_changes_with_wiremock
    test_id = "inventory.batch_get_changes.0"

    result = @client.inventory.batch_get_changes(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["C6W5YS5QM06F5"],
      types: ["PHYSICAL_COUNT"],
      states: ["IN_STOCK"],
      updated_after: "2016-11-01T00:00:00.000Z",
      updated_before: "2016-12-01T00:00:00.000Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.batch_get_changes.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/changes/batch-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_batch_get_counts_with_wiremock
    test_id = "inventory.batch_get_counts.0"

    result = @client.inventory.batch_get_counts(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["59TNP9SA8VGDA"],
      updated_after: "2016-11-16T00:00:00.000Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.batch_get_counts.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/counts/batch-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_get_physical_count_with_wiremock
    test_id = "inventory.deprecated_get_physical_count.0"

    @client.inventory.deprecated_get_physical_count(
      physical_count_id: "physical_count_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.deprecated_get_physical_count.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/physical-count/physical_count_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_physical_count_with_wiremock
    test_id = "inventory.get_physical_count.0"

    @client.inventory.get_physical_count(
      physical_count_id: "physical_count_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.get_physical_count.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/physical-counts/physical_count_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_with_wiremock
    test_id = "inventory.get.0"

    result = @client.inventory.get(
      catalog_object_id: "catalog_object_id",
      location_ids: "location_ids",
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.get.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/catalog_object_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_changes_with_wiremock
    test_id = "inventory.changes.0"

    result = @client.inventory.changes(
      catalog_object_id: "catalog_object_id",
      location_ids: "location_ids",
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.changes.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/catalog_object_id/changes",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_transfer_with_wiremock
    test_id = "inventory.get_transfer.0"

    @client.inventory.get_transfer(
      transfer_id: "transfer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inventory.get_transfer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/transfers/transfer_id",
      query_params: nil,
      expected: 1
    )
  end
end
