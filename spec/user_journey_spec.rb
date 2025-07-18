# frozen_string_literal: true

require_relative '../test/api/api_test_base'
require 'json'

describe "UserJourney" do
  let(:bearer_auth_credentials) { 
    token = ENV.fetch('SQUARE_SANDBOX_TOKEN', 'AccessToken')
    puts "UserJourney using token: #{token[0..5]}..."
    Square::BearerAuthCredentials.new(access_token: token)
  }
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
    client = Square::Client.new(bearer_auth_credentials: bearer_auth_credentials, environment: environment)
    puts "Created Square client with environment: #{environment}"
    client
  end

  let :unauthoerized_sq do
    Square::Client.new(
      bearer_auth_credentials: Square::BearerAuthCredentials.new(access_token: "bad_token"),
      environment: environment
    )
  end

  let :customer2 do
    tmp_customer = customer.clone
    tmp_customer[:phone_number] = phone_number2
    tmp_customer[:address][:postal_code] = postal_code2
    tmp_customer
  end

  def log_response(response, context)
    puts "\nResponse for #{context}:"
    puts "Status: #{response.status_code}"
    puts "Errors: #{response.errors.inspect}" if response.errors
    if response.data && response.data.respond_to?(:customer)
      puts "Customer data present: #{!response.data.customer.nil?}"
    end
  end

  describe 'Response Object Verification' do
    it "should contain following fields" do
      response = sq.locations.list_locations
      log_response(response, 'list_locations verification')
      assert_equal 200, response.status_code
      assert_includes response.body.to_h.keys, :locations
      assert_equal response.data.to_h.keys, %i[locations]
      assert_nil response.errors
      assert_nil response.cursor
    end
  end

  describe 'ListLocations' do
    it 'should return success 200' do
      response = sq.locations.list_locations
      log_response(response, 'list_locations')
      assert_equal 200, response.status_code
    end
  end

  describe 'API Call Error' do
    it 'should return error' do
      response = unauthoerized_sq.locations.list_locations
      log_response(response, 'unauthorized list_locations')
      assert_equal 401, response.status_code
      assert_instance_of Array, response.errors
      refute_nil response.errors
    end
  end

  describe 'V2 Customers' do
    it 'should succeed for each endpoint call' do
      # create
      response = sq.customers.create_customer(body: customer)
      log_response(response, 'create_customer')
      assert_equal 200, response.status_code
      refute_nil response.data, "Response data should not be nil"
      refute_nil response.data.customer, "Customer in response should not be nil"
      assert_equal phone_number, response.data.customer[:phone_number]

      created_customer = response.data.customer

      # retrieve
      response = sq.customers.retrieve_customer(customer_id: created_customer[:id])
      log_response(response, 'retrieve_customer')
      assert_equal phone_number, response.data.customer[:phone_number]
      assert_equal postal_code, response.data.customer[:address][:postal_code]
      assert_equal 200, response.status_code

      # list
      response = sq.customers.list_customers
      log_response(response, 'list_customers')
      assert_equal %i[customers], response.data.to_h.keys
      assert_equal 200, response.status_code

      # update
      response = sq.customers.update_customer(customer_id: created_customer[:id], body: customer2)
      log_response(response, 'update_customer')
      assert_equal phone_number2, response.data.customer[:phone_number]
      assert_equal postal_code2, response.data.customer[:address][:postal_code]
      assert_equal 200, response.status_code

      # retrieve
      response = sq.customers.retrieve_customer(customer_id: created_customer[:id])
      log_response(response, 'retrieve_customer_after_update')
      assert_equal phone_number2, response.data.customer[:phone_number]
      assert_equal postal_code2, response.data.customer[:address][:postal_code]
      assert_equal 200, response.status_code

      # delete
      response = sq.customers.delete_customer(customer_id: created_customer[:id])
      log_response(response, 'delete_customer')
      assert_equal({}, response.data.to_h)
      assert_equal 200, response.status_code
    end
  end
end