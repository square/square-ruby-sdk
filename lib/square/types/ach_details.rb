# frozen_string_literal: true

module Square
  module Types
    # ACH-specific details about `BANK_ACCOUNT` type payments with the `transfer_type` of `ACH`.
    class AchDetails < Internal::Types::Model
      field :routing_number, -> { String }, optional: true, nullable: false
      field :account_number_suffix, -> { String }, optional: true, nullable: false
      field :account_type, -> { String }, optional: true, nullable: false
    end
  end
end
