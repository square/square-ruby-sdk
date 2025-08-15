# frozen_string_literal: true

module Square
  # Additional details about Clearpay payments.
  class ClearpayDetails < Internal::Types::Model
    field :email_address, String, optional: true, nullable: false

  end
end
