# frozen_string_literal: true

module Square
  # Details specific to offline payments.
  class OfflinePaymentDetails < Internal::Types::Model
    field :client_created_at, String, optional: true, nullable: false

  end
end
