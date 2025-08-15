# frozen_string_literal: true

module Square
  class TerminalActionQueryFilter < Internal::Types::Model
    field :device_id, String, optional: true, nullable: false
    field :created_at, Square::TimeRange, optional: true, nullable: false
    field :status, String, optional: true, nullable: false
    field :type, Square::TerminalActionActionType, optional: true, nullable: false

  end
end
