# frozen_string_literal: true

module Square
  # Represents an object in the CustomAttributeDefinition event notification
  # payload that contains the affected custom attribute definition.
  class CustomAttributeDefinitionEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::CustomAttributeDefinitionEventDataObject, optional: true, nullable: false

  end
end
