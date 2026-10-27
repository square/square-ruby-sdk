# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Details for Felica payments.
    class FelicaDetails < Internal::Types::Model
      field :terminal_id, -> { String }, optional: true, nullable: true

      field :felica_masked_card_number, -> { String }, optional: true, nullable: true

      field :felica_brand, -> { Square::Types::FelicaDetailsFelicaBrand }, optional: true, nullable: false
    end
  end
end
