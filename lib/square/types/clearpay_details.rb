# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Additional details about Clearpay payments.
    class ClearpayDetails < Internal::Types::Model
      field :email_address, -> { String }, optional: true, nullable: true
    end
  end
end
