# frozen_string_literal: true

module Square
  # Published when a [loyalty program](entity:LoyaltyProgram) is created.
  class LoyaltyProgramCreatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::LoyaltyProgramCreatedEventData, optional: true, nullable: false

  end
end
