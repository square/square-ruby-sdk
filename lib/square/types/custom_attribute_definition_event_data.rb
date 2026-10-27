# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents an object in the CustomAttributeDefinition event notification
    # payload that contains the affected custom attribute definition.
    class CustomAttributeDefinitionEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::CustomAttributeDefinitionEventDataObject }, optional: true, nullable: false
    end
  end
end
