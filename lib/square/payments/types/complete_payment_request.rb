
module Square
  module Payments
    module Types
      class CompletePaymentRequest < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false
        field :version_token, -> { String }, optional: true, nullable: false

      end
    end
  end
end
