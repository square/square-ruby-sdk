# frozen_string_literal: true

module Square
  module Types
    # The summary of a closed cash drawer shift.
    # This model contains only the money counted to start a cash drawer shift, counted
    # at the end of the shift, and the amount that should be in the drawer at shift
    # end based on summing all cash drawer shift events.
    class CashDrawerShiftSummary < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :state, Square::Types::CashDrawerShiftState, optional: true, nullable: false
      field :opened_at, String, optional: true, nullable: false
      field :ended_at, String, optional: true, nullable: false
      field :closed_at, String, optional: true, nullable: false
      field :description, String, optional: true, nullable: false
      field :opened_cash_money, Square::Types::Money, optional: true, nullable: false
      field :expected_cash_money, Square::Types::Money, optional: true, nullable: false
      field :closed_cash_money, Square::Types::Money, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false

    end
  end
end
