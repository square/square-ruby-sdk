# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [ListCustomerGroups](api-endpoint:CustomerGroups-ListCustomerGroups) endpoint.
  # 
  # Either `errors` or `groups` is present in a given response (never both).
  class ListCustomerGroupsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :groups, Internal::Types::Array[Square::CustomerGroup], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
