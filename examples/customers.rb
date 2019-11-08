require 'square'

# Initialize Square Client
square = Square::Client.new(
  access_token: 'ACCESS_TOKEN'
)

customers_api = square.customers

# Create Customer
customer = {
  "given_name": "John",
  "family_name": "Smith",
  "address": {
    "address_line_1": "500 Electric Ave",
    "address_line_2": "Suite 600",
    "locality": "New York",
    "administrative_district_level_1": "NY",
    "postal_code": "98100",
    "country": "US"
  }
}

result = customers_api.create_customer(body: customer)
if result.success?
  puts "create_customer:\n #{result.data}"
  puts "body: #{result.body}"
  puts "body.to_h: #{result.body.to_h}"
  puts "status_code: #{result.status_code}"
  puts "data.to_h: #{result.data.to_h}"
  puts "\n\n"
elsif result.error?
  warn result.errors
end

created_customer_id = result.data.customer[:id]

# List Customers
result = customers_api.list_customers
puts "list_customers:\n #{result.data.customers.count} customer(s)\n\n"

# Update Customer
result = customers_api.update_customer(customer_id: created_customer_id, body: { "family_name": "Jackson" })
puts "update_customer:\n #{result.data}\n\n"

# Delete Customer
result = customers_api.delete_customer(customer_id: created_customer_id)
puts "delete_customer:\n #{result.data}\n\n"
