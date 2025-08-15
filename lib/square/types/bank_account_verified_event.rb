# frozen_string_literal: true

module Square
  # Published when Square sets the status of a
  # [BankAccount](entity:BankAccount) to `VERIFIED`.
  class BankAccountVerifiedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :location_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::BankAccountVerifiedEventData, optional: true, nullable: false

  end
end
