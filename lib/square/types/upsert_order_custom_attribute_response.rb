# frozen_string_literal: true

module Square
  module Types
    # Represents a response from upserting order custom attribute definitions.
    class UpsertOrderCustomAttributeResponse < Internal::Types::Model
      field :custom_attribute, -> { Square::Types::CustomAttribute }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
