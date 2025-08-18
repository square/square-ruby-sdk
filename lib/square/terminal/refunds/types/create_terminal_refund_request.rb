
module Square
  module Terminal
    module Refunds
      module Types
        class CreateTerminalRefundRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :refund, -> { Square::Types::TerminalRefund }, optional: true, nullable: false

        end
      end
    end
  end
end
