# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A named selection for this `SELECTION`-type custom attribute definition.
    class CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
