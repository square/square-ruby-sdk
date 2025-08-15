# frozen_string_literal: true

module Square
  class CashDrawerShiftEvent < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :event_type, Square::CashDrawerEventType, optional: true, nullable: false
    field :event_money, Square::Money, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :description, String, optional: true, nullable: false
    field :team_member_id, String, optional: true, nullable: false

  end
end
