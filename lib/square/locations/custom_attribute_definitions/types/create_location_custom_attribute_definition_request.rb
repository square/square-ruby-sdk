# frozen_string_literal: true

module Square
  module Locations
    module CustomAttributeDefinitions
      module Types
        class CreateLocationCustomAttributeDefinitionRequest < Internal::Types::Model
          field :custom_attribute_definition, lambda {
            Square::Types::CustomAttributeDefinition
          }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
