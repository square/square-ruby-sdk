# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectTax < CatalogObjectBase
      field :tax_data, -> { Square::Types::CatalogTax }, optional: true, nullable: false
    end
  end
end
