# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Additional details about `WALLET` type payments. Contains only non-confidential information.
    class DigitalWalletDetails < Internal::Types::Model
      field :status, -> { String }, optional: true, nullable: true

      field :brand, -> { String }, optional: true, nullable: true

      field :cash_app_details, -> { Square::Types::CashAppDetails }, optional: true, nullable: false

      field :lightning_details, -> { Square::Types::LightningDetails }, optional: true, nullable: false

      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
