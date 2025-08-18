# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [RetrieveCustomerGroup](api-endpoint:CustomerGroups-RetrieveCustomerGroup) endpoint.
    # 
    # Either `errors` or `group` is present in a given response (never both).
    class GetCustomerGroupResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :group, Square::Types::CustomerGroup, optional: true, nullable: false

    end
  end
end
