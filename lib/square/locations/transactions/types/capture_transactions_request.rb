
module Square
  module Locations
    module Transactions
      module Types
        class CaptureTransactionsRequest < Internal::Types::Model
          field :location_id, -> { String }, optional: false, nullable: false
          field :transaction_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
