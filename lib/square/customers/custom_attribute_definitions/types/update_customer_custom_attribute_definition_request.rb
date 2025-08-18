
module Square
  module Customers
    module CustomAttributeDefinitions
      module Types
        class UpdateCustomerCustomAttributeDefinitionRequest < Internal::Types::Model
          field :key, -> { String }, optional: false, nullable: false
          field :custom_attribute_definition, -> { Square::Types::CustomAttributeDefinition }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
