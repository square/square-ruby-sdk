# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Additional details about BANK_ACCOUNT type payments.
    class BankAccountPaymentDetails < Internal::Types::Model
      field :bank_name, -> { String }, optional: true, nullable: true

      field :transfer_type, -> { String }, optional: true, nullable: true

      field :account_ownership_type, -> { String }, optional: true, nullable: true

      field :fingerprint, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: true, nullable: true

      field :statement_description, -> { String }, optional: true, nullable: true

      field :ach_details, -> { Square::Types::AchDetails }, optional: true, nullable: false

      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: true
    end
  end
end
