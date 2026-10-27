# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrdersWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_orders_create_with_wiremock
    test_id = "orders.create.0"

    result = @client.orders.create(
      order: {
        location_id: "057P5VYJ4A5X1",
        reference_id: "my-order-001",
        line_items: [{
          name: "New York Strip Steak",
          quantity: "1",
          base_price_money: {
            amount: 1599,
            currency: "USD"
          }
        }, {
          quantity: "2",
          catalog_object_id: "BEMYCSMIJL46OCDV4KYIKXIB",
          modifiers: [{
            catalog_object_id: "CHQX7Y4KY6N5KINJKZCFURPZ"
          }],
          applied_discounts: [{
            discount_uid: "one-dollar-off"
          }]
        }],
        taxes: [{
          uid: "state-sales-tax",
          name: "State Sales Tax",
          percentage: "9",
          scope: "ORDER"
        }],
        discounts: [{
          uid: "labor-day-sale",
          name: "Labor Day Sale",
          percentage: "5",
          scope: "ORDER"
        }, {
          uid: "membership-discount",
          catalog_object_id: "DB7L55ZH2BGWI4H23ULIWOQ7",
          scope: "ORDER"
        }, {
          uid: "one-dollar-off",
          name: "Sale - $1.00 off",
          amount_money: {
            amount: 100,
            currency: "USD"
          },
          scope: "LINE_ITEM"
        }]
      },
      idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders",
      expected: {
        "/order/line_items/0/base_price_money/amount" => 1599,
        "/order/discounts/2/amount_money/amount" => 100
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order/line_items/0/applied_taxes/0/applied_money/amount" => 136,
        "/order/line_items/0/applied_discounts/0/applied_money/amount" => 8,
        "/order/line_items/0/applied_discounts/1/applied_money/amount" => 79,
        "/order/line_items/0/base_price_money/amount" => 1599,
        "/order/line_items/0/variation_total_price_money/amount" => 1599,
        "/order/line_items/0/gross_sales_money/amount" => 1599,
        "/order/line_items/0/total_tax_money/amount" => 136,
        "/order/line_items/0/total_discount_money/amount" => 87,
        "/order/line_items/0/total_money/amount" => 1648,
        "/order/line_items/0/total_service_charge_money/amount" => 0,
        "/order/line_items/1/modifiers/0/base_price_money/amount" => 50,
        "/order/line_items/1/modifiers/0/total_price_money/amount" => 100,
        "/order/line_items/1/applied_taxes/0/applied_money/amount" => 374,
        "/order/line_items/1/applied_discounts/0/applied_money/amount" => 22,
        "/order/line_items/1/applied_discounts/1/applied_money/amount" => 224,
        "/order/line_items/1/applied_discounts/2/applied_money/amount" => 100,
        "/order/line_items/1/base_price_money/amount" => 2200,
        "/order/line_items/1/variation_total_price_money/amount" => 4400,
        "/order/line_items/1/gross_sales_money/amount" => 4500,
        "/order/line_items/1/total_tax_money/amount" => 374,
        "/order/line_items/1/total_discount_money/amount" => 346,
        "/order/line_items/1/total_money/amount" => 4528,
        "/order/line_items/1/total_service_charge_money/amount" => 0,
        "/order/taxes/0/applied_money/amount" => 510,
        "/order/discounts/0/applied_money/amount" => 30,
        "/order/discounts/1/applied_money/amount" => 303,
        "/order/discounts/2/amount_money/amount" => 100,
        "/order/discounts/2/applied_money/amount" => 100,
        "/order/net_amounts/total_money/amount" => 6176,
        "/order/net_amounts/tax_money/amount" => 510,
        "/order/net_amounts/discount_money/amount" => 433,
        "/order/net_amounts/tip_money/amount" => 0,
        "/order/net_amounts/service_charge_money/amount" => 0,
        "/order/version" => 1,
        "/order/total_money/amount" => 6176,
        "/order/total_tax_money/amount" => 510,
        "/order/total_discount_money/amount" => 433,
        "/order/total_tip_money/amount" => 0,
        "/order/total_service_charge_money/amount" => 0,
        "/order/net_amount_due_money/amount" => 1000000
      }
    )
  end

  def test_orders_batch_get_with_wiremock
    test_id = "orders.batch_get.0"

    result = @client.orders.batch_get(
      location_id: "057P5VYJ4A5X1",
      order_ids: %w[CAISEM82RcpmcFBM0TfOyiHV3es CAISENgvlJ6jLWAzERDzjyHVybY],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.batch_get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/batch-retrieve",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/orders/0/line_items/0/base_price_money/amount" => 1599,
        "/orders/0/line_items/0/total_money/amount" => 1599,
        "/orders/0/line_items/1/base_price_money/amount" => 2000,
        "/orders/0/line_items/1/total_money/amount" => 6000,
        "/orders/0/version" => 1,
        "/orders/0/total_money/amount" => 7599
      }
    )
  end

  def test_orders_calculate_with_wiremock
    test_id = "orders.calculate.0"

    result = @client.orders.calculate(
      order: {
        location_id: "D7AVYMEAPJ3A3",
        line_items: [{
          name: "Item 1",
          quantity: "1",
          base_price_money: {
            amount: 500,
            currency: "USD"
          }
        }, {
          name: "Item 2",
          quantity: "2",
          base_price_money: {
            amount: 300,
            currency: "USD"
          }
        }],
        discounts: [{
          name: "50% Off",
          percentage: "50",
          scope: "ORDER"
        }]
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.calculate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/calculate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/calculate",
      expected: {
        "/order/line_items/0/base_price_money/amount" => 500,
        "/order/line_items/1/base_price_money/amount" => 300
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order/line_items/0/applied_discounts/0/applied_money/amount" => 250,
        "/order/line_items/0/base_price_money/amount" => 500,
        "/order/line_items/0/variation_total_price_money/amount" => 500,
        "/order/line_items/0/gross_sales_money/amount" => 500,
        "/order/line_items/0/total_tax_money/amount" => 0,
        "/order/line_items/0/total_discount_money/amount" => 250,
        "/order/line_items/0/total_money/amount" => 250,
        "/order/line_items/0/total_service_charge_money/amount" => 0,
        "/order/line_items/1/applied_discounts/0/applied_money/amount" => 300,
        "/order/line_items/1/base_price_money/amount" => 300,
        "/order/line_items/1/variation_total_price_money/amount" => 600,
        "/order/line_items/1/gross_sales_money/amount" => 600,
        "/order/line_items/1/total_tax_money/amount" => 0,
        "/order/line_items/1/total_discount_money/amount" => 300,
        "/order/line_items/1/total_money/amount" => 300,
        "/order/line_items/1/total_service_charge_money/amount" => 0,
        "/order/discounts/0/applied_money/amount" => 550,
        "/order/net_amounts/total_money/amount" => 550,
        "/order/net_amounts/tax_money/amount" => 0,
        "/order/net_amounts/discount_money/amount" => 550,
        "/order/net_amounts/tip_money/amount" => 0,
        "/order/net_amounts/service_charge_money/amount" => 0,
        "/order/version" => 1,
        "/order/total_money/amount" => 550,
        "/order/total_tax_money/amount" => 0,
        "/order/total_discount_money/amount" => 550,
        "/order/total_tip_money/amount" => 0,
        "/order/total_service_charge_money/amount" => 0,
        "/order/net_amount_due_money/amount" => 1000000
      }
    )
  end

  def test_orders_clone_with_wiremock
    test_id = "orders.clone.0"

    result = @client.orders.clone(
      order_id: "ZAISEM52YcpmcWAzERDOyiWS123",
      version: 3,
      idempotency_key: "UNIQUE_STRING",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.clone.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/clone",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/clone",
      expected: {
        "/version" => 3
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order/line_items/0/applied_taxes/0/applied_money/amount" => 136,
        "/order/line_items/0/applied_discounts/0/applied_money/amount" => 8,
        "/order/line_items/0/applied_discounts/1/applied_money/amount" => 79,
        "/order/line_items/0/base_price_money/amount" => 1599,
        "/order/line_items/0/variation_total_price_money/amount" => 1599,
        "/order/line_items/0/gross_sales_money/amount" => 1599,
        "/order/line_items/0/total_tax_money/amount" => 136,
        "/order/line_items/0/total_discount_money/amount" => 87,
        "/order/line_items/0/total_money/amount" => 1648,
        "/order/line_items/0/total_service_charge_money/amount" => 0,
        "/order/line_items/1/modifiers/0/base_price_money/amount" => 50,
        "/order/line_items/1/modifiers/0/total_price_money/amount" => 100,
        "/order/line_items/1/applied_taxes/0/applied_money/amount" => 374,
        "/order/line_items/1/applied_discounts/0/applied_money/amount" => 22,
        "/order/line_items/1/applied_discounts/1/applied_money/amount" => 224,
        "/order/line_items/1/applied_discounts/2/applied_money/amount" => 100,
        "/order/line_items/1/base_price_money/amount" => 2200,
        "/order/line_items/1/variation_total_price_money/amount" => 4400,
        "/order/line_items/1/gross_sales_money/amount" => 4500,
        "/order/line_items/1/total_tax_money/amount" => 374,
        "/order/line_items/1/total_discount_money/amount" => 346,
        "/order/line_items/1/total_money/amount" => 4528,
        "/order/line_items/1/total_service_charge_money/amount" => 0,
        "/order/taxes/0/applied_money/amount" => 510,
        "/order/discounts/0/applied_money/amount" => 30,
        "/order/discounts/1/applied_money/amount" => 303,
        "/order/discounts/2/amount_money/amount" => 100,
        "/order/discounts/2/applied_money/amount" => 100,
        "/order/net_amounts/total_money/amount" => 6176,
        "/order/net_amounts/tax_money/amount" => 510,
        "/order/net_amounts/discount_money/amount" => 433,
        "/order/net_amounts/tip_money/amount" => 0,
        "/order/net_amounts/service_charge_money/amount" => 0,
        "/order/version" => 1,
        "/order/total_money/amount" => 6176,
        "/order/total_tax_money/amount" => 510,
        "/order/total_discount_money/amount" => 433,
        "/order/total_tip_money/amount" => 0,
        "/order/total_service_charge_money/amount" => 0,
        "/order/net_amount_due_money/amount" => 1000000
      }
    )
  end

  def test_orders_search_with_wiremock
    test_id = "orders.search.0"

    result = @client.orders.search(
      location_ids: %w[057P5VYJ4A5X1 18YC4JDH91E1H],
      query: {
        filter: {
          state_filter: {
            states: ["COMPLETED"]
          },
          date_time_filter: {
            closed_at: {
              start_at: "2018-03-03T20:00:00+00:00",
              end_at: "2019-03-04T21:54:45+00:00"
            }
          }
        },
        sort: {
          sort_field: "CLOSED_AT",
          sort_order: "DESC"
        }
      },
      limit: 3,
      return_entries: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/search",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/search",
      expected: {
        "/limit" => 3
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order_entries/0/version" => 1,
        "/order_entries/1/version" => 1,
        "/order_entries/2/version" => 1,
        "/orders/0/version" => 1
      }
    )
  end

  def test_orders_get_with_wiremock
    test_id = "orders.get.0"

    result = @client.orders.get(
      order_id: "order_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/orders/order_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order/line_items/0/applied_discounts/0/applied_money/amount" => 250,
        "/order/line_items/0/base_price_money/amount" => 500,
        "/order/line_items/0/variation_total_price_money/amount" => 500,
        "/order/line_items/0/gross_sales_money/amount" => 500,
        "/order/line_items/0/total_tax_money/amount" => 0,
        "/order/line_items/0/total_discount_money/amount" => 250,
        "/order/line_items/0/total_money/amount" => 250,
        "/order/line_items/0/total_service_charge_money/amount" => 0,
        "/order/line_items/1/applied_discounts/0/applied_money/amount" => 300,
        "/order/line_items/1/base_price_money/amount" => 300,
        "/order/line_items/1/variation_total_price_money/amount" => 600,
        "/order/line_items/1/gross_sales_money/amount" => 600,
        "/order/line_items/1/total_tax_money/amount" => 0,
        "/order/line_items/1/total_discount_money/amount" => 300,
        "/order/line_items/1/total_money/amount" => 300,
        "/order/line_items/1/total_service_charge_money/amount" => 0,
        "/order/discounts/0/applied_money/amount" => 550,
        "/order/net_amounts/total_money/amount" => 550,
        "/order/net_amounts/tax_money/amount" => 0,
        "/order/net_amounts/discount_money/amount" => 550,
        "/order/net_amounts/tip_money/amount" => 0,
        "/order/net_amounts/service_charge_money/amount" => 0,
        "/order/version" => 1,
        "/order/total_money/amount" => 550,
        "/order/total_tax_money/amount" => 0,
        "/order/total_discount_money/amount" => 550,
        "/order/total_tip_money/amount" => 0,
        "/order/total_service_charge_money/amount" => 0,
        "/order/net_amount_due_money/amount" => 1000000
      }
    )
  end

  def test_orders_update_with_wiremock
    test_id = "orders.update.0"

    result = @client.orders.update(
      order_id: "order_id",
      order: {
        location_id: "location_id",
        line_items: [{
          uid: "cookie_uid",
          name: "COOKIE",
          quantity: "2",
          base_price_money: {
            amount: 200,
            currency: "USD"
          }
        }],
        version: 1
      },
      fields_to_clear: ["discounts"],
      idempotency_key: "UNIQUE_STRING",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/orders/order_id",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/orders/order_id",
      expected: {
        "/order/line_items/0/base_price_money/amount" => 200,
        "/order/version" => 1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order/line_items/0/base_price_money/amount" => 500,
        "/order/line_items/0/variation_total_price_money/amount" => 500,
        "/order/line_items/0/gross_sales_money/amount" => 500,
        "/order/line_items/0/total_tax_money/amount" => 0,
        "/order/line_items/0/total_discount_money/amount" => 0,
        "/order/line_items/0/total_money/amount" => 500,
        "/order/line_items/0/total_service_charge_money/amount" => 0,
        "/order/line_items/1/base_price_money/amount" => 200,
        "/order/line_items/1/variation_total_price_money/amount" => 400,
        "/order/line_items/1/gross_sales_money/amount" => 400,
        "/order/line_items/1/total_tax_money/amount" => 0,
        "/order/line_items/1/total_discount_money/amount" => 0,
        "/order/line_items/1/total_money/amount" => 400,
        "/order/line_items/1/total_service_charge_money/amount" => 0,
        "/order/net_amounts/total_money/amount" => 900,
        "/order/net_amounts/tax_money/amount" => 0,
        "/order/net_amounts/discount_money/amount" => 0,
        "/order/net_amounts/service_charge_money/amount" => 0,
        "/order/version" => 2,
        "/order/total_money/amount" => 900,
        "/order/total_tax_money/amount" => 0,
        "/order/total_discount_money/amount" => 0,
        "/order/total_tip_money/amount" => 1000000,
        "/order/total_service_charge_money/amount" => 0,
        "/order/net_amount_due_money/amount" => 1000000
      }
    )
  end

  def test_orders_pay_with_wiremock
    test_id = "orders.pay.0"

    result = @client.orders.pay(
      order_id: "order_id",
      idempotency_key: "c043a359-7ad9-4136-82a9-c3f1d66dcbff",
      payment_ids: %w[EnZdNAlWCmfh6Mt5FMNST1o7taB 0LRiVlbXVwe8ozu4KbZxd12mvaB],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.pay.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/order_id/pay",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/order/line_items/0/base_price_money/amount" => 500,
        "/order/line_items/0/gross_sales_money/amount" => 500,
        "/order/line_items/0/total_tax_money/amount" => 0,
        "/order/line_items/0/total_discount_money/amount" => 0,
        "/order/line_items/0/total_money/amount" => 500,
        "/order/line_items/0/total_service_charge_money/amount" => 0,
        "/order/line_items/1/base_price_money/amount" => 750,
        "/order/line_items/1/gross_sales_money/amount" => 1500,
        "/order/line_items/1/total_tax_money/amount" => 0,
        "/order/line_items/1/total_discount_money/amount" => 0,
        "/order/line_items/1/total_money/amount" => 1500,
        "/order/line_items/1/total_service_charge_money/amount" => 0,
        "/order/net_amounts/total_money/amount" => 2000,
        "/order/net_amounts/tax_money/amount" => 0,
        "/order/net_amounts/discount_money/amount" => 0,
        "/order/net_amounts/tip_money/amount" => 0,
        "/order/net_amounts/service_charge_money/amount" => 0,
        "/order/tenders/0/amount_money/amount" => 1000,
        "/order/tenders/0/card_details/card/exp_month" => 2,
        "/order/tenders/0/card_details/card/exp_year" => 2022,
        "/order/tenders/1/amount_money/amount" => 1000,
        "/order/tenders/1/card_details/card/exp_month" => 2,
        "/order/tenders/1/card_details/card/exp_year" => 2022,
        "/order/version" => 4,
        "/order/total_money/amount" => 2000,
        "/order/total_tax_money/amount" => 0,
        "/order/total_discount_money/amount" => 0,
        "/order/total_tip_money/amount" => 1000000,
        "/order/total_service_charge_money/amount" => 0,
        "/order/net_amount_due_money/amount" => 1000000
      }
    )
  end
end
