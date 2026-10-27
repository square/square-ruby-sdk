# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Additional details about Afterpay payments.
    class AfterpayDetails < Internal::Types::Model
      field :email_address, -> { String }, optional: true, nullable: true
    end
  end
end
