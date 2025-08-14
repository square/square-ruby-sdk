# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [UpdateCustomerGroup](api-endpoint:CustomerGroups-UpdateCustomerGroup) endpoint.
        # 
        # Either `errors` or `group` is present in a given response (never both).
        class UpdateCustomerGroupResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :group, Square::CustomerGroup, optional: true, nullable: false
        end
    end
end
