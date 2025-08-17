# frozen_string_literal: true

module Square
  module Types
    # Additional details about `WALLET` type payments. Contains only non-confidential information.
    class DigitalWalletDetails < Internal::Types::Model
      field :status, String, optional: true, nullable: false
      field :brand, String, optional: true, nullable: false
      field :cash_app_details, Square::Types::CashAppDetails, optional: true, nullable: false

    end
  end
end
