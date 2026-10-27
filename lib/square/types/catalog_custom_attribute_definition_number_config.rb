# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CatalogCustomAttributeDefinitionNumberConfig < Internal::Types::Model
      field :precision, -> { Integer }, optional: true, nullable: true
    end
  end
end
