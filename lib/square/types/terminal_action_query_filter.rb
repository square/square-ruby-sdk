# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalActionQueryFilter < Internal::Types::Model
      field :device_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { Square::Types::TimeRange }, optional: true, nullable: false

      field :status, -> { String }, optional: true, nullable: true

      field :type, -> { Square::Types::TerminalActionActionType }, optional: true, nullable: false
    end
  end
end
