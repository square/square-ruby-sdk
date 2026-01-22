# frozen_string_literal: true

module Square
  module Types
    # Represents a bank account. For more information about
    # linking a bank account to a Square account, see
    # [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    class BankAccount < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :account_number_suffix, -> { String }, optional: false, nullable: false
      field :country, -> { Square::Types::Country }, optional: false, nullable: false
      field :currency, -> { Square::Types::Currency }, optional: false, nullable: false
      field :account_type, -> { Square::Types::BankAccountType }, optional: false, nullable: false
      field :holder_name, -> { String }, optional: false, nullable: false
      field :primary_bank_identification_number, -> { String }, optional: false, nullable: false
      field :secondary_bank_identification_number, -> { String }, optional: true, nullable: false
      field :debit_mandate_reference_id, -> { String }, optional: true, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :status, -> { Square::Types::BankAccountStatus }, optional: false, nullable: false
      field :creditable, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :debitable, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :fingerprint, -> { String }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :bank_name, -> { String }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false
    end
  end
end
