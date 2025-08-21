# frozen_string_literal: true

module Square
  module Terminal
    module Refunds
      module Types
        class CancelRefundsRequest < Internal::Types::Model
          field :terminal_refund_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
