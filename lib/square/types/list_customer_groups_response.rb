# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [ListCustomerGroups](api-endpoint:CustomerGroups-ListCustomerGroups) endpoint.
        # 
        # Either `errors` or `groups` is present in a given response (never both).
        class ListCustomerGroupsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :groups, Square::Internal::Types::Array[Square::CustomerGroup], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
