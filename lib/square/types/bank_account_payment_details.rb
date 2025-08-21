# frozen_string_literal: true

module Square
  module Types
    # Additional details about BANK_ACCOUNT type payments.
    class BankAccountPaymentDetails < Internal::Types::Model
      field :bank_name, -> { String }, optional: true, nullable: false
      field :transfer_type, -> { String }, optional: true, nullable: false
      field :account_ownership_type, -> { String }, optional: true, nullable: false
      field :fingerprint, -> { String }, optional: true, nullable: false
      field :country, -> { String }, optional: true, nullable: false
      field :statement_description, -> { String }, optional: true, nullable: false
      field :ach_details, -> { Square::Types::AchDetails }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
