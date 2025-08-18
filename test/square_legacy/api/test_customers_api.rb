

require_relative 'api_test_base'

class CustomersApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.customers
    @response_catcher = @controller.http_call_back
  end

  # Creates a new customer for a business, which can have associated cards on file.
  #
  #You must provide __at least one__ of the following values in your request to this
  #endpoint:
  #
  #- `given_name`
  #- `family_name`
  #- `company_name`
  #- `email_address`
  #- `phone_number`
  #
  #This endpoint does not accept an idempotency key. If you accidentally create
  #a duplicate customer, you can delete it with the
  #[DeleteCustomer](#endpoint-deletecustomer) endpoint.
  def test_create_customer()
    # Parameters for the API call
    body = APIHelper.json_deserialize(
      '{"given_name":"Amelia","family_name":"Earhart","email_address":"Amelia.Ear'\
      'hart@example.com","address":{"address_line_1":"500 Electric Ave","address_l'\
      'ine_2":"Suite 600","locality":"New York"},"phone_number":"1-212-555-4240","'\
      'reference_id":"YOUR_REFERENCE_ID","note":"a customer"}'
      )

    # Perform the API call through the SDK function
    result = @controller.create_customer(body: body)

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)
  end

end
