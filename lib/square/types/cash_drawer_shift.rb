# frozen_string_literal: true

module Square
  # This model gives the details of a cash drawer shift.
  # The cash_payment_money, cash_refund_money, cash_paid_in_money,
  # and cash_paid_out_money fields are all computed by summing their respective
  # event types.
  class CashDrawerShift < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :state, Square::CashDrawerShiftState, optional: true, nullable: false
    field :opened_at, String, optional: true, nullable: false
    field :ended_at, String, optional: true, nullable: false
    field :closed_at, String, optional: true, nullable: false
    field :description, String, optional: true, nullable: false
    field :opened_cash_money, Square::Money, optional: true, nullable: false
    field :cash_payment_money, Square::Money, optional: true, nullable: false
    field :cash_refunds_money, Square::Money, optional: true, nullable: false
    field :cash_paid_in_money, Square::Money, optional: true, nullable: false
    field :cash_paid_out_money, Square::Money, optional: true, nullable: false
    field :expected_cash_money, Square::Money, optional: true, nullable: false
    field :closed_cash_money, Square::Money, optional: true, nullable: false
    field :device, Square::CashDrawerDevice, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false
    field :location_id, String, optional: true, nullable: false
    field :team_member_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :opening_team_member_id, String, optional: true, nullable: false
    field :ending_team_member_id, String, optional: true, nullable: false
    field :closing_team_member_id, String, optional: true, nullable: false

  end
end
