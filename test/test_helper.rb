# frozen_string_literal: true

require "minitest/autorun"
require "minitest/rg"
require_relative "../lib/square"
require 'webmock/minitest'

def test_token
  @test_token ||= ENV.fetch("SQUARE_TOKEN", nil) || ENV.fetch("TEST_SQUARE_TOKEN", nil) || ENV.fetch("SQUARE_SANDBOX_TOKEN", nil) || "test_token"
end

def client
  @client ||= Square::Client.new(
    token: test_token,
    base_url: Square::Environment::SANDBOX
  )
end

def verbose_mode?
  @verbose_mode ||= ENV.fetch("VERBOSE", "false") == "true"
end

def minitest_verbose?
  return false unless defined?(Minitest)
  
  # Check TESTOPTS environment variable for --verbose flag
  ENV['TESTOPTS']&.include?('--verbose') || ARGV.include?('--verbose')
end

def verbose?
  verbose_mode? || minitest_verbose?
end

def new_test_uuid
  SecureRandom.uuid
end

def new_test_square_temp_id
  "##{SecureRandom.uuid}"
end

def new_test_money(amount)
  Square::Types::Money.new(
    amount: amount,
    currency: 'USD'
  )
end

def get_test_file
  file_path = File.join(__dir__, 'testdata', 'image.jpeg')
  File.open(file_path, 'rb')
end

def get_default_location_id(client)
  response = client.locations.list
  response.locations.first.id
end

def create_location(client)
  response = client.locations.create(
    location: {
      name: "Test Location #{new_test_uuid}"
    }
  )
  response.location.id
end

def create_test_catalog_item(opts = {})
  variation = Square::Types::CatalogObject.new(
    type: 'ITEM_VARIATION',
    id: "##{new_test_uuid}",
    present_at_all_locations: true,
    item_variation_data: {
      name: opts[:variation_name] || "Variation #{new_test_uuid}",
      track_inventory: true,
      pricing_type: 'FIXED_PRICING',
      price_money: {
        amount: opts[:price] || 1000,
        currency: opts[:currency] || 'USD'
      }
    }
  )

  Square::Types::CatalogObject.new(
    type: 'ITEM',
    id: "##{new_test_uuid}",
    present_at_all_locations: true,
    item_data: {
      name: opts[:name] || "Item #{new_test_uuid}",
      description: opts[:description] || 'Test item description',
      abbreviation: opts[:abbreviation] || 'TST',
      variations: [variation]
    }
  )
end

def test_address
  Square::Types::Address.new(
    address_line_1: '500 Electric Ave',
    address_line_2: 'Suite 600',
    locality: 'New York',
    administrative_district_level_1: 'NY',
    postal_code: '10003',
    country: 'US'
  )
end

def create_test_customer_request
  Square::Types::CustomerRequest.new(
    idempotency_key: new_test_uuid,
    given_name: 'Amelia',
    family_name: 'Earhart',
    phone_number: '1-212-555-4240',
    note: 'test customer',
    address: test_address
  )
end

def create_test_customer(client)
  response = client.customers.create(create_test_customer_request)
  response.customer.id
end


