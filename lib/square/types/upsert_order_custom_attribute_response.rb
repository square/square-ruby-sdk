# frozen_string_literal: true

module Square
  # Represents a response from upserting order custom attribute definitions.
  class UpsertOrderCustomAttributeResponse < Internal::Types::Model
    field :custom_attribute, Square::CustomAttribute, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
