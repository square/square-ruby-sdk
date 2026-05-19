# frozen_string_literal: true

module Square
  module Types
    # Details specific to electronic money payments.
    class ElectronicMoneyDetails < Internal::Types::Model
      field :felica_details, -> { Square::Types::FelicaDetails }, optional: true, nullable: false
    end
  end
end
