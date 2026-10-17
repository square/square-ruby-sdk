# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectQuickAmountsSettings < CatalogObjectBase
      field :quick_amounts_settings_data, -> { Square::Types::CatalogQuickAmountsSettings }, optional: true, nullable: false
    end
  end
end
