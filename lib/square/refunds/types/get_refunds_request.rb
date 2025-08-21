# frozen_string_literal: true

module Square
  module Refunds
    module Types
      class GetRefundsRequest < Internal::Types::Model
        field :refund_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
