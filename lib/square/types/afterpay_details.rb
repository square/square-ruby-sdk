# frozen_string_literal: true

module Square
  module Types
    # Additional details about Afterpay payments.
    class AfterpayDetails < Internal::Types::Model
      field :email_address, -> { String }, optional: true, nullable: false
    end
  end
end
