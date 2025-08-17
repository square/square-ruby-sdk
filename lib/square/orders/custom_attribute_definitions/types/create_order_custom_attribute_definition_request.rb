
module Square
  module Orders
    module CustomAttributeDefinitions
      module Types
        class CreateOrderCustomAttributeDefinitionRequest < Internal::Types::Model
          field :custom_attribute_definition, Square::Types::CustomAttributeDefinition, optional: false, nullable: false
          field :idempotency_key, String, optional: true, nullable: false

        end
      end
    end
  end
end
