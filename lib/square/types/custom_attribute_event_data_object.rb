# frozen_string_literal: true

module Square
  module Types
    class CustomAttributeEventDataObject < Internal::Types::Model
      field :custom_attribute, -> { Square::Types::CustomAttribute }, optional: true, nullable: false

    end
  end
end
