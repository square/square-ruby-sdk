# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectModifierList < CatalogObjectBase
      field :modifier_list_data, -> { Square::Types::CatalogModifierList }, optional: true, nullable: false
    end
  end
end
