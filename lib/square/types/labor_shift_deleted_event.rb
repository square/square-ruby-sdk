# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a [Shift](entity:Shift) is deleted.
    #
    # Deprecated at Square API version 2025-05-21. Replaced by `labor.timecard.deleted`.
    class LaborShiftDeletedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::LaborShiftDeletedEventData }, optional: true, nullable: false
    end
  end
end
