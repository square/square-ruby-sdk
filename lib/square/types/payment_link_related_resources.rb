# frozen_string_literal: true

module Square
    module Types
        class PaymentLinkRelatedResources < Internal::Types::Model
            field :orders, Internal::Types::Array[Square::Order], optional: true, nullable: false
            field :subscription_plans, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
        end
    end
end
