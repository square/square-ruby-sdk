# frozen_string_literal: true

module Square
  module Types
    # Describes receipt action fields.
    class ReceiptOptions < Internal::Types::Model
      field :payment_id, String, optional: false, nullable: false
      field :print_only, Internal::Types::Boolean, optional: true, nullable: false
      field :is_duplicate, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
