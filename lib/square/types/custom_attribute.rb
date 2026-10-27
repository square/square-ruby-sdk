# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A custom attribute value. Each custom attribute value has a corresponding
    # `CustomAttributeDefinition` object.
    class CustomAttribute < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: true

      field :value, -> { Object }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :visibility, -> { Square::Types::CustomAttributeDefinitionVisibility }, optional: true, nullable: false

      field :definition, -> { Square::Types::CustomAttributeDefinition }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
