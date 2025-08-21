# frozen_string_literal: true

module Square
  module Types
    class TipSettings < Internal::Types::Model
      field :allow_tipping, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :separate_tip_screen, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :custom_tip_field, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tip_percentages, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false
      field :smart_tipping, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
