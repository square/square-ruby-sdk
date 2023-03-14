# frozen_string_literal: true

require_relative '../test/api/api_test_base'
require 'json'

describe "UserJourney" do
  let(:access_token) { ENV.fetch('SQUARE_SANDBOX_TOKEN', 'AccessToken')}
  let(:environment) { "sandbox" }

  let(:phone_number) { "1-212-555-4240" }
  let(:phone_number2) { "1-917-500-1000" }
  let(:postal_code) { "10003" }
  let(:postal_code2) { "98100" }

  let :customer do
    {
      "given_name": "Amelia",
      "family_name": "Earhart",
      "phone_number": phone_number,
      "note": "a customer",
      "address": {
        "address_line_1": "500 Electric Ave",
        "address_line_2": "Suite 600",
        "locality": "New York",
        "administrative_district_level_1": "NY",
        "postal_code": postal_code,
        "country": "US"
      }
    }
  end

  let :sq do
    Square::Client.new(access_token: access_token, environment: environment)
  end

  let :unauthoerized_sq do
    Square::Client.new(access_token: "bad_token")
  end

  let :customer2 do
    tmp_customer = customer.clone
    tmp_customer[:phone_number] = phone_number2
    tmp_customer[:address][:postal_code] = postal_code2
    tmp_customer
  end

  describe 'Response Object Verification' do
    it "should contain following fields" do
      response = sq.locations.list_locations
      assert_equal response.status_code, 200
      assert_includes response.body.to_h.keys, :locations
      assert_equal response.data.to_h.keys, %i[locations]
      assert_nil response.errors
      assert_nil response.cursor
    end
  end

  describe 'ListLocations' do
    it 'should return success 200' do
      assert_equal sq.locations.list_locations.status_code, 200
    end
  end

  describe 'API Call Error' do
    it 'should return error' do
      response = unauthoerized_sq.locations.list_locations
      assert_equal response.status_code, 401
      assert_instance_of Array, response.errors
      refute_nil response.errors
    end
  end

  # There is no sandbox support for V1 endpoints as production token is required for the following tests
  # describe 'V1 Category' do
  #   it 'should succeed for each endpoint call' do
  #     location_id = "your_location_id"
  #     access_token = "your_production_access_token"
  #     name1 = "fruit"
  #     name2 = "drink"
  #     api = Square::Client.new(access_token: access_token).v1_items
  #
  #     # create
  #     response = api.create_category(location_id: location_id, body: {name: name1})
  #     assert_equal response.data.name, name1
  #     assert_nil response.errors
  #     assert_equal response.status_code, 200
  #
  #     created_id = response.data.id
  #
  #     # list
  #     response = api.list_categories(location_id: location_id)
  #     assert_instance_of Array, response.data
  #     assert_equal response.status_code, 200
  #
  #     # update
  #     response = api.update_category(location_id: location_id, category_id: created_id, body: {name: name2})
  #     assert_equal response.data.name, name2
  #     assert_equal response.status_code, 200
  #
  #     # delete
  #     response = api.delete_category(location_id: location_id, category_id: created_id)
  #     assert_nil response.data
  #     assert_equal response.status_code, 200
  #   end
  # end

  describe 'V2 Customers' do
    it 'should succeed for each endpoint call' do
      # create
      response = sq.customers.create_customer(body: customer)
      assert_equal response.data.customer[:phone_number], phone_number

      assert_equal response.status_code, 200
      created_customer = response.data.customer

      # retrieve
      response = sq.customers.retrieve_customer(customer_id: created_customer[:id])
      assert_equal response.data.customer[:phone_number], phone_number
      assert_equal response.data.customer[:address][:postal_code], postal_code
      assert_equal response.status_code, 200

      # list
      response = sq.customers.list_customers
      assert_equal response.data.to_h.keys, %i[customers]
      assert_equal response.status_code, 200

      # update
      response = sq.customers.update_customer(customer_id: created_customer[:id], body: customer2)
      assert_equal response.data.customer[:phone_number], phone_number2
      assert_equal response.data.customer[:address][:postal_code], postal_code2
      assert_equal response.status_code, 200

      # retrieve
      response = sq.customers.retrieve_customer(customer_id: created_customer[:id])
      assert_equal response.data.customer[:phone_number], phone_number2
      assert_equal response.data.customer[:address][:postal_code], postal_code2
      assert_equal response.status_code, 200

      # delete
      response = sq.customers.delete_customer(customer_id: created_customer[:id])
      assert_equal response.data.to_h, {}
      assert_equal response.status_code, 200
    end
  end
end
