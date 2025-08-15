# frozen_string_literal: true

module Square
  class ConfirmationDecision < Internal::Types::Model
    field :has_agreed, Internal::Types::Boolean, optional: true, nullable: false

  end
end
