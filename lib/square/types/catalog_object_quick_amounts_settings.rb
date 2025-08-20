# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectQuickAmountsSettings < Internal::Types::Model
      field :quick_amounts_settings_data, lambda {
        Square::Types::CatalogQuickAmountsSettings
      }, optional: true, nullable: false
    end
  end
end
