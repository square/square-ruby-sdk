# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [UpdateCustomer](api-endpoint:Customers-UpdateCustomer) or
    # [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) endpoint.
    #
    # Either `errors` or `customer` is present in a given response (never both).
    class UpdateCustomerResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :customer, -> { Square::Types::Customer }, optional: true, nullable: false
    end
  end
end
