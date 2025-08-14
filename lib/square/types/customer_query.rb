# frozen_string_literal: true

module Square
    module Types
        # Represents filtering and sorting criteria for a [SearchCustomers](api-endpoint:Customers-SearchCustomers) request.
        class CustomerQuery < Internal::Types::Model
            field :filter, Square::CustomerFilter, optional: true, nullable: false
            field :sort, Square::CustomerSort, optional: true, nullable: false
        end
    end
end
