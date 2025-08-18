# frozen_string_literal: true

module Square
  module Types
    # Stores details about a cash refund. Contains only non-confidential information.
    class DestinationDetailsCashRefundDetails < Internal::Types::Model
      field :seller_supplied_money, -> { Square::Types::Money }, optional: false, nullable: false
      field :change_back_money, -> { Square::Types::Money }, optional: true, nullable: false

    end
  end
end
