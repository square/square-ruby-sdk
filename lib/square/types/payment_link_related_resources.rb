# frozen_string_literal: true

module Square
    module Types
        class PaymentLinkRelatedResources < Square::Internal::Types::Model
            field :orders, Square::Internal::Types::Array[Square::Order], optional: true, nullable: false
            field :subscription_plans, Square::Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
        end
    end
end
