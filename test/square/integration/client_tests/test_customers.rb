# frozen_string_literal: true

require "test_helper"

describe Square::Customers::Client do
  describe "#create and delete customer" do
    it "creates a customer" do
      _create_request = Square::Customers::Types::CreateCustomerRequest.new(
        given_name: "Amelia",
        family_name: "Earhart",
        email_address: "Amelia.Earhart@example.com",
        address: {
          address_line_1: "500 Electric Ave",
          address_line_2: "Suite 600",
          locality: "New York",
          administrative_district_level_1: "NY",
          postal_code: "10003",
          country: "US"
        },
        phone_number: "+1-212-555-4240",
        reference_id: "YOUR_REFERENCE_ID",
        note: "a customer"
      )

      puts "create customer request #{_create_request.to_h}" if verbose?

      response = client.customers.create(**_create_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::CreateCustomerResponse
      refute_nil response.customer.id
      puts "create customer response #{response.to_h}" if verbose?

      _delete_request = Square::Customers::Types::DeleteCustomersRequest.new(
        customer_id: response.customer.id,
        version: response.customer.version
      )

      puts "delete customer request #{_delete_request.to_h}" if verbose?

      response = client.customers.delete(**_delete_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::DeleteCustomerResponse
      assert_nil response.errors
      puts "delete customer response #{response.to_h}" if verbose?
    end
    it "validates hash behavior with optional fields" do
      has_version = Square::Customers::Types::DeleteCustomersRequest.new(
        customer_id: "123",
        version: 1
      ).to_h
      missing_version = Square::Customers::Types::DeleteCustomersRequest.new(
        customer_id: "123"
      ).to_h

      assert_equal has_version.keys.length, 2
      assert_equal missing_version.keys.length, 1

      has_version = has_version.except(:customer_id)
      missing_version = missing_version.except(:customer_id)

      assert_equal has_version.keys.length, 1
      assert_equal missing_version.keys.length, 0
    end
  end
end