# frozen_string_literal: true

module Square
  module Types
    # Represents the Square processing fee.
    class ProcessingFee < Internal::Types::Model
      field :effective_at, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false

    end
  end
end
