# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
    class CatalogQuickAmountsSettings < Internal::Types::Model
      field :option, -> { Square::Types::CatalogQuickAmountsSettingsOption }, optional: false, nullable: false

      field :eligible_for_auto_amounts, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :amounts, -> { Internal::Types::Array[Square::Types::CatalogQuickAmount] }, optional: true, nullable: true
    end
  end
end
