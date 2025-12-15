# frozen_string_literal: true

module Square
  module Types
    # Options to control how to override the default behavior of the specified modifier.
    class CatalogModifierOverride < Internal::Types::Model
      field :modifier_id, -> { String }, optional: false, nullable: false
      field :on_by_default, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :hidden_online_override, -> { Object }, optional: true, nullable: false
      field :on_by_default_override, -> { Object }, optional: true, nullable: false
    end
  end
end
