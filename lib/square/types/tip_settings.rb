# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TipSettings < Internal::Types::Model
      field :allow_tipping, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :separate_tip_screen, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :custom_tip_field, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :tip_percentages, -> { Internal::Types::Array[Integer] }, optional: true, nullable: true

      field :smart_tipping, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
