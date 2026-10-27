# frozen_string_literal: true

require_relative "wiremock_test_case"

class LocationsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_locations_list_with_wiremock
    test_id = "locations.list.0"

    result = @client.locations.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "locations.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/locations/1/coordinates/latitude" => 33.7889,
        "/locations/1/coordinates/longitude" => -84.3841
      }
    )
  end

  def test_locations_create_with_wiremock
    test_id = "locations.create.0"

    result = @client.locations.create(
      location: {
        name: "Midtown",
        address: {
          address_line_1: "1234 Peachtree St. NE",
          locality: "Atlanta",
          administrative_district_level_1: "GA",
          postal_code: "30309"
        },
        description: "Midtown Atlanta store"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/location/coordinates/latitude" => 33.7889,
        "/location/coordinates/longitude" => -84.3841
      }
    )
  end

  def test_locations_get_with_wiremock
    test_id = "locations.get.0"

    result = @client.locations.get(
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/location/coordinates/latitude" => 1.1,
        "/location/coordinates/longitude" => 1.1
      }
    )
  end

  def test_locations_update_with_wiremock
    test_id = "locations.update.0"

    result = @client.locations.update(
      location_id: "location_id",
      location: {
        business_hours: {
          periods: [{
            day_of_week: "FRI",
            start_local_time: "07:00",
            end_local_time: "18:00"
          }, {
            day_of_week: "SAT",
            start_local_time: "07:00",
            end_local_time: "18:00"
          }, {
            day_of_week: "SUN",
            start_local_time: "09:00",
            end_local_time: "15:00"
          }]
        },
        description: "Midtown Atlanta store - Open weekends"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/locations/location_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/location/coordinates/latitude" => 33.7889,
        "/location/coordinates/longitude" => -84.3841
      }
    )
  end

  def test_locations_checkouts_with_wiremock
    test_id = "locations.checkouts.0"

    result = @client.locations.checkouts(
      location_id: "location_id",
      idempotency_key: "86ae1696-b1e3-4328-af6d-f1e04d947ad6",
      order: {
        order: {
          location_id: "location_id",
          reference_id: "reference_id",
          customer_id: "customer_id",
          line_items: [{
            name: "Printed T Shirt",
            quantity: "2",
            applied_taxes: [{
              tax_uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3"
            }],
            applied_discounts: [{
              discount_uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4"
            }],
            base_price_money: {
              amount: 1500,
              currency: "USD"
            }
          }, {
            name: "Slim Jeans",
            quantity: "1",
            base_price_money: {
              amount: 2500,
              currency: "USD"
            }
          }, {
            name: "Woven Sweater",
            quantity: "3",
            base_price_money: {
              amount: 3500,
              currency: "USD"
            }
          }],
          taxes: [{
            uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3",
            type: "INCLUSIVE",
            percentage: "7.75",
            scope: "LINE_ITEM"
          }],
          discounts: [{
            uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4",
            type: "FIXED_AMOUNT",
            amount_money: {
              amount: 100,
              currency: "USD"
            },
            scope: "LINE_ITEM"
          }]
        },
        idempotency_key: "12ae1696-z1e3-4328-af6d-f1e04d947gd4"
      },
      ask_for_shipping_address: true,
      merchant_support_email: "merchant+support@website.com",
      pre_populate_buyer_email: "example@email.com",
      pre_populate_shipping_address: {
        address_line_1: "1455 Market St.",
        address_line_2: "Suite 600",
        locality: "San Francisco",
        administrative_district_level_1: "CA",
        postal_code: "94103",
        country: "US",
        first_name: "Jane",
        last_name: "Doe"
      },
      redirect_url: "https://merchant.website.com/order-confirm",
      additional_recipients: [{
        location_id: "057P5VYJ4A5X1",
        description: "Application fees",
        amount_money: {
          amount: 60,
          currency: "USD"
        }
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.checkouts.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/location_id/checkouts",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/location_id/checkouts",
      expected: {
        "/order/order/line_items/0/base_price_money/amount" => 1500,
        "/order/order/line_items/1/base_price_money/amount" => 2500,
        "/order/order/line_items/2/base_price_money/amount" => 3500,
        "/order/order/discounts/0/amount_money/amount" => 100,
        "/additional_recipients/0/amount_money/amount" => 60
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/checkout/order/line_items/0/applied_taxes/0/applied_money/amount" => 103,
        "/checkout/order/line_items/0/applied_discounts/0/applied_money/amount" => 100,
        "/checkout/order/line_items/0/base_price_money/amount" => 1500,
        "/checkout/order/line_items/0/total_tax_money/amount" => 103,
        "/checkout/order/line_items/0/total_discount_money/amount" => 100,
        "/checkout/order/line_items/0/total_money/amount" => 1503,
        "/checkout/order/line_items/1/base_price_money/amount" => 2500,
        "/checkout/order/line_items/1/total_money/amount" => 2500,
        "/checkout/order/line_items/2/base_price_money/amount" => 3500,
        "/checkout/order/line_items/2/total_money/amount" => 10500,
        "/checkout/order/discounts/0/amount_money/amount" => 100,
        "/checkout/order/discounts/0/applied_money/amount" => 100,
        "/checkout/order/version" => 1,
        "/checkout/order/total_money/amount" => 14503,
        "/checkout/order/total_tax_money/amount" => 103,
        "/checkout/order/total_discount_money/amount" => 100,
        "/checkout/additional_recipients/0/amount_money/amount" => 60
      }
    )
  end
end
