![Square logo]

# Square Ruby SDK

[![Travis status](https://travis-ci.org/square/square-ruby-sdk.svg?branch=master)](https://travis-ci.org/square/square-ruby-sdk)
[![Gem version](https://badge.fury.io/rb/square.rb.svg?new)](https://badge.fury.io/rb/square.rb)
[![Apache-2 license](https://img.shields.io/badge/license-Apache2-brightgreen.svg)](https://www.apache.org/licenses/LICENSE-2.0)

Use this gem to integrate Square payments into your app and grow your business with Square APIs including Catalog, Customers, Employees, Inventory, Labor, Locations, and Orders.

## Installation

Install the gem from the command line:

```ruby
gem install square.rb
```

Or add the gem to your Gemfile and `bundle`:

```ruby
gem 'square.rb'
```

### API Client
* [Client]

## API documentation

### Payments
* [Payments]
* [Refunds]
* [Disputes]
* [Checkout]
* [Apple Pay]
* [Terminal]

### Orders
* [Orders]

### Items
* [Catalog]
* [Inventory]

### Customers
* [Customers]
* [Customer Groups]
* [Customer Segments]

### Loyalty
* [Loyalty]

### Business
* [Merchants]
* [Locations]
* [Devices]

### Team
* [Team]
* [Employees]
* [Labor]
* [Cash Drawers]

### Financials
* [Bank Accounts]

### Authorization APIs
* [Mobile Authorization]
* [O Auth]

### Deprecated APIs
* [V1 Locations]
* [V1 Employees]
* [V1 Transactions]
* [V1 Items]
* [Transactions]
* [Reporting]

## Usage

First time using Square? Here’s how to get started:

1. **Create a Square account.** If you don’t have one already, [sign up for a developer account].
1. **Create an application.** Go to your [Developer Dashboard] and create your first application. All you need to do is give it a name. When you’re doing this for your production application, enter the name as you would want a customer to see it.
1. **Make your first API call.** Almost all Square API calls require a location ID. You’ll make your first call to #list_locations, which happens to be one of the API calls that don’t require a location ID. For more information about locations, see the [Locations] API documentation.

Now let’s call your first Square API. Open your favorite text editor, create a new file called `locations.rb`, and copy the following code into that file:

```ruby
require 'square'
 
# Create an instance of the API Client and initialize it with the credentials 
# for the Square account whose assets you want to manage.

client = Square::Client.new(
    access_token: 'YOUR SANDBOX ACCESS TOKEN HERE',
    environment: 'sandbox'
)

# Call list_locations method to get all locations in this Square account
result = client.locations.list_locations

# Call the #success? method to see if the call succeeded
if result.success?
	# The #data Struct contains a list of locations
  locations = result.data.locations

	# Iterate over the list
  locations.each do |location|
    # Each location is represented as a Hash
    location.each do |key, value|
      puts "#{key}: #{value}"
    end
  end
else
  # Handle the case that the result is an error.
  warn 'Error calling LocationsApi.listlocations ...'

  # The #errors method returns an Array of error Hashes
  result.errors.each do |key, value|
    warn "#{key}: #{value}"
  end
end
```

Next, get an access token and reference it in your code. Go back to your application in the Developer Dashboard, in the Sandbox section click Show in the Sandbox Access Token box, copy that access token, and replace `'YOUR SANDBOX ACCESS TOKEN HERE'` with that token.

**Important** When you eventually switch from trying things out on sandbox to actually working with your real production resources, you should not embed the access token in your code. Make sure you store and access your production access tokens securely.

Now save `locations.rb` and run it:

```sh
ruby locations.rb
```

If your call is successful, you’ll get a response that looks like this:

```
address : {'address_line_1': '1455 Market Street', 'administrative_district_level_1': 'CA', 'country': 'US', 'locality': 'San Francisco', 'postal_code': '94103'}
# ...
```

Yay! You successfully made your first call. If you didn’t, you would see an error message that looks something like this:

```
Error calling LocationsApi.listlocations
category : AUTHENTICATION_ERROR
code : UNAUTHORIZED
detail : This request could not be authorized.
```

This error was returned when an invalid token was used to call the API.

After you’ve tried out the Square APIs and tested your application using sandbox, you will want to switch to your production credentials so that you can manage real Square resources. Don't forget to switch your access token from sandbox to production for real data.

## SDK patterns
If you know a few patterns, you’ll be able to call any API in the SDK. Here are some important ones:

### Get an access token

To use the Square API to manage the resources (such as payments, orders, customers, etc.) of a Square account, you need to create an application (or use an existing one) in the Developer Dashboard and get an access token.

When you call a Square API, you call it using an access key. An access key has specific permissions to resources in a specific Square account that can be accessed by a specific application in a specific developer account.
Use an access token that is appropriate for your use case. There are two options:

- To manage the resources for your own Square account, use the Personal Access Token for the application created in your Square account.
- To manage resources for other Square accounts, use OAuth to ask owners of the accounts you want to manage so that you can work on their behalf. When you implement OAuth, you ask the Square account holder for permission to manage resources in their account (you can define the specific resources to access) and get an OAuth access token and refresh token for their account.

**Important** For both use cases, make sure you store and access the tokens securely.

### Import and Instantiate the Client Class

To use the Square API, you import the Client class, instantiate a Client object, and initialize it with the appropriate access token. Here’s how:

- Instantiate a `Square::Client` object with the access token for the Square account whose resources you want to manage. To access sandbox resources, initialize the `Square::Client` with environment set to sandbox:

```ruby
client = Square::Client.new(
    access_token: 'SANDBOX ACCESS TOKEN HERE',
    environment: 'sandbox'
)
```

- To access production resources, set environment to production:

```ruby
client = Square::Client.new(
    access_token: 'ACCESS TOKEN HERE',
    environment: 'production'
)
```
 
### Get an Instance of an API object and call its methods

Each API is implemented as a class. The Client object instantiates every API class and exposes them as properties so you can easily start using any Square API. You work with an API by calling methods on an instance of an API class. Here’s how:

- Work with an API by calling the methods on the API object. For example, you would call list_customers to get a list of all customers in the Square account:

```ruby
result = client.customers.list_customers
```

See the SDK documentation for the list of methods for each API class.

Pass complex parameters (such as create, update, search, etc.) as a Hash. For example, you would pass a Hash containing the values used to create a new customer using create_customer:

```ruby
# Create a unique key for this creation operation so you don't accidentally
# create the customer multiple times if you need to retry this operation.
require 'securerandom'

idempotency_key = SecureRandom.uuid

# To create a customer, you'll need to specify at least a few required fields.
request_body = {idempotency_key: idempotency_key, given_name: 'Amelia', family_name: 'Earhardt'}

# Call create_customer method to create a new customer in this Square account
result = client.customers.create_customer(request_body)
```

If your call succeeds, you’ll see a response that looks like this:
```
{'customer': {'created_at': '2019-06-28T21:23:05.126Z', 'creation_source': 'THIRD_PARTY', 'family_name': 'Earhardt', 'given_name': 'Amelia', 'id': 'CBASEDwl3El91nohQ2FLEk4aBfcgAQ', 'preferences': {'email_unsubscribed': False}, 'updated_at': '2019-06-28T21:23:05.126Z'}}
```

- Use idempotency for create, update, or other calls that you want to avoid calling twice. To make an idempotent API call, you add the idempotency_key with a unique value in the Hash for the API call’s request.
- Specify a location ID for APIs such as Transactions, Orders, and Checkout that deal with payments. When a payment or order is created in Square, it is always associated with a location.

### Handle the response

API calls return a response object that contains properties that describe both the request (headers and request) and the response (status_code, reason_phrase, text, errors, body, and cursor). The response also has #success? and #error? helper methods so you can easily determine the success or failure of a call:

```ruby
if result.success?
  p result.data
elsif result.error?
  warn result.errors.inspect
end
```

- Read the response payload. The response payload is returned as a Struct from the #data method. For retrieve calls, a Struct containing a single item is returned with a key name that is the name of the object (for example, customer). For list calls, a Struct containing a Array of objects is returned with a key name that is the plural of the object name (for example, customers).
- Make sure you get all items returned in a list call by checking the cursor value returned in the API response. When you call a list API the first time, set the cursor to an empty String or omit it from the API request. If the API response contains a cursor with a value, you call the API again to get the next page of items and continue to call that API again until the cursor is an empty String.

## Tests

First, clone the gem locally and `cd` into the directory.

```sh
git clone https://github.com/square/square-ruby-sdk.git
cd square-ruby-sdk
```

Next, make sure Bundler is installed and install the development dependencies.

```sh
gem install bundler
bundle
```

Before running the tests, find a sandbox token in your [Developer Dashboard] and set a `SQUARE_SANDBOX_TOKEN` environment variable.

```sh
export SQUARE_SANDBOX_TOKEN="YOUR SANDBOX TOKEN HERE"
```

And run the tests.

```sh
rake
```

## Learn more

The Square Platform is built on the [Square API]. Square has a number of other SDKs that enable you to securely handle credit card information on both mobile and web so that you can process payments via the Square API. 

You can also use the Square API to create applications or services that work with payments, orders, inventory, etc. that have been created and managed in Square’s in-person hardware products (Square Point of Sale and Square Register).

[Square Logo]: https://docs.connect.squareup.com/images/github/github-square-logo.svg
[Developer Dashboard]: https://developer.squareup.com/apps
[Square API]: https://squareup.com/developers
[sign up for a developer account]: https://squareup.com/signup?v=developers
[Client]: doc/client.md
[Devices]: doc/devices.md
[Disputes]: doc/disputes.md
[Terminal]: doc/terminal.md
[Team]: doc/team.md
[Cash Drawers]: doc/cash-drawers.md
[Customer Groups]: doc/customer-groups.md
[Customer Segments]: doc/customer-segments.md
[Bank Accounts]: doc/bank-accounts
[Payments]: doc/payments.md
[Checkout]: doc/checkout.md
[Catalog]: doc/catalog.md
[Customers]: doc/customers.md
[Employees]: doc/employees.md
[Inventory]: doc/inventory.md
[Labor]: doc/labor.md
[Loyalty]: doc/loyalty.md
[Locations]: doc/locations.md
[Merchants]: doc/merchants.md
[Orders]: doc/orders.md
[Apple Pay]: doc/apple-pay.md
[Refunds]: doc/refunds.md
[Reporting]: doc/reporting.md
[Mobile Authorization]: doc/mobile-authorization.md
[O Auth]: doc/o-auth.md
[V1 Locations]: doc/v1-locations.md
[V1 Employees]: doc/v1-employees.md
[V1 Transactions]: doc/v1-transactions.md
[V1 Items]: doc/v1-items.md
[Transactions]: doc/transactions.md