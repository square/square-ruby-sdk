# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [CreateCustomerGroup](api-endpoint:CustomerGroups-CreateCustomerGroup) endpoint.
  # 
  # Either `errors` or `group` is present in a given response (never both).
  class CreateCustomerGroupResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :group, Square::CustomerGroup, optional: true, nullable: false

  end
end
